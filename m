Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6BA70F5AF
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539017.839508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1n2v-0007PJ-0A; Wed, 24 May 2023 11:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539017.839508; Wed, 24 May 2023 11:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1n2u-0007Ml-Te; Wed, 24 May 2023 11:52:48 +0000
Received: by outflank-mailman (input) for mailman id 539017;
 Wed, 24 May 2023 11:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1n2t-0007Mf-4g
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:52:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ed44e76-fa29-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:52:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 11:52:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 11:52:15 +0000
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
X-Inumbo-ID: 7ed44e76-fa29-11ed-b22f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7CEQb4gtLqMfyzNokMedmBu7AxoOZ2gjmLWpYVfkyo0jjeZBi14CKC5i6d+l2EnMENp7sL/a4DJ9ZJnqOA1Xu7SPO3Ok+veOsmN+AAVxp1UiMj/4ibk87AUEU4YFyyJ8Wd0zX2/ch/oK/4CUlYdBPGT8q1oYAmd5DhDob72/q9rjqbBqouHGaO/y/arB7YYkRE/Lw75pyVJtbMW8Xh4t1BtF/+mK8anbS+u9zBiGgobGstgvABmMsq4oW5TfU7YvPb/tFFu09+P0YpmbJyX/FsikuLkpDmX2m0vl/WPWMxZbLIEb/EvwbKH0TJEmWk8Pu9xsTiUwyaJyaU7JAwrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rJonwk2U3lw/fR6Ok41tkijMS7ayKAfe4A66fj6cLI=;
 b=YBlK4L31kvDnrzIp7OSCdX8LrwC08kVyijdHOmqTRxfdPQS34aGmd52u3Gy6KuS+QzEXSutZwimlrQ8fXFeH+OzvejlWkjtpIOB6jIolgX1arvw8L8MmIphvoB7yhfFmZvGcj1dTxqJ9XEWYhIMsh0CRSv8iOP57CMrMow4nPpYvHzDElH7ur8Frk2J1dqFl/Cr8SzgatOgIAIQXMWBD/m1Jo/XOay7p104UVVrk/WN/yWGT7dprvyiiArsmyDeWYKV8OrvaXTU9gPkS9p6DS42UOv/sNl3UHlH5r7ck8eA6yluIChkQMSxE0rZKqpW7HE4+ODiz15m9GgfvUlaL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rJonwk2U3lw/fR6Ok41tkijMS7ayKAfe4A66fj6cLI=;
 b=a+WqLraY4TfgeCuzGmbs20NrLinRYfJ/bkW4hyqKojX2fqH7vUw3MDF8iY+6fhaKhM02In+7dBDVwvvU16mHZ6nkJ82SyYIDULREjeR41K4soeK3SzxsvVIWZv0GjULC3oykZqyPVscXfmVC7QL8kU0RErBxarOZnQblPZc0+NIS3lMc29ElfJlUgSOIJRs9ZgpNqhE8Ven1wkRNaOzklZrKPsCgQ3W7PWiJ+TkfrwPCEpjai7Njopp61mHm1gz9DX6BjHBIUUye5qwpJoIthxHv5d9MHcY7j4QS79f2YQYlnpoG/izmqhPEET0DJhVSGfFnWslh2xYLpKDDh/caQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc0389af-6bcb-bb8c-2e79-f41b6825b383@suse.com>
Date: Wed, 24 May 2023 13:52:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
 <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
 <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
 <alpine.DEB.2.22.394.2305231756500.44000@ubuntu-linux-20-04-desktop>
 <a08128b5-b6e7-8329-3127-96e171bb76b9@suse.com>
In-Reply-To: <a08128b5-b6e7-8329-3127-96e171bb76b9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee7413f-da8f-44d0-8e44-08db5c4d50f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EqjgldP8Z3UMIra+cvpjCc299C6Cv3PQ+NJpAl99u3LpBvTmL0jsHmdfivefdNd6xuEeyxXdnvtehJzmcq/f1llmxXMNSPBgKoQ5j1CmEq4q6k3J4hDAYhG6yt5U2ONMWbjnanwBn3Dbud/REjOazNL1wmOZ2i16ClgfORmbIu1mXNR2Ahsj7xE+2RClr1g7vjvRHTu4Q+9tYGkvXc3dtw0Z+6hZMfvsfFNj5gHyJpEfigiwrysAnzBMtzN8UbLTyXi5W7SEFmwkZshterB9N1wFYAGgzXQJOkOXsdRMSDBYz8N0MTfs9q2ltW2dXXlUk5+4F74Yp6Wk7vTuJm9m4fz7Un7uYsJeb/nNgOTzgYZewMCXN5PWct44a73PVP/o6GzabSJHx5YeeDFGjXHoThhkLnhrC3OjCWfWE5OecZLVNH4p26Lt1NCHbTonqhh3kpMv2ZprXvaHfBxU1cnyONldm/Bhb9JDENsmjKKjKfHbBQB5dL8qHNiDRA8lFynSu9+/WSrUaxohy3sxT073zAnsTq1PIDrPpAcLhZV1bTNdVTCb1/O+xaoEeqNCkXeSTl5c5IyVEhW6hgmeglphE5pROiW7jLXPTaMvrUHSprNlnafHOCHpiAlRr9NN7m2gvKxbYADrUPkekTYFncrFJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(41300700001)(316002)(4326008)(6916009)(66556008)(66476007)(66946007)(8676002)(8936002)(5660300002)(36756003)(31696002)(86362001)(2906002)(38100700002)(2616005)(6506007)(6512007)(26005)(186003)(6666004)(6486002)(966005)(53546011)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEdPRElpRjVrK0pLNHRTbTNjUGFBRnRpY3dSS2NnU0IxMXE2MFlHNE1DWDVD?=
 =?utf-8?B?WVRPNngrdkhoMVFibUgzbEdjemdZalBjNFlOWHBoT2tyVUJQZEo2T0g5S3Vv?=
 =?utf-8?B?RG9uaFpLY0FvUHlPTGtLQTBEYzErRHltNkU5dDM0VDYzQWx3U3RjRjY1VTlj?=
 =?utf-8?B?bVpqRGRzOEhQeGY0N1Q0bTlHZEhnclNSYnRXZ2cyL2NOcm1KWkNhS1ZLUUZP?=
 =?utf-8?B?OVZxbFVGT0x1cUFrVDY5RjlucFk4YzAvN08rVEQ3MEszN3lzU0MwQUpWUjFO?=
 =?utf-8?B?cEtmY1FrUVlJdGZUQTgxQ3M1ckd4dXhGWXhsNEJFdkpJOEgydnY0bUhnRUtq?=
 =?utf-8?B?N3FBaHNLRmtDVzlxMUl1aHE5THZmSXB2azYwQ1k5VE9jV3Qxdk9BalhZMDZq?=
 =?utf-8?B?WmZVVEdsdEhqck1MUnNOUWpCckQyVFhRSzFHaHJTM0lkaktPdkxkYnVMckpw?=
 =?utf-8?B?d0VxTDBWVDJFcHQwbyswbkM1UFZua1FlUnJPamVFN2JabXJuSDlsNHFKQ0hm?=
 =?utf-8?B?N1pkNFVJd09kQ2NPbzVEVlNIdHREanBzV2QzUkRTR1JsdjhVZFUxK21TT2FS?=
 =?utf-8?B?RWFxUDVSTkRXUmZmWDdYemZUT2JXOC9XVDZoL0NmK21UYVdMaVVqZVRPaEVY?=
 =?utf-8?B?UVFaZjVWcmlNMUxISno1dEZvcU94QkUzYytGUzU0ZTk1VzkxWmZRQ0QrdTlG?=
 =?utf-8?B?b3ZPS2xDTmlOb08vN1J0RVVWbEZHUHdTeENwYWZIaUtkR2JPMkxYeS9STUVR?=
 =?utf-8?B?ckszc1NxZzUwQ0FiUTl1Z2NJZFNrZXBjekhQY1JscWYvaXh5Q25RYXkzZGVn?=
 =?utf-8?B?LzdLeUlTRnZDUkY3a3BuK2lzK1RQOHZlVEJ3WlphMG54S3Z3bkltemNVbkhr?=
 =?utf-8?B?cW1FSHJxbGhmYk5MdTAvcHdGd1BDakpWYy9sSlVkMDVGSDRhb08xZ2hFTk9r?=
 =?utf-8?B?NmxVcEgrSlRDQ29oVmE4L2xJTEZnaHhEQUk4VVZ2M2w5TStYS21DOW1maWlz?=
 =?utf-8?B?VHgwL3Z1YnlQK2JLdjhZV3VrTFFZcGI4YVhSR0t1bUg0TWZ4dFZqeFlUTEtr?=
 =?utf-8?B?ZlgzbXhUMks0OGYxMXY0NC8wWWpoVzZaR1RKWiszUmNJSlFRdm1kcmdWNzZB?=
 =?utf-8?B?Mlp4WEE0VW5PMHg0c2NxZnFwNG9WTEExNnR2d3BxZU1SQ1NkUUZEeFJIZGpE?=
 =?utf-8?B?M0tDN3lXeFd0RFZpdEpXbis0bzlDUllUc3F4QW1tMXpITGI2QkdkWlFRTG1C?=
 =?utf-8?B?b2RBb252SGhjZVRmT09VaXZhZVEzdnNZWUNhTG5zMU1WcUFrVlR6WGZLWHhx?=
 =?utf-8?B?UDl5SVhmeEdsbjdMSDJIbEF0NEtOUndrRkxtR3B4UjlrQXo2TlprZkZDUXB2?=
 =?utf-8?B?cjgxeVpicmFVR3VyeFExQVZxQkYrRnpQbjNqSGZIQjV1UXlzRlRKTCtuaG1D?=
 =?utf-8?B?RXM3MEZybVNQcytFcDZhOGdTS1lUaUZTZittUVRrQlMxZFNTRmNpRmVGQi80?=
 =?utf-8?B?NW5KTjB0SlQ0U2FwZnE1L2l0L1NERTM3Y0hhOFlScVBXQWNmYWpEVjEwUU1p?=
 =?utf-8?B?YmlBWGVEWXVqcVQ2QXhHR2RTMHlCZFNzUXVPenBqeW9jRnRRUDVwK2FwUjY5?=
 =?utf-8?B?dWJnWUR4UitJZTJTUk11RGRlWEJQSUVsdzZiOUxDQzNUTGVsWDZNbVNKQTNw?=
 =?utf-8?B?b2JaZWlPUnlXbjNGY0NueDN2aW1rTUliZEV5ZGRzenVZeTFjeHFhZ1RRUVAv?=
 =?utf-8?B?ajFwU2VqcWNqa085MmtOelUzaHVoc3h0b01Cb3lkaGlueWNKMExXS1VvR2lG?=
 =?utf-8?B?Ujg2K1pmRmxuaklNalhwNzV2M3l4WUNHc0E5czZoT3A1TGhFRFdDMTNVSEt1?=
 =?utf-8?B?MVJtYUJVQkNlUHczUXRNQXB1WE8yaGp4RDd5NHhkK1hFSWJJU0F0d1RPMUpD?=
 =?utf-8?B?SjRwK3NqcDRHUUM4aW9yYVpHL2Q4STRmeHVYSFZwdEEwVjZUVkxFVzlWNnVk?=
 =?utf-8?B?cHZYSFNwejNXa2lwd1p5K1JPaVAwUjB3c3FNclJ4MnRuY25PUnBCbWViK3E4?=
 =?utf-8?B?NXhOTkFEWVhKZ0k5cEZHOHlXWFY2dEd6ZlYvUm5HTStyWVNwbkdYWmNCTlpI?=
 =?utf-8?Q?FBK6hcH/9Bz5Pyorfi5h169Jg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee7413f-da8f-44d0-8e44-08db5c4d50f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 11:52:14.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xko7qJnk8Va6c2aicqR1isThkw/cVDSBtjs1h7aX+oWAhrE/g3YddqOJLdONNyZAHQDyPUcs4YhBh04qofUIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

On 24.05.2023 08:14, Jan Beulich wrote:
> On 24.05.2023 03:13, Stefano Stabellini wrote:
>> For sure I can test your patch. BTW it is also really easy for you to do
>> it your simply by pushing a branch to a repo on gitlab-ci and watch for
>> the results. If you are interested let me know I can give you a
>> tutorial, you just need to create a repo, and register the gitlab runner
>> and voila'.
>>
>> This is the outcome:
>>
>> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/876808194
>>
>>
>> (XEN) PCI add device 0000:00:00.0
>> (XEN) PCI add device 0000:00:00.2
>> (XEN) PCI add device 0000:00:01.0
>> (XEN) PCI add device 0000:00:02.0
>> (XEN) Assertion 'd == dom_xen && system_state < SYS_STATE_active' failed at drivers/vpci/header.c:313
> 
> So this is an assertion my patch adds. The right side of the && may be too
> strict, but it's been too long to recall why exactly I thought the case
> should occur only before Dom0 starts. You may want to retry with that 2nd
> half of the condition dropped.

And indeed it needs dropping. The patch pre-dates 163db6a72b66 ("x86/PVH:
permit more physdevop-s to be used by Dom0"), and despite me being the
author of that one I failed to make the connection. Which quite clearly
indicates some other oddity, because in principle I should be hitting
that same assertion then as well when booting PVH Dom0. Yet I don't, so
I have more to figure out.

Jan

