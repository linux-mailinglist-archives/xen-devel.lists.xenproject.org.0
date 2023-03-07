Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E036ADC01
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507284.780591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUbl-0002e2-FU; Tue, 07 Mar 2023 10:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507284.780591; Tue, 07 Mar 2023 10:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUbl-0002bH-CW; Tue, 07 Mar 2023 10:31:49 +0000
Received: by outflank-mailman (input) for mailman id 507284;
 Tue, 07 Mar 2023 10:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZUbk-0002bB-BX
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:31:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4318a42c-bcd3-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 11:31:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:31:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 10:31:45 +0000
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
X-Inumbo-ID: 4318a42c-bcd3-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAd5sSFMvASeiPS8MVpyEewzrRTyv7t3u5yfgmYbOS3WjyhCXE9sLTT/MLqs682NOIZONAsluAOJ70AGsiSW6sH7X15+gKZu7PLpBszO9wHXr1U6BQMHyQ1LE3wY/Yk8Fg3sbSf85uFOaj/8dKOEk5VjgNu6E4GWmGQ/XXFLKfnD709/90ymk0kyq5vgquEsNFHRlICEMG9iMF3bMSV1mG2QCh51N+EDtsFstgRi/EqG/2AKrdRdIuUteY1hF0N7vecZ4p4gagLhoEl+y15gzNBt95WEMk66SiV1uvHfe7Gs9/0opyabQ3UeS6EYwQn06uwIH45nssUWvEEIq26ANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWBcvOeW8FnynRmPGdKKUHqLNmqjQp5RGSOdGHIFaxg=;
 b=IZUYKiaOkKQ5CgCLXDQR3ikwFvJMkTHD9osC+F8lQ+m3PIbuRRlxU7OXNuTGUSYbLEdgj/x1HUSeI3KNEOh2E4x1QIlfYKabAATr+Pu4wdYD/3PfOlaB9xslR3Kqv38Yd8oWRleB8XpZOZCdLGMq3bPyojpm5hTw9u2p3qnh3Xbu3KWv6zsOKnAdg9iKk0n8tWpnRLaZa06LFg1buL4QmGCb7H/EloaVBF2ejcOWluWiQMwa1CydUA1NwcsDM/f6E4Z0ts+WoFWDaIw3XzAbXzANaYmdR4iMwVbma7WrPMMdXQ8u36f1PNmkPBKhu9f3bPNUBYN87TPgfi30A1KdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWBcvOeW8FnynRmPGdKKUHqLNmqjQp5RGSOdGHIFaxg=;
 b=n7Yloftv/OXvKYcXMuw/03E8aBzC9L3OSnAwuOk0TPXWIXRyKC1/RG4wniv0I9oy2QVnWYgGsjoDLbALDFThIoL345/VHfVYjgMyjAjXwNtC6wFIbm14IcOFmIUOTEXSN8TQWFiz09l/hAHPd1FtDdNyhy4Sr4hgdIBEvpMrx9Y8OHbwwcZWJTGRwi0TkwbKiCPxRAss/Q0xrksKw8EKhe0nG2ujwqkNVJHM6OYd0Nq8rdlc9NgNpWk4E7oJCe5sjgFuM2SMiGPkNxWggSB/nWk7e3bPQQ8k8+Vj3TyR92yQT8xslJO5onT3n60Nz+BDM30uwFMtKxOr9LOdU688aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
Date: Tue, 7 Mar 2023 11:31:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230307063214.30569-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 83572c0c-a7de-40db-f9e3-08db1ef7260f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5WGWhWtdgIlTNU1bAlPO+e8Rdr5+c88ji/+m0bBDnb/rGvcNzfjxhCoGYjonxelesTZDbA7aRo44YumB3nXRPMScYET44g5yvjYywd2fHnJ0UpF2rWHjpJWkvrD5LDU1BC/92VdwM5hnQtniEa7J/0q2r0yF5viENjBoV4z50BHo+CcYI6X2T3QD28+LSqdWbh5akqj2Fqbkndv/CPBdek1BjOhSVPP7kFStMsZbOYKSXogvSRfaKzBjICX6l80t2NnTuaMMjUP5RfwNYCbnxlu2ppUoRBPJ1UACw8kQ/YSzxepKykzNG3sLldQuwb2kkJ8OioweAdeDlrlzJl1vtHXnqGm8LEwa862KNCIrVCES2xv12F6fatHtjwhH7baUHsreFcTgcaP8P+KKiZaMsbeusRjjIL4TNc/UOPOssVaSBMDU16vnFviB5vVqN/mowM/q/0bHGl8VroQy9l0vndF9KKvtZlhs55ST3yn1eg2RlJAKNkcN26L8dtk/ltRyPhS0OZGqpQmqxNzafx0giTwntO82Rio+EcNNIHYGdWLqY+yWhHGdxzexsTLY1cZAX5BGAM+cpOPGgA+1ttyY9vWqNlyixpLB20gOP+rTJMpBWoolegJV8KmPedu89PYdgzB+tJGGbsF+paYKgAdK3EMHGjCMffO+u+Tx9xTcBMavZG6KPb2hudnW+OejzfH8o01zQhyZIJMtIRbCYjXH2GW8reORWiAJvYdrvuSP0c8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199018)(31686004)(36756003)(4326008)(6862004)(66946007)(66556008)(41300700001)(8936002)(6506007)(5660300002)(2906002)(6666004)(86362001)(38100700002)(31696002)(66476007)(8676002)(26005)(6486002)(54906003)(316002)(478600001)(6512007)(6636002)(37006003)(83380400001)(2616005)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlpOWktSdXQ5MXFudHYvVmNVY3NBc3JxcXZTOE4vTzYzN2pqTS9KdVhSM3dy?=
 =?utf-8?B?bG5uWWMrdEtOZU1NNDNyUFo0TFdJejROeEdQcEV1VXhIWnViYWx2K2VKNDRh?=
 =?utf-8?B?eUIvSWpKSElDQmNhWitiTkg4SURrdnVyL2hZTnZ6TkVzNVpCL2NSVzlxT1hy?=
 =?utf-8?B?WkhQS25BbHdERXhqMmhHRWJwbzhGakNzSEFqU2gwQkticU5oeEpkd1ByOTlG?=
 =?utf-8?B?dWNac1lQb1VnVmhZbnBsVk0zSkFRczdXczNRMXdrMksrRlV6UEIreUdyN1pK?=
 =?utf-8?B?N0tTemJmS3RsMVllOFZjQk1Pd3FUVmYzMnhDNEMzdjFxSmJBRGVubURLMnFa?=
 =?utf-8?B?U2ZkYmtlTHNHSWNrK01CTWtUZFU3Vm1mUEZaWG1iSDJkRmFxTEJ6VC9sYWFm?=
 =?utf-8?B?RW1nZjRDaFRFeVVxemJnNmR2Rkd1ZnVKc3cwVGZ0c3RVc2lIeHp0b0p5b3FB?=
 =?utf-8?B?VXRzZlU2RFFmQ3AvdTQ0SkJpbG82cytTVVZYRU9Nelp3VXpuRWh3TDlOQm9D?=
 =?utf-8?B?aDJyN0NqR09DVTAzMXg5eXNpSkZVQTVzZmZ5UU16cmdYSGNERUg4MTQwVGVr?=
 =?utf-8?B?VWsxS3ZxZWNpQ1lBUUczWGdjb3E0ZndPNDY2a2ZldGpwS0tkRzFPdk9aQ2xo?=
 =?utf-8?B?a3pIMitoOTdMcVNOUzZHWU9rTVpyMzViNk9ZbjFlUGRxUVJWS2VrUWpXQ0ZH?=
 =?utf-8?B?OWxaQm1iOVFBOEpCWUtOU1BJVElrMUFGTVkzK1NhakZOMzNiM3U2cVloeUJy?=
 =?utf-8?B?c0xQbjBHSFRsMVRMa1RQZmdWR1pTTWxoenlXcm5URHZ5NnFHWHR2a2NSUzhx?=
 =?utf-8?B?VDRBWmJzMHdyeGl0a0psM20yQkE5bVhtemtwYm1WOVlsUUVYVmovMVRwWnVw?=
 =?utf-8?B?cmtaMUJLWk9RUmFuT2N1T3FRN0VRTXBYZGZBVkdhTmFweVcwWDhLdkVaR3VN?=
 =?utf-8?B?ZzZ1MHZ1OHJHVGx6SjlKNVB0elRUVTl5dm9HTzF0MzBoTnhvZHFCUlZqanFE?=
 =?utf-8?B?WndJMHFLMFovYXdsWGg5cCtRNEQyR0I5cU1GdS96cHhnUktBdkVWVGVaempF?=
 =?utf-8?B?c1pUYTFvcmVqcUlkVHhLbERjUjdyZVJraFFHems4TzU5WEh3NzdUbG4xUE9Z?=
 =?utf-8?B?cXUyYXBtUVdQNm1DSU16bTVZbkRmRy8yZDQ4QVBBSXNGQy8rTnlaSU5pcjQy?=
 =?utf-8?B?SWM2cURKdVJ4WmhzcEdaVmJzZSs1elZUODlRTUd0c0dYR2thWlVRWm5QUjg1?=
 =?utf-8?B?Y0tITFJ5cURDQ0tFR2lQSFZ1OGJaTk1qS09jbUlVVzlOTWtNdVFzZGtET3kr?=
 =?utf-8?B?VWFtUnZRK1ZlZ09hbkZFZ2QxMlN5R1RldmI0VTF1UFJxMjc1Wmp6ajNMZWVD?=
 =?utf-8?B?NDVpMXlYODlMQkdNcjhCTkxEdk9xNGI1aW9yb3NMd2lNWVc1SjhvcGJEK2s5?=
 =?utf-8?B?dzdYNXR2L3BNZ2xHVElUSnRLOTVmS1BkbnJIcTkzOGdlZ3I0M3VrWVJYOTdh?=
 =?utf-8?B?OGEybjIreGRvRUkvRitXVUFVTFAvdi85Qk9TeDhmRTdCU1MyeExxQXpTZjZi?=
 =?utf-8?B?cWNOYmE0TkQxWEFrTjhQTEV2RkNYVTF4eVNGQnYwcWtzMC9GNHMwd0luZXpS?=
 =?utf-8?B?K2Z3VFR0TGhtTVNPSFJsSHNzT3A1UGNVYldQRDM0R3B3V0FTY1NQYWdMeFNS?=
 =?utf-8?B?b3ExSHA4RzVGM255WDl0cFZlZTliZm1jdHF1UGpjc1JJcWcyUWFIWFN0cm5G?=
 =?utf-8?B?MkxnWXVlQndPOGRMcm9Na1M4TjVHdVQrMXVmYWtobjR1dFIvL05uVnFmU0hm?=
 =?utf-8?B?elEwTm9RV3BDcXlSRnFRUVF3RWhWNGJlakpIY0RCMlJGUkxaMkRsa3JjT2t3?=
 =?utf-8?B?ZzJvWDNFVmtTc2FqcnRwSlNtWW9rWHNhVjN1S2VjZDc1MENFMkdaMlVqWDU3?=
 =?utf-8?B?ckw2TTRTSmxQcTF5eTNjVmNqR05SMmlNS3RRTEN3YkR0clpnNFBGNmcvR3dN?=
 =?utf-8?B?NnR2dkRmNVhxQ2VNQlRmRC80QTNpV0RWUnFQbGtaL2JSckNoaXBRS3o4c0dQ?=
 =?utf-8?B?dCtGd3dJM0FnMDA2eUNvaGhka2RCcDJkQ0tIbkU0VThhOXFtdjFzYzg0WHdP?=
 =?utf-8?Q?vLEd/r+LOYm5HcSh2G+HE9+tX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83572c0c-a7de-40db-f9e3-08db1ef7260f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:31:44.8956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVKS5+hzJ9GjAP9sapI8qA2c7lZlO2m6VmrzP2kUXIN//TXVeS2cBO1ebB+W75YTP5kRa+SN1xAtrCGgP1HWSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396

On 07.03.2023 07:32, Juergen Gross wrote:
> In order to support hypervisor analysis of crash dumps, xen-syms needs
> to contain debug_info. It should be allowed to configure the hypervisor
> to be built with CONFIG_DEBUG_INFO in non-debug builds without having
> to enable EXPERT.

In how far does this apply to xen.efi as well? (You can't really use
xen-syms for crash debugging when the crash occurred with xen.efi in
use.)

> Using a rather oldish gcc (7.5) it was verified that code generation
> doesn't really differ between CONFIG_DEBUG_INFO on or off without
> CONFIG_DEBUG being set (only observed differences were slightly
> different symbol addresses, verified via "objdump -d"). The old gcc
> version selection was based on the assumption, that newer gcc won't
> regress in this regard.

This is good to know, but I'm still curious about the mentioned
differences in symbol addresses: If code generation didn't change, what
caused addresses to differ? Is that merely because individual functions
or objects are emitted in different order by the compiler? (If so I'd
be inclined to infer that comparing generated code must have been
quite a bit of effort, as first of all you would have had to undo that
re-ordering.)

The other thing to at least mention here is that with new enough
binutils, when Dwarf debug info can be enabled for keeping in xen.efi,
linking time of xen.efi increases quite a bit with DEBUG_INFO=y (which
is a result of linking ELF objects into a non-ELF binary, when at
least GNU ld optimizes only the ELF -> ELF case when processing the
[massive amount of] relocations).

> So move CONFIG_DEBUG_INFO out of the section guarded by EXPERT.

Isn't the prior DEBUG dependency as relevant?

> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -11,6 +11,13 @@ config DEBUG
>  
>  	  You probably want to say 'N' here.
>  
> +config DEBUG_INFO
> +	bool "Compile Xen with debug info"
> +	default DEBUG
> +	---help---

Nit: Even if just code movement, please use "help" in the moved
instance.

> +	  If you say Y here the resulting Xen will include debugging info
> +	  resulting in a larger binary image.
> +
>  if DEBUG || EXPERT

The new placement isn't very helpful when considering some of the ways
kconfig data is presented. At least for the non-graphical presentation
it used to be the case that hierarchies were presented properly only
when dependencies immediately followed their dependents (i.e. here:
DEBUG is a dependent of everything inside the "if" above). Therefore I
think rather than moving the block up you may better move it down past
the "endif".

Jan

