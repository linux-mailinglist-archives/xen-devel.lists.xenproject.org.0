Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE672D9F6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 08:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547799.855389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xb2-0001Ai-W7; Tue, 13 Jun 2023 06:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547799.855389; Tue, 13 Jun 2023 06:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xb2-000180-SJ; Tue, 13 Jun 2023 06:33:40 +0000
Received: by outflank-mailman (input) for mailman id 547799;
 Tue, 13 Jun 2023 06:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8xb2-00017u-00
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 06:33:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b01cf3a-09b4-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 08:33:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 06:33:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 06:33:08 +0000
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
X-Inumbo-ID: 3b01cf3a-09b4-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV7q0u+FNSjsus/y733Ner8bYahQi6u+f4Ht6vUKsr1Zuhnmsv1FSpiSIa7qOjxo672c4KWRU/RCNyD6ezrVqXRaxj/lSQC6LEuaOOet2Op/BGocpu+Gv6BI0cOSakjoIogDN/xjJGheZo7RhRawoewKaeQ0nRft/3gZk/kyWn9qwiLIFTIQ28LURHHldl0xO57Uku2vqP0WxsqyjR58+ZmC4oGsrvlKqkq9koKAtZVoqMV8LevNgrfD2ukfPR08/BuZ6jJw9t0LEu5ee7+zUnOBxKhyVA2Sb7sWCt28lOpIu1hVCFbLRVs0eygQlEIcpCt5f0GEUC5QUpTGnvZ5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nTSCP1DrphARgb/sSss1tiuIipQY1cAGUSlHw5dzoU=;
 b=dAbFflAHy1jgt3RBSUDsvmGhyF38Tl5MeMPL4KKHFSmWKmI7ZDW1s5u1OH2QF1REjqQvsJGWRPCactJToNuVKqPW8ZgFeYrp/80Rww85R87QAJIY9F/qfom2MJJCgK/pvsZGd24VyokWDhHApRp65xH34H0E5IAw5eF04fTXVHYT8qBDx22wLN7A/Y2Rh7XHmHyTxB8is4NeQNbIRznN8lOK4hIDQysZTcVm4K2FMLfeCrIGWbpUpWJWtnil3Ks58suA85S784H4k8wr6lmhIP0i8q2wkZ+Zf5J517QN0ZlaQNJyZ1xiwJVyxral1PsLDZHmpkxJaWYhTnlttJ5dsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nTSCP1DrphARgb/sSss1tiuIipQY1cAGUSlHw5dzoU=;
 b=PEhPzrqSixlBImSGwp1YAeVqX2IAECplY3ra9wu7rkV90qbvcN942g86k3Ikb+W4IfkEaPOMS3+WJsE4ARcoYvscGpCf41GXGzGBu+IPcBh2XNUwgUqPmLldG3KrIilbzbk6g2VniSRS4abz5IErFmldsfR/7wY/UjXakpHj5SWzDX3pcJYvpT1kSevLRNHii/r5S/pJxJcNlh4X6e1T/+E3ch7hRLNQHFRI3wu8EF2zkYwIG1LJDvO2DnJaoPl+PMrP5tpUl8MccHWF6Fv9HYuHILFukN89UUvVEIZWWFbVW7uLCHRxOrvxMfL22AiiyE5oz9Pe6wgnkl4fMXtRwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10f2d41f-b34f-207e-eb73-d53f31385d8e@suse.com>
Date: Tue, 13 Jun 2023 08:33:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
 <fba4a77a-1d9e-6f7d-9b07-26481e7098c4@apertussolutions.com>
 <a3c7752e-cd99-d90b-376d-bbc60cf4a967@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a3c7752e-cd99-d90b-376d-bbc60cf4a967@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: e185c14d-df01-409b-9be4-08db6bd80d39
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CDBsp2H/cHZcgPjWBarfWJ8NUqY8dBZIWmjzNdOS9YjFlqiEbMqfSOXgPRZwAPR+JMFuMjxVg23npzpd1dpvyjtlEuh/x5T0TYr8zJ+MFIKtNhaUfDL7L4B5XcKCgNDRajXHWvk8a3iybhTTvJ+A+ctCfKtczX1t6a1x8n74W4Z09SDm6H5/DO5lS83gqpOw5qcVBZ9s46sa4LGgPq2cxRW65f8hQaswhx1oHzao5/exg/AZoPUEkOaYd3BVMlShrZKzQyy++AlTHtYj30YvGwFDh1fJvnXfNK1T49RHkI7DBELSHU6A7CUp9ONDgxljKO56kD5tFclaUW4VHMyYHMCYjuCN0/hjh2Vawxxh4lW1daz3b9KPLVVWtz60kTUb4zv2GYO+R/tQ5JZ24rZzBpZk84bURwZPiqUT/T4BmKRT3BHzYaMZSGplH3M0V9GNs1eoRQTTpOcGGqWFrWCRgFZl07u23aWjBcqO++qmMZfGMoIsvK/8Z84jUDCk2OJMlpNQUriwiEOKOKzturvAa9doZl/oGcF4yknDR4u/q9ZqdzrVVLDESPyWMtewh7dWFUT2fqZL1NFS5w2O9FrmGkO5gxEj+rS4o/KMf9U9ucZ7rLuj3Rhbj+Y7rfjly9vI0tnL2190yq7xxmUP2yTg1LG0lu+E7kt5FwM7uZmQaHtXwMoDey00dWl4ZxE+x2w+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(31696002)(86362001)(36756003)(38100700002)(478600001)(6486002)(6666004)(54906003)(8936002)(8676002)(5660300002)(4326008)(6916009)(66946007)(66556008)(66476007)(41300700001)(316002)(2906002)(31686004)(2616005)(83380400001)(6506007)(26005)(6512007)(186003)(53546011)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1wQUcwUFJUWG9KTTVGZXlRMXJXaXJ5UlFvcjREaUFjT3ZJOTBhSFh0N0hU?=
 =?utf-8?B?ZlJVQmRpK3A1L0lDM0g2U1V3NklIcVdWU1h0SlBVWGNURFNKbWNEMUU2Rk5Y?=
 =?utf-8?B?Tm9kRU10ZDI2Tm9nb3dqNFQ3dzdtS3c3Zlk2eHNVdXBadmJEWFlNZ25FRVN4?=
 =?utf-8?B?MExqYW4rRHUwbGlQeUcrdEpsbVZLeDNOT1BXUTdsNk9hdFFXS3ZISnNQSTdE?=
 =?utf-8?B?NDQ2bHNXRVZpQUJ5TCs2cHgyTDdBd3NuczRNOEF1QVF1eHNPUnJPMi9xUWhy?=
 =?utf-8?B?eWV4OUVDMkRvcGpraFlIRHdtN20wS1I0Wk5ad0xINmxWbjZCbjV3TW5WUU5F?=
 =?utf-8?B?WkhwamZYL3hVa1dVa0pqejVKeUZPSWtXYzhrNlh4eSt1VU9yOW1WWlRGakts?=
 =?utf-8?B?VWVTL0VJbVBHNDhTamgrb2I1S0p4ZURyem0wV0p0ZnFITU1ublhFS0habGoz?=
 =?utf-8?B?a3pnS0ZTdi9TU2tsdDd4ek1ya01FOTI5RmM2b005a0kxVjdvaE1FOVdsblov?=
 =?utf-8?B?cHR4Z2FWNGNBRm00NHVRc0VPQzZFK2JaWXZOUDE0bmZPam9VTFVnR3d1VXp0?=
 =?utf-8?B?UDAxbVlhbzI1NzB2NGpkTmRlWlF6VFVPcjkvaktMTWxveHVpeUcwNmtjNGJ1?=
 =?utf-8?B?QUVBb3JuTmhjcXpGTlJIc2xTNHNCMFovUGFUeHE4dDZHb05wQ1RHNUN5SndI?=
 =?utf-8?B?VDNKUFdmU09PWmJGUit0OElXTmQ1L2Z1NlEvZjlNcWZxTzNzeERuSnNBUnlK?=
 =?utf-8?B?ZWFqWVRiTVh0amc3SnZ5L0xnaWlRSXBsMjExck9BR2JKSzdLSVNiWEJvdEFr?=
 =?utf-8?B?eTc0eHNiY1hoUmlvdDNnWjJ2WEpCdnA4VFZjY0ptZ0FXMmRSWnBUaHdERTlZ?=
 =?utf-8?B?ckRtUDJSejM2emdDdCtQT2prY2RBaXdWNmd4b2JURUtwMkJRY3pQTWZkcC91?=
 =?utf-8?B?NUVpUXNqcXZZOGdyQTFBcXNoTWRBL25PZDRtVVN6NUd6bzJ3QW1scS8ycWVi?=
 =?utf-8?B?czVWK2lSRXI1KzMvcFdRTWR3Uk5QeVdEdTY5cnEzQ1Zsa0l2dlM2LzNwV0NH?=
 =?utf-8?B?Sm82ckxsc2RROGdsam1DREdCVUVsR2JyNG5pbDl2ZzNpcXdId0R6YkxsMFFm?=
 =?utf-8?B?NjdxWStnMDQwZmhrcEpVdkRORk5oaDJpeStrd0tzbEZCS0xyaE9URWZENTcz?=
 =?utf-8?B?cHNUNnBkOWp1VjM2dE1PQjk1M0dMVHRHd0ltbUFyNkNoeGQ5U1dzVXZJcXUy?=
 =?utf-8?B?cUQ5VlM1RFkwR1BZZVlBY0JabE5DNzNUQ3Y0SWlRTkZuTjhvOUJOY1VyUnIv?=
 =?utf-8?B?YkwxbVBISkxVSkUvSGlBbnpyQVh6ZjFFc2tEa2N4UUoxdGNhQWNjNXJHbFVO?=
 =?utf-8?B?L3FtWm9CNXFCaUhqdlRmWWxYazZqT0I5Wk43SFdkY3lWV2FENWtENGsyVHBy?=
 =?utf-8?B?THVrdzErOVJlMEJEL2JFQ2NqQjhpMnUwMGJiZkZKUytFK3l4R1o1c3ZIc1Nx?=
 =?utf-8?B?Zmt1dU8xRzNUQitQSkVlRnBIN3djTHhkNWdkaVo0b0NQWFdYWmhWZjdjcnh2?=
 =?utf-8?B?Mm1Sd1B0OVFNcUQzcDlSQ0FZbUhYNTY0dmJWUjJSWDNNK1hRZGREeXB6THdx?=
 =?utf-8?B?MjdaQzRRQ2ZaZlBKdWR3NDBoLy9zNllnRGRETStxWnNvZFNYUlp4bFIyYWRY?=
 =?utf-8?B?Mi9CUHc2WkxkalpldUljeXZqV1NzZS9vTkdqVGdTOFltUDNmc2xIdUlEUkFO?=
 =?utf-8?B?bzk3ODF6RkZMd2tKaEhNQ1N3Vm50TnRsY3hqWGsvWHdUQmdMUDNBTW5FdHBO?=
 =?utf-8?B?dnowclBOZ0JwdmhDT0o4eHhMYXppN3VGaVJLdmRuTmtpMDR0K1Z6UWxjdFg3?=
 =?utf-8?B?cEJwblR5U3BSeTFwbjhVMDQ0V0V1MXg5cVk4eXNxRXo0Qnc5OExkc0hTdEZr?=
 =?utf-8?B?NlVaejBaTmZlZzVkUjZuU3NuMnlhMW93a3JhcmxZaWtmZGxNcE9tZ1QycU1x?=
 =?utf-8?B?MG5BUVhDMEh2UEdCQXh4am9ISFgwOHR0WWY1SStOdU15UHh1aHU5TExWcG9s?=
 =?utf-8?B?QVVGQ2N2MVFRcmdlZkE2eHpZd0NpNGpSdkFUMXFxTE8xalhEaktTZU04RnZ5?=
 =?utf-8?Q?xo3RzT25ZXMkPXEx+CEBrLqlP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e185c14d-df01-409b-9be4-08db6bd80d39
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:33:08.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDNEsxsWfARYuho2xFD3TQZuz1iOG5ypnw4AoX7hil4xgCT/v9znaVmOk1tAXYMmOwJeyB1NEl66XzwviW+gbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

On 12.06.2023 22:21, Daniel P. Smith wrote:
> 
> 
> On 6/12/23 15:44, Daniel P. Smith wrote:
>> On 6/12/23 07:46, Jan Beulich wrote:
>>> The variable needs to be properly set only on the error paths.
>>>
>>> Coverity ID: 1532311
>>> Fixes: ab4440112bec ("xl / libxl: push parsing of SSID and CPU pool ID 
>>> down to libxl")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>

Thanks.

>>> ---
>>> If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
>>> if the 1st yielded ENOSYS?
>>
>> Would you be okay with the calls staying if instead on the first 
>> invocation of any libxl_flask_* method, flask status was checked and 
>> stored in a variable that would then be checked by any subsequent calls 
>> and immediately returned if flask was not enabled?

I'm wary of global variables in shared libraries.

> Looking closer I realized there is a slight flaw in the logic here. The 
> first call is accomplished via an xsm_op call and then assumes that 
> FLASK is the only XSM that has implemented the xsm hook, xsm_op, and 
> that the result will be an ENOSYS. If someone decides to implement an 
> xsm_op hook for any of the existing XSM modules or introduces a new XSM 
> module that has an xsm_op hook, the return likely would not be ENOSYS. I 
> have often debated if there should be a way to query which XSM module 
> was loaded for instances just like this. The question is what mechanism 
> would be best to do so.

Well, this is what results from abusing ENOSYS. The default case of a
switch() in a handler shouldn't return that value. Only if the entire
hypercall is outright unimplemented, returning ENOSYS is appropriate.
In fact I wonder whether dummy.h's xsm_do_xsm_op() is validly doing so,
when that function also serves as the fallback for XSM modules
choosing to not implement any of the op-s (like SILO does).

Since in the specific case here it looks like the intention really is
to carry out Flask-specific operations, a means to check for Flask
specifically might indeed be appropriate. If not a new sub-op of
xsm_op, a new sysctl might be another option.

Jan

