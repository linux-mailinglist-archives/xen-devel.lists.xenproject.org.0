Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A3543602B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 13:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214342.372851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdWBa-0004T6-QN; Thu, 21 Oct 2021 11:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214342.372851; Thu, 21 Oct 2021 11:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdWBa-0004RI-NA; Thu, 21 Oct 2021 11:24:38 +0000
Received: by outflank-mailman (input) for mailman id 214342;
 Thu, 21 Oct 2021 11:24:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdWBZ-0004RC-DB
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 11:24:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 786762b4-3261-11ec-8376-12813bfff9fa;
 Thu, 21 Oct 2021 11:24:36 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-GDunlEHtPrSX6N289OKiWg-1; Thu, 21 Oct 2021 13:24:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 11:24:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 11:24:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 11:24:29 +0000
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
X-Inumbo-ID: 786762b4-3261-11ec-8376-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634815475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28n5/3JGSx05ZTYkCn1qgK/UejdJp4oaBAIggQEUfwU=;
	b=aEpGoqho0LTPIwXINTXSpNv+U4ri7N9rSN9cGUMRZYqCRcqEVYylfsvcxFmcAWOW7oaWX8
	1y8oAJ4m8Skme+vHuFHkV9depJkd8PgVvVgla642iIU7eoTtT5ByWTBa5mmIJETlooyWZb
	bK4rI8BEKGTXslw69/gKxYocfX+aobA=
X-MC-Unique: GDunlEHtPrSX6N289OKiWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVFIH6WteekwIKFBrSdvN6cGstJHdllkwOh6izis+tiJ7sqZ05rCoSazADi2yEJF8f45gWeCCxPlnVSUh4uTP4r/yDGg1rePksbGfdnHJ4q6VbGd+LAZdHGmntmzn7R4zEALfs46vt88Z/m+CbIEW/yTdWVA+Y1spJLoZyJgiQ5pozgk+5cSBcSw6hX9tMmPlsKLUwzXyM0kg0SBYk79dTidKepMqxduoyC9oYSKHXYQMDPz97XbbwzooVlhVNWPc/fnMn9JLVhVZVHWUtuZbE7fgNZ8Rjgoswe7UXuDsGd/CdsMBnSDVlkzdQSEGpgSnXnfkZjlAV01n9cWcz0guQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28n5/3JGSx05ZTYkCn1qgK/UejdJp4oaBAIggQEUfwU=;
 b=kU8OshWG9PvWHKHEhIYFYm3T5pH4kZg2It0f0yr6cjU5OVbjLKRx1UCg+hAU6FkQwE8OAkdeVHjtJuNVPAFA0rGs6qWv0huX6rJA4SLXQQD5YjnnQ/kiDLr3i5ZN7xA4HXmm48H0AHC8EfVM3doxdWNkRle+dsTY/GQ4vN6KrciKH9PK9qyBzHxetDm/xwe+cXr1Nb4gHwVJc2EtDzHvbu2uqJ5I8IkB4w3X3Aq7hjteMxPy5VSUnqB6aCNw+shvQSPebXeb1lPzpa9hAhirHx7MZO3RBJoSmMgWtOdJLoicxJ7suF1uymdJPHeiDRHdOkiLjjUjM2Wr1Yj144qzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 42/51] build: grab common EFI source files in arch
 specific dir
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-43-anthony.perard@citrix.com>
 <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com> <YWmse5Sv2SFyRMdj@perard>
 <fd11108b-db66-3c0e-9a7e-a5e30b0b5b1f@suse.com> <YXFJD3LlFfbivA6Z@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <938f059d-9d08-75bd-01ee-5d442a5e9961@suse.com>
Date: Thu, 21 Oct 2021 13:24:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YXFJD3LlFfbivA6Z@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab389f7-59a1-4b2f-a838-08d99485592e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61743D9459921778B3BE7FB3B3BF9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ot7biLFmVdXH+sYDy0bpFQRzpL7foCl2XHVNkrrCDVhFQmzrEyzoIXnVvpcWwWK2VApBWyRo0TiYBvikkayg3MuTrl5MYd19jlrqZpLI0e0sfMBUMacOF9HSlJ0wM7OnrlTBWvQJSiTSkVsqmpEPuwSa/REtjYJtgLm127Gc0O2ilFm8d2h3K9PQfGR1ryQVcjl/mueVE0qIYpMPi9f4AMgh5e7z2X1PCtju1nCI8kqIu7amabzg/8uGZjGOagtNlMNoWXiv9n555oI7v3XSbiGJGF6TshHTC6OYow1QMQFdI1mPQqT7D/oC4GSul0BloEQhEUUyhDtYLh2CKc+1654+xO4SVnUeHk3tZZ0nw2EZMVvPbrToKfniDtggCRGDu/RFIDpvu54xRlsMFit76O8qNB0eVfkLjP+V2Myh0GpUO+vHew3WNeQvH3yB7QoXXmLvfYK31ZykoUCqkTJ0LTvS6DJ7HX2pUqnnhTQaALC5gVnlqyByVsobFNVoA/YBgAzsp7IkUdRDkYNmcJVAzFG7Ntw28koqdHCRh6Mz3ADlA7BmUxv7MgKH3lKoKSgkO545U5WZRgo/33nDC0RROZ+l1284yjSzZP1FXhqaRkXIdSWB60WTXSEgdMv5Km2eN0xPETD0R5RzW94HIXjRHp/K5XCRIkiynDTIVXZIzuTyLjVpCaF6F3LEVDd+qQzH5uT0Iwsp/Hg66ZWXEJ8rnJCL9AReYqQgeJQKwZ6bcn9ppY5RT0al1H5iGSHjoDuW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(53546011)(2616005)(5660300002)(6486002)(956004)(8936002)(508600001)(66946007)(66476007)(54906003)(38100700002)(31696002)(316002)(16576012)(4326008)(2906002)(7416002)(26005)(86362001)(31686004)(6916009)(186003)(8676002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEcyTTQ0cFpKOXRlbzUrUHQ1b3RuZVQ3dXFXbko5djd4ZlBKWC93UXRDUHN3?=
 =?utf-8?B?SG1HY2xnSDFJNHdaMFdnTnVpMlFmQ3U0TGJhYjRzN0hoRXFyUGZId0lWRjhF?=
 =?utf-8?B?VlNTZGsxRi8vK0o5czc2bDBFNFFpOWo0NmxNMmhsMUNWbllxb1FRS3BZSkRL?=
 =?utf-8?B?bTlxa1NQMlVCa0N5NTFsZ3o0N3NrVitoakUzbnh0dTZWdC9IZG1IRmhFazVt?=
 =?utf-8?B?V2oreS85QWpOVnBscnhsdXVncU1pSzlsMVVNaFY4ZmsxNTJPdjRscnRCdlc0?=
 =?utf-8?B?bVRGeHVmT2NoNjRaaDBCUkdSa3pWVnYvY0VQUXR1WWpGOXNTdkFlQjRoaVZV?=
 =?utf-8?B?N3QwZ1ZVaFd1OXZmUGNJdm9PNmhCLzJHNTlNbFZmMTdUK3dCZmQyZUdyamZL?=
 =?utf-8?B?c2Z1RUg2aEhmeE9HK2FOWS9ESno2T3RJY1VadTRiTjBTL2ZrcnRYcjFwQnZu?=
 =?utf-8?B?V0V3Rk4xOHlTbVNkZjU3aFlPT1Z4WXBlRTZvWDRpVC92bGdXY0FhaEZ5QTVz?=
 =?utf-8?B?MWlUQ0xKRWhBU2lHTlN0SXZPV1JrVElrZFlZSFI1T2VkR1N0SzRyQ0QrZndt?=
 =?utf-8?B?RWNoK2FzeVZJSFhPY1FaWG5VUjJCZjljOXpXWHU1ZFZ6dFJnV2pWL3VBMmI0?=
 =?utf-8?B?dFNtWkRGaHpJYmtrMUdlV25xbVhvS1dmcERnR2lWN3U4YWtpcGRwOXVNbnlJ?=
 =?utf-8?B?U1RBWUU0NXUrSVY0OFVEWFlvTXUrOHVLWURuN3NkYzhXMllJazNEanpCNHhF?=
 =?utf-8?B?dWs5Z1FPMG1WQ2ozTFM1NU1TU24rUk9DVTU3Z0ZXMEdBWTcrK2Vlb00vYllH?=
 =?utf-8?B?WnlxYmhiNTU5RVlLdkpkTTZqbkgwSUZhQ3FhTmZFMHowN1UxL1E5NVBKZ09E?=
 =?utf-8?B?L0w0ekVFb3piSDFwYWJsNTZ0MTgyc3pxRkJQUldqVW1jZTN2eWVmV0Y0R3Y3?=
 =?utf-8?B?T1o3aVhaYXh4dlZ2RFI3K1JBZ0RqeCtvZnBoVkRHQ013WFVWY1g3LzdZeHVR?=
 =?utf-8?B?RmR3c0xyR2FrWlhWeHdtV3U3VjNPYW9td1g2WkVsaGh1STlqWkxQMUFZMENh?=
 =?utf-8?B?U1pSNzZHUkNWMHJabjZzb2NKY29JKzN6dFNvQytwNFE2REpCZy8zeTZBNDlM?=
 =?utf-8?B?OU01bTBZZjRpRzBlY2t2M2VDL2hJNEVLTGhXWkdlTWF3amlDYlJuNm5ZbkYv?=
 =?utf-8?B?NmowdnhtTVBkMStIWGUzNHRsM0NQMWNKMmlBZW1CK3pMTm9TbVU5S2U0YkxJ?=
 =?utf-8?B?UGFqL0ZiaWlEb3F2MDRheHZtTjlOcUVhQ3RLNGE3RjNYSlJXcTZNdzZjbHEv?=
 =?utf-8?B?WkM2VVdYakhwY0oxdVlvYkRTRkY5TFRqYzJHeDBjTmJnYmU2ZStTc01HeGp6?=
 =?utf-8?B?ak9NdnUxMDIvSVN4SzNvK2IyeEpVTVNoWFArcG5QdmhQL1JpZlJiYmIwODEy?=
 =?utf-8?B?eURFajlSSHVXbkhTZEtmZTNaL3FqOWxzMW54bE1hcVVJbU9jWXltMTdZaFpx?=
 =?utf-8?B?QmVPZlFpc09oa3h4YVBOMFExaDdLTjVQb3lmU1hXY0o3Z3ozSTZCSzdhZ1ht?=
 =?utf-8?B?Nld4SGdFZEFhL2xCaWI4MHIraE04M1I2bGdWazRJVkVyTHhMQ2ZieVVlTkg3?=
 =?utf-8?B?MllvY2tVM1E0aHo5dlFTUFhCY1RsbkhXcHZCU211M2lFL015d2xTanhJWXli?=
 =?utf-8?B?dWoxUFVSV0NGVG9DaUR1ME9qTFlZY2U1QnRzN1JHVGM1a2lrUXV2Sm1tOS9G?=
 =?utf-8?Q?NQaAA+9d7T7KYfrsKmT9eOWOqu2eUlPm75vuQTs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab389f7-59a1-4b2f-a838-08d99485592e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 11:24:29.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 21.10.2021 13:03, Anthony PERARD wrote:
> On Mon, Oct 18, 2021 at 10:48:26AM +0200, Jan Beulich wrote:
>> On 15.10.2021 18:29, Anthony PERARD wrote:
>>> On Thu, Oct 14, 2021 at 10:51:44AM +0200, Jan Beulich wrote:
>>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>> --- a/xen/arch/arm/efi/Makefile
>>>>> +++ b/xen/arch/arm/efi/Makefile
>>>>> @@ -1,4 +1,10 @@
>>>>>  CFLAGS-y += -fshort-wchar
>>>>> +CFLAGS-y += -I$(srctree)/common/efi
>>>>
>>>> Perhaps another opportunity for -iquote?
>>>
>>> Yes.
>>>
>>>>>  obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
>>>>>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>> +
>>>>> +$(obj)/%.c: common/efi/%.c
>>>>> +	$(Q)cp -f $< $@
>>>>
>>>> In case both trees are on the same file system, trying to hardlink first
>>>> would seem desirable. When copying, I think you should also pass -p.
>>>
>>> I don't know if doing an hardlink is a good thing to do, I'm not sure of
>>> the kind of issue this could bring. As for -p, I don't think it's a good
>>> idea to copy the mode, ownership, and timestamps of the source file, I'd
>>> rather have the timestamps that Make expect, e.i. "now".
>>
>> Why would "now" be correct (or expected) in any way? The cloned file is no
>> different from the original. Nevertheless I agree that -p is not ideal;
>> it's just that the more fine grained option to preserve just the timestamp
>> is non-standard afaik. You could try that first and fall back to -p ...
>> Otherwise, failing hard linking and using "cp -p", I'm afraid I'd prefer
>> symlinking despite the arguments against it that you name in the
>> description.
> 
> I guess I'm missing something, is there a reason to keep/copy the
> timestamps of the original files?

Avoidance of confusion is my main aim here. I certainly would be puzzled
to see what looks like a source file to have a time stamp much newer than
expected.

Jan


