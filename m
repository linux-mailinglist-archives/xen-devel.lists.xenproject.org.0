Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7E7DB554
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 09:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.624977.973793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxNpE-0003Pj-DM; Mon, 30 Oct 2023 08:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624977.973793; Mon, 30 Oct 2023 08:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxNpE-0003N6-AV; Mon, 30 Oct 2023 08:40:44 +0000
Received: by outflank-mailman (input) for mailman id 624977;
 Mon, 30 Oct 2023 08:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxNpC-0003Mf-RM
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 08:40:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 020bf8ef-7700-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 09:40:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8105.eurprd04.prod.outlook.com (2603:10a6:10:24a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Mon, 30 Oct
 2023 08:40:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 08:40:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 020bf8ef-7700-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKHKtSsTcws83mTdyBJQT4tgMCxRkW7etIWB8QsV0rHgPWV0p92J3y3v21sNPEeBl2NS/3AHG+4QVvJpzwrS2aoEo1NFhYczdEKB1vKu6YDwegUik4g+HrjfHhA7Jj11HTNSlHbH01CktmXq3LGCWznT/sy//51MfT7OOQkpvppJbeAHzUBkclhCmw7jOkvQL2dNY8OTzxAGZOPxHo8ZOBBHxZYSsgUux1EXHLmueufVX2woGJP6dllep0OeSZDEnW91py71n+3uDQ3QPK6Dglfbi+mAyJ1bmPNWqlfIA2OAkxmzCTBInzsdHERcnaXIBbXy19C+49JuFFsX/QIUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G7FCbPDqWyLnbja5Rlo1osDqVeS5fDDq/yuIpn+tqk=;
 b=XNoPk0sz6Gfh7TIKC+lUNx6IIQYZGbaCL0gi1NbqJj7xAtyLrYGJHrUnDrY2/kQeEcZKC6dBsvlpSddJRA+9/g8fGzMNzbEi0Bt3PWi5ydUsSnOYaKGiMacQArb3lTN1lCJgSRuVY/k7dNTXXcp2CoSSxLQ52TW3L0XNfbt/Oi9A9t+lFmbCep9bagmaoPWm2h6376BYmoyzt/yIflBABn6geYLirJNpnEMZRGUgY5WZhJqb9HKXqbvd+PWFFpaxG6rUxlK1wctciu7LBZ8XBO/c0hXCNmfmpo1ocA3bglPGB4Eh9xOmSYunX6O1wEmemKG4PssdamR/gl8COaMVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G7FCbPDqWyLnbja5Rlo1osDqVeS5fDDq/yuIpn+tqk=;
 b=GnvQCVlh9eKVEiryvo+UrG4DbWNAcEF9hJhvwb0wtaONUr5CV1IMzXE7Eowc0mwzHSTRUJ/H8eH8pKUBybsOIDqlqsnDYQ5T2dguIw79mCbwmcNzm0uuDiWfyOAt/1jlROfljtVFbbBZ9HcjGitdfx5muHIaFBUboWKTdxCc7Ac/mD/x4gzrvOLSrJM1v41grNsGBqc0va8Ap/0mSHIOkZnE/guBwL9no1XSEa/h6XQocLpi83PZFsh6Zr4tivs4ASHRal7WDpVuIDT329P8j9xrxPpsyXAe8gwL5sqxx32tgj0oK0t8y22+7N/MPBmgC1bzCHZGF35Ohuv3sldB/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78e56f41-cd55-d4ca-a3ce-f7da87d2b063@suse.com>
Date: Mon, 30 Oct 2023 09:40:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
 <70472259-6429-e60f-7cdc-faa50b2d257f@suse.com> <ZTu_WxdWTrthCs4m@macbook>
 <997218cb-b1d3-4fa8-a098-10849a54c592@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <997218cb-b1d3-4fa8-a098-10849a54c592@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b0adf6-0bae-4ff9-d6cd-08dbd923e4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eEwMVAt6uIr1PWkySiuR2UDL2I0IrOQ/1oRZKLUevARWwWTd91sKAPNdpsLW6BLiLbHp4agWeZVdd9BVsgsnnxfp2PRvYdU77kWTTKcz+st0NtoqcSyU5WAS7DJTpO0I+RrjcY81bms0y6af2ih+gdXrNrrkP88VAS/jmNyncFk2sNlXOAHnLJuGOofys6vf5PE7nvduUHSTG9bCURX+e6BhGHYYlgU1UeyuUrIHWtt4bkfWeYJbBC+yvdC4lGjVyBXFYkc4sx/ShkinOLk4+fx08At0sAKSID9pfkP4LT1xW9+bWXNYnjINZGrcQsS5a2wYAlbJbtlGccIjQ9TpwBs1m68Hrfxlc7H5azXMysHONCGjN7VlwqjHyzCGRdWRp7Oqd0ZyXTzLjv1eLojid0kNjp11LDZL6AyimvgRYjevylaJn9YQfbMG5rXCsQlgJ7C0PxFfQ/1MH2b1pSjy2bZM2B7dZmH9nM9WEUuraV3ANv63V592azy1dt4SQYQ8ABYXODwXCJ6GEl0jep3Bt5+6dld3Rs+lf1tXnlez+qdcz6AEtcrRSPHIanR6LPHPKMOnVxiWZ2f57inKg9KxPdpm1ww9kIrs9LgtC7q19goZKd8JgoR2ajfoQtgebvOreaOa7EQiDyMzySs1vuv7tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(26005)(38100700002)(6916009)(316002)(54906003)(66556008)(66946007)(66476007)(2906002)(41300700001)(4326008)(6506007)(8936002)(5660300002)(478600001)(6666004)(53546011)(6512007)(6486002)(8676002)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzYwRUZYQ3d0aTBWSkFkUkNSRjVNa09tc1lhZzNtTnF5Wit5QVlsMW14dVJZ?=
 =?utf-8?B?TUxGMzVPV2kxNmo5YmRqbXMvUktFUUNCV1lQaEVIZDNDRm1Ua1l6TXg2bDFT?=
 =?utf-8?B?QnVvcDFnci9kR3ZXQkFFY1RlUVNCYU9jbTAxZnZ0MVRIMllTdFl1N0x6WnhC?=
 =?utf-8?B?QVZiRGpjZmViNEdjaWJVUVJWUkhaVm1wUG5TeThhRXgrUTY4b2FFWWpUSDFH?=
 =?utf-8?B?UVVVMjN5Rm9VazBmR3BxQ3FKNC96cFBOdW91QXZhUEhvRHdtVmdSSG8xQ2x3?=
 =?utf-8?B?QmNmSFp3SXRwQ1Y2Um1aanVETHpRcmpXMnI2bEVaSGpEU2w0aFlDS2pabTdN?=
 =?utf-8?B?QXk0bkx1dm5McFp6dXpmVGNUakFmOHBoRGQ1MzFSVlNPWkROV3BIU215bEdK?=
 =?utf-8?B?NHZOMFV5M3o2SUJreGpXeWJaNWNqZzNXZGlNbHFkYXNlSXhMTEY4MUd2b2hZ?=
 =?utf-8?B?UEkyS3RTTDB0R284UmF2djJQUzBYZlFGN3dUYXdxYjRabWFlbkszTDhrSGUv?=
 =?utf-8?B?cmh4NWxXZGIyVDdZa2xkK0Z2RUtqTVYwNUNtZWNrTHd5UG1QZk0rR2xSSWgw?=
 =?utf-8?B?S0xaaUdEQ3R2cWx4SHdUb0pJalZET3BlUHVHbjh5Y0JwcVdmQkdBK09vL0RM?=
 =?utf-8?B?VC9iN281bTVFY0Q4UnFVbk0yYWd3Y2NSb2FVTS9neHJVSlE1TE9VVnA1OW1G?=
 =?utf-8?B?V2F4YnVDODJ1Z2VJYklRazZHWllkYTVsdkU4MW5IbkYvdmFBZzA3cmpLdFhw?=
 =?utf-8?B?cXcydXdTckpmUTBSZmlEdW5tM3p1NWNaUXFHVytmSDRlZ0hQMitjUldQWlE3?=
 =?utf-8?B?amJqOU9yQ0JKN1VFVGRrTW1MTHZPQWk2WmFaYXlNQTJocFM3Qk5wcW4xUEVJ?=
 =?utf-8?B?Y0FXd1dtRERJNUExZStidUtMNWZySVpyd3hKOWl6TFpFY0pYQ0FrOGJxV0JM?=
 =?utf-8?B?QUx6Mll4ZzVEMk1xWWlIQXZ0cEJYVm9NNXhMcGpaS1RUTVIxZTUwYnU1UXQw?=
 =?utf-8?B?cFdUdHEzYm5xQjNvWGovTFk2d1Z3aVllMDQ0L1BueE9DSW4yS2FLTVFVNzVk?=
 =?utf-8?B?NVNVWTAyRW1uS1M1M2hOc1NEVXhXTStFcDRUQ1N5M0VvNlhra2RNYU5rZkdu?=
 =?utf-8?B?RTdoQmllbFAxTW84Zk9wb1psbnl0SzBvRmx0Z0oxUDBRaXRKTDRObTIxOEdC?=
 =?utf-8?B?SGUwektDajhWaUlZeGtsZzlNVFJIaG1OenRHSG1UMmlUdlZLVzJMSklQSXZo?=
 =?utf-8?B?VzEwcm9jZ2U3RWUxVjZOZUJRNDc1eVZ6UHk0cEhQNS9YR0hPVnJ2NHlaZ09Q?=
 =?utf-8?B?VVdsOGhDb2xwa29QWnM5SVN5aDd5UnN4MWZNTGJUeGpkaWR2cHVzdWk0SFRN?=
 =?utf-8?B?LzB2NTJuMmtqTTYvTXhzcW95SEErR01CK0xuN3JocDFVVjlHcUlkM3B0eXNw?=
 =?utf-8?B?UThjeVhvZ1JxQzZ4UUlZcnQxaUpYUktOR2xCSUVwZDdpalZBZGpaRVdQR0hG?=
 =?utf-8?B?TiswNTZ5WlFFYnVTMnprdEExNk1Db3pmWG9IS3VZZzZBNm1EcWNrMDlOenBI?=
 =?utf-8?B?eVk0QU51aG44c0RsdWV4Z1VHOWpzdVluajNmdG00QXNwL0hyYUVyanRyTitY?=
 =?utf-8?B?Y3VyaFFnTCtVTk1lZ2thNnZENDU3UW1pR2JMY3M3bmVSMnIvMGY2SWE3VURp?=
 =?utf-8?B?RUlMbnBpcHo4dnZwVXUrSzJHMW9qeXJuZ3Irekd3NU84VElGY3N0RkdKaWlN?=
 =?utf-8?B?ZUo5RXc4WE5OSUs0c0x5NU1HTkVzUEtmUWVKY1AwV3Byc1R1UnhwNVIzY05N?=
 =?utf-8?B?VDU0ZlE0NzN5ejFFOFkwMXRkaDBnaC8wRzBEeTlWb3E1aUtHNlphL0VrK0ZM?=
 =?utf-8?B?SVN0NEJJMy9oSGZDR0h0U2x1Q05uRlRadU94L2JiSU16czFHL1dpanRDNXlL?=
 =?utf-8?B?RG9aeWRqdkdXLzFWUWRwZEZNSmt5Vjg5bzFXMHNvNUtFeDJzWGZzcmp0NHFr?=
 =?utf-8?B?eS8rQ2FjT2F5MTF4aUlhRkl5T3FjNFB0MjJUaWw1bmU1VnNzenlPcXVMaFd6?=
 =?utf-8?B?Y1ZWMGQ3dWFZTkZ5K2htQ0tZcHl4VDFobkt5Nnl2Z2J4WmNrbGM4OTkvOEN4?=
 =?utf-8?Q?Jh+bBjYhS+tdYaTaFDggHyelf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b0adf6-0bae-4ff9-d6cd-08dbd923e4da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 08:40:39.1199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wi2+PMY72XxCRbHuqZlRZSIYBw2pyn/l82Jsmt4c88ob8Q8uSJz+ACGYgWkpNyaSzHGAd1c2yqNLbvaqtn5LfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8105

On 27.10.2023 21:18, Andrew Cooper wrote:
> On 27/10/2023 2:47 pm, Roger Pau Monné wrote:
>> On Fri, Oct 27, 2023 at 09:12:40AM +0200, Jan Beulich wrote:
>>> On 26.10.2023 22:55, Andrew Cooper wrote:
>>>> We eventually want to be able to build a stripped down Xen for a single
>>>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
>>>> available to randconfig), and adjust the microcode logic.
>>>>
>>>> No practical change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>> CC: Stefano Stabellini <stefano.stabellini@amd.com>
>>>> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>
>>>> I've intentionally ignored the other vendors for now.  They can be put into
>>>> Kconfig by whomever figures out the actual dependencies between their init
>>>> routines.
>>>>
>>>> v2:
>>>>  * Tweak text
>>> What about the indentation issues mentioned in reply to v1?
>>>
>>> As to using un-amended AMD and INTEL - Roger, what's your view here?
>> I think it would be good to add a suffix, like we do for
>> {AMD,INTEL}_IOMMU options, and reserve the plain AMD and INTEL options
>> as platform/system level options that enable both VENDOR_{CPU,IOMMU}
>> sub options.
>>
>> So yes, {INTEL,AMD}_CPU seems a good option.
> 
> Really?  You do realise that, unlike the IOMMU names, this is going to
> be plastered all over the Makefiles and header files?
> 
> And it breaks the careful attempt not to use the ambigous term when
> describing what the symbol means.

I wonder what you mean here: Describing what the symbol means is all
done in plain text, i.e. independent of the symbol name.

> I'll send out a v2.5 so you can see it in context, but I'm going to say
> straight up - I think this is a mistake.

So in the longer run perhaps we want CONFIG_{AMD,INTEL} _and_
CONFIG_{AMD,INTEL}_CPU? The former mainly to control the defaults of
CONFIG_{AMD,INTEL}_{CPU,IOMMU} (could also be viewed as kind of a
shorthand)?

Jan

