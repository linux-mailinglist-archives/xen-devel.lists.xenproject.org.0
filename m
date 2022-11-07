Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2B61F9FE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 17:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439503.693525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os55w-0003uW-FE; Mon, 07 Nov 2022 16:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439503.693525; Mon, 07 Nov 2022 16:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os55w-0003rZ-Bn; Mon, 07 Nov 2022 16:35:32 +0000
Received: by outflank-mailman (input) for mailman id 439503;
 Mon, 07 Nov 2022 16:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1os55u-0003rT-Q1
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 16:35:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60083.outbound.protection.outlook.com [40.107.6.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 307f0419-5eba-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 17:35:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 16:35:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:35:26 +0000
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
X-Inumbo-ID: 307f0419-5eba-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2pjlE6aM8gaC6YoO17WqVH/6rt0Zk8yIBMdRp45CoJ5HOSbLJyh7+v6FMj1l9YzO05+YUe21XKO06BmVcvNGoWRSQwpR0Ze/efSamd4jnb91EBpe4WGL1oV+FrBfbi4CJt4U3fh2eaZq9COwef63GxK8RCDo+50X/XRbQdjmpGt7GDjoLQylOsV4rRdkj4RMtkisYz2wAQMODh6PBpR/8/v88Y+bpDoiF0FGm1h78TkPMAqLCL3WasMMGcC8f48w6RQfz6HegZuaXFUOkI54j7tZkNcJw1puGZbk35BDKfka8OR01cgT5hb4Yt1Q5MFyq+C7r14z6sxoZJRa/65Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkryOQpiG5imWtvlvruFNVJCPJ5uPxQikcqLQVyA+WM=;
 b=kii3/bJOsUJCfg+uYDZyW95UcvgbxopTji9mvcaaWg3N4JKbS/kV3sysodfDFCLr0b/zbdbhOxA+TwR/8gGwsLnOpFuOIGeDvq9GyM2vocgLgg2GpnwBDQBQd+BLGfX5AVHvgqKd94QqHiYscfuykKR+8pWTvaRHJSdN7RU9DQTdohO/9+9b+m1W+LrwdUVBtlrK6gCnZyCobWWIjWNOpMMuDBa6s7bAyy8D6uaxFQz+WRcrmfGFpvMg3Ds+ICnSTRQ/MMrNabI71ZQaK20OP7+Zq60HkrF2SSacU2lJyTrwftkDoTx7D1Du4SDbigxNqqp9js9ouX+/8azo6vtm5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkryOQpiG5imWtvlvruFNVJCPJ5uPxQikcqLQVyA+WM=;
 b=zFp3wV4j+YHqjNv1KrdKpjUevTq+jPvg2QU+WIiTu553utusU4FTTR2DrUawJh+3acsYkoVa4pg2ldOOR/gpebrur+7Kvd4fylFS/WXUEPDOESETNg2kZowQlVOVjksiFx0D24pGbvEaTLiyeaiA6suU5GMiKnAiAmlC2p+JKLBWKCuF5exwIi37uCTHhrZgcIhVsqyC/ib3JDuPBHTv/aPFE4ELL9wH84bjGUzscbo7+nPW375rhQHDGq9RLeoDW3Sa0FAS1KSLpLXhsSQ3VdFkQBg4wZVdJ2NHPeguuMsfSovYaVYe75xmZUN7CZti+xCJledwXmC2zS3l99Bf+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa989d27-45c2-6cb8-160a-b0368b1bb2a2@suse.com>
Date: Mon, 7 Nov 2022 17:35:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-2-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221107104739.10404-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9067:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ca850f-919e-4889-5a9c-08dac0de130e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GDdJi51jQRFaPKU4OLY1ZnPycMFyv4SzEukISIsGeHvd0lhglevP4qfXJP04yRBpzS9bRXV0k/mVSEnEfSapFd8aYdcjPykKgGrLRaSI9aefhEH182NlZYZKdHpv/70oVTtpxaIyzOCbp9ywlS9oh2M6RrRsftgQmhfy/m4+Y+wX90l6LxMN42041/LhD+W/6GpQnf1DBjZPFHqQu7HfFOIkxLI5FXFV0Yy23onhXQKwVgSi2ltOBAb5VD8KjI4x5jS0p7zw/JpTGjVmVZG67g56O7rdeV5MpHa2dQTCf8PcqpOjrgK3kNVSTKIEZ4scFBzMS939OZHqdEoZYLolwrpOG7PmHz8c88zTuThLZvJhbgpxnZJNeGhFAUXxc0qcr9roPKDB6PftUkwLXfCaPDCpRo0nMurpz4eWWxNCziourqG7NtfOAT971dna1iNsxmPJTSjqxO3tOEwjGQ44yM1UwisTcCRyADcO/n5o4SWGvPOV4Qq3dx7xOZt2sp38WKt99LGiMjhWPwiSGMFKkgDOmwPfZtk9eOBZW7xyy8sFWQkAvj/s8upnJnp4Az6onYoaik5QU3x3N0DwthftxKJgajjO751PjZrBe48p3NpQFKetlhzjbqqtjPknSHdNQU6QhWDn5ZeRtZ7XqTXKYaOxp9BBRWetHLCELhiotpx6yWVPjzM/f1DDKaJ9CCOZLIfR3kIkrc6Kakas8rW7kp10Hiihr/hnm0wnubMlTSKWxG/mr+4aEDbr379YE3OU2ufmrYHHFuk6zjRepnv9IrP7Fp/cqZIf88oksh/YU+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(66899015)(36756003)(31686004)(86362001)(31696002)(5660300002)(6916009)(2906002)(26005)(6512007)(2616005)(6506007)(53546011)(186003)(83380400001)(38100700002)(54906003)(4326008)(478600001)(8676002)(66946007)(316002)(66556008)(66476007)(8936002)(6486002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q21Rd2E2RnF0MGpVMU9tdCtQMFpyWEg1U3dUVHZFNFNiR09YQ2ZDTVZXREJT?=
 =?utf-8?B?SVBkYno2VkNEcTVlRzlPeWEvTXU3dmxnWDl1TDAyQ2g4T0cvZ084V3kvTFZW?=
 =?utf-8?B?NENDYmh3RXA2bVczZ25yUEZHd3BHdXpRUE5RTW5HamxXMTFqc2dJZWVLdkQy?=
 =?utf-8?B?d09TL2QzZUgrNW9ZclQxSjM5RG13Q0xrbjdaRUVpYWxjdUhEbXN6a2pqMmFz?=
 =?utf-8?B?UWNGZTVISTV0K00rMHpTOGYyMHpWbHBmY09ncWNwOStPUDlIS1pyQUp5Vit6?=
 =?utf-8?B?amd5K1NOcElkd2lIdFZJNm96dXRSRUp5UzNmYXU5cTVFTWxBMXVTWEZ3Ny9u?=
 =?utf-8?B?N0kvcnZoVDV0ell2R0UrRi9CWHd6R056Q3o2Tk1RVkVGYmV1VjVpQlliaDdR?=
 =?utf-8?B?bGNCTlF6Mis4QmpXZVlrZGk4dWp5djU4VVhVZXg1ZTNCRmFHbnJZZ0hrVm9l?=
 =?utf-8?B?eFpOcGUwWklWNVorU01QV1pxSFkwS09XR1pUdUcyY09TQlB2NjlyREJpNlR2?=
 =?utf-8?B?OUZ3d3RINjMzTDdLTEY1TmVKNDFnMy9VSEZ4SE9mSGc3VzBLUE4xd1Mzd2tk?=
 =?utf-8?B?dDYzOVdVMHYvSXhhc2xzQ0g0T04wYmZrV0U1Z25mc3RjTnFhZ3V1WFB2N1ZM?=
 =?utf-8?B?YzgyZU1uSnp0dlYrMzBObkdsTWYvWUhMV0tVY21xVk9Ma0d3enozWHlXVHJC?=
 =?utf-8?B?UjIrRUFoV0h6N1grVHlIMnlVWVBkcnVMbWhiSldBOXFZYlo0c3ZHK1YzUGF2?=
 =?utf-8?B?U3E2TmZWcFpib3p5bmlYZzlleW5iRGxpL1dzMGthWFIwWUcwRURrTDB0azhL?=
 =?utf-8?B?OHl1ek5TZUV4bk9JQU9KK2JSSTBDZkhaOTduc0g3a25SSFMrdzdpcWlZQ1Uz?=
 =?utf-8?B?RTgvdkJyMkJLR1NvSkNQbkVxU0Nna1ZuNCtnYUtHUzVKekxabTlMNXFTMzBp?=
 =?utf-8?B?MzdTU2x3WWhabVFhQTRMVUd6S2hBR3UyMEdqNzV4RE9lVFJ5N2hhVDBJNUdB?=
 =?utf-8?B?TDBpSUVHSWFNMllYdVdiWlEyOEVNTkZiK2UzaGkrRFhPSnRjUWtzdlVpVmlj?=
 =?utf-8?B?djZZaHl5cnp4WUxSMVRQcC9CWm9oWkRNd08rYndvNHVOdzA0dU84OHJ3YXY2?=
 =?utf-8?B?c3cwVzlMaXhTVnp5VDJ2UnFRRUhrTmlaVHV4MDFwd1BEQnRvellkNitlMnJ5?=
 =?utf-8?B?YkJvT05ja1NUSER6RzB4b3lQaU91MEZOWm1NU3Fpc2JZYmN0d0pCTG9DM25h?=
 =?utf-8?B?TVlOUlRVSDhEd2lmZTcyOUxOS1BIWDdYRmJyb0pSdTZJb3VoRHlnTzBxSmhQ?=
 =?utf-8?B?VUxMTW43L1FISXNBc2RkTE9tU3gzVTVoTUUweWVydGVRcElXVnB5NnY2bDFa?=
 =?utf-8?B?RGxzMFZtU00zZU5ZaEowVzNSYi9nbkxoRzBtVUxyNWYwdHRpd0NNRjY4VXVG?=
 =?utf-8?B?UFdycEdlN2hram9xQktZTzNoVTA5MnE3bzgrVlVjbGpNTTY4UWc2dThPcm4r?=
 =?utf-8?B?WnZYMXptQUFNb2g1K1RsWVI5c3F6Y0YzZVFManJGdmpzak5qL1JaU1krT0Ro?=
 =?utf-8?B?R1FMellYMldlWUtweWhXUVNKTHVObFUyUFJ0NGxwTy9QRkFuQUZ5YURRaUEv?=
 =?utf-8?B?em9UcHh1ejhHRlZxcmF6NE02TzFOVTE1WlBiUmYvcFBRTDNyU3ViYlhvNHZu?=
 =?utf-8?B?U3RZRzE4RGcwREVkTHgxMGhlL0FYbjM5REpSNDBsYUlHQWJSaG1XbkJOZEJS?=
 =?utf-8?B?NEsrY3hKUkt0VFZab3lwdnZGYnBheHBaNG9weFU0VGUvRHd1OEU5VHlVYUJm?=
 =?utf-8?B?dEsrN3IrSVN0UCsvR3psQnJyOXdVQllScHVGWm4wb0xNMlNPa0MraitMQlVI?=
 =?utf-8?B?ZVhxYzZxdFZrY2V2eG4zaHZLYWtMdDAxclA2dnkveHpWZ1hBU2FZZU1leW01?=
 =?utf-8?B?NzJzYjN4RTdHckltNVJXNmlEUW5uK3pGY2cwSWhXRXRmTDdCNTdONUVnWGhk?=
 =?utf-8?B?YlVYTlpLa0dYZDhiMW1LcEdHQkpXUmJXOWlHcTdiKzZxT3B4VWE3ajhyYWx5?=
 =?utf-8?B?WjRMUXpFczA5UXZwTlcwb25wM3lvRFp0aEZoTXl1Si9zQlU3b1lIcFZDZk5t?=
 =?utf-8?Q?Ph224tfOIQQy6MilctevkUL0+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ca850f-919e-4889-5a9c-08dac0de130e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:35:26.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRYBi4/j49aexGLPKI1oD4NFixsr395ueC5BhmCyqTbmitWMr4+6AvtRt7xHfjnCnVu7WlAS0EBOKLsJFDDPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9067

On 07.11.2022 11:47, Luca Fancellu wrote:
> +Here is an example to add a new justification in false-positive-<tool>.json::

With <tool> already present in the name, ...

> +|{
> +|    "version": "1.0",
> +|    "content": [
> +|        {
> +|            "id": "SAF-0-false-positive-<tool>",
> +|            "analyser": {
> +|                "<tool>": "<proprietary-id>"

... can we avoid the redundancy here? Perhaps ...

> +|            },
> +|            "tool-version": "<version>",

... it could be

            "analyser": {
                "<version>": "<proprietary-id>"
            },

? It's not really clear to me though how a false positive would be
correctly recorded which is present over a range of versions.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -457,7 +457,8 @@ endif # need-config
>  
>  __all: build
>  
> -main-targets := build install uninstall clean distclean MAP cppcheck cppcheck-html
> +main-targets := build install uninstall clean distclean MAP cppcheck \
> +    cppcheck-html analysis-coverity analysis-eclair
>  .PHONY: $(main-targets)
>  ifneq ($(XEN_TARGET_ARCH),x86_32)
>  $(main-targets): %: _% ;
> @@ -572,7 +573,7 @@ _clean:
>  	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.stripped
>  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
>  	rm -f .banner .allconfig.tmp include/xen/compile.h
> -	rm -f cppcheck-misra.* xen-cppcheck.xml
> +	rm -f cppcheck-misra.* xen-cppcheck.xml *.sed

Is *.sed perhaps a little too wide? But yes, we can of course deal with that
in case any *.sed file appears in the source tree.

> @@ -757,6 +758,51 @@ cppcheck-version:
>  $(objtree)/include/generated/compiler-def.h:
>  	$(Q)$(CC) -dM -E -o $@ - < /dev/null
>  
> +JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
> +                       $(XEN_ROOT)/docs/misra/false-positive-$$*.json
> +
> +# The following command is using grep to find all files that contains a comment
> +# containing "SAF-<anything>" on a single line.
> +# %.safparse will be the original files saved from the build system, these files
> +# will be restored at the end of the analysis step
> +PARSE_FILE_LIST := $(addsuffix .safparse,$(filter-out %.safparse,\
> +$(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))

Please indent such line continuations. And then isn't this going to risk
matching non-source files as well? Perhaps you want to restrict this to
*.c and *.h?

> +.PRECIOUS: $(PARSE_FILE_LIST) $(objtree)/%.sed
> +
> +.SECONDEXPANSION:

I have to admit that I'm a little worried of this living relatively early in
the script.

> +$(objtree)/%.sed: $(JUSTIFICATION_FILES) $(srctree)/tools/xenfusa-gen-tags.py
> +	$(PYTHON) $(srctree)/tools/xenfusa-gen-tags.py \
> +		$(foreach file, $(filter %.json, $^), --input $(file)) --output $@ \
> +		--tool $*

To reduce redundancy, how about

$(objtree)/%.sed: $(srctree)/tools/xenfusa-gen-tags.py $(JUSTIFICATION_FILES)
	$(PYTHON) $< --output $@ --tool $* \
		$(foreach file, $(filter %.json, $^), --input $(file))

?

> +%.safparse: %

For this to not be overly widely matching, maybe better

$(PARSE_FILE_LIST): %.safparse: %

?

> +# Create a copy of the original file (-p preserves also timestamp)
> +	$(Q)if [ -f "$@" ]; then \
> +		echo "Found $@, please check the integrity of $*"; \
> +		exit 1; \
> +	fi
> +	$(Q)cp -p "$*" "$@"

While you use the full source name as the stem, I still think $< would be
more clear to use here.

To limit work done, could this me "mv" instead of "cp -p", and then ...

> +analysis-parse-tags-%: $(PARSE_FILE_LIST) $(objtree)/%.sed
> +	$(Q)for file in $(patsubst %.safparse,%,$(PARSE_FILE_LIST)); do \
> +		sed -i -f "$(objtree)/$*.sed" "$${file}"; \

... with then using

		sed -f "$(objtree)/$*.sed" "$${file}.safparse" >"$${file}"

here? This would then also have source consistent between prereqs and
rule.

> +	done
> +
> +analysis-build-%: analysis-parse-tags-%
> +	$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build

This rule doesn't use the stem, so I'm struggling to understand what
this is about.

> +analysis-clean:
> +# Reverts the original file (-p preserves also timestamp)
> +	$(Q)find $(srctree) -type f -name "*.safparse" -print | \
> +	while IFS= read file; do \
> +		cp -p "$${file}" "$${file%.safparse}"; \
> +		rm -f "$${file}"; \

Why not "mv"?

> +	done
> +
> +_analysis-%: analysis-build-%
> +	$(Q)$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile analysis-clean

Again no use of the stem, plus here I wonder if this may not lead to
people invoking "analysis-clean" without having said anything about
cleaning on their command line.

> --- /dev/null
> +++ b/xen/tools/xenfusa-gen-tags.py
> @@ -0,0 +1,81 @@
> +#!/usr/bin/env python
> +
> +import sys, getopt, json
> +
> +def help():
> +    print('Usage: {} [OPTION] ...'.format(sys.argv[0]))
> +    print('')
> +    print('This script converts the justification file to a set of sed rules')
> +    print('that will replace generic tags from Xen codebase in-code comments')
> +    print('to in-code comments having the proprietary syntax for the selected')
> +    print('tool.')
> +    print('')
> +    print('Options:')
> +    print('  -i/--input   Json file containing the justifications, can be')
> +    print('               passed multiple times for multiple files')
> +    print('  -o/--output  Sed file containing the substitution rules')
> +    print('  -t/--tool    Tool that will use the in-code comments')
> +    print('')
> +
> +# This is the dictionary for the rules that translates to proprietary comments:
> +#  - cppcheck: /* cppcheck-suppress[id] */
> +#  - coverity: /* coverity[id] */
> +#  - eclair:   /* -E> hide id 1 "" */
> +# Add entries to support more analyzers
> +tool_syntax = {
> +    "cppcheck":"s,^.*/*[[:space:]]*TAG.*$,/* cppcheck-suppress[VID] */,g",
> +    "coverity":"s,^.*/*[[:space:]]*TAG.*$,/* coverity[VID] */,g",
> +    "eclair":"s,^.*/*[[:space:]]*TAG.*$,/* -E> hide VID 1 \"\" */,g"
> +}
> +
> +def main(argv):
> +    infiles = []
> +    justifications = []
> +    outfile = ''
> +    tool = ''
> +
> +    try:
> +        opts, args = getopt.getopt(argv,"hi:o:t:",["input=","output=","tool="])
> +    except getopt.GetoptError:
> +        help()
> +        sys.exit(2)
> +    for opt, arg in opts:
> +        if opt == '-h':
> +            help()
> +            sys.exit(0)
> +        elif opt in ("-i", "--input"):
> +            infiles.append(arg)
> +        elif opt in ("-o", "--output"):
> +            outfile = arg
> +        elif opt in ("-t", "--tool"):
> +            tool = arg
> +
> +    # Open all input files
> +    for file in infiles:
> +        try:
> +            handle = open(file, 'rt')
> +            content = json.load(handle)
> +            justifications = justifications + content['content']
> +            handle.close()
> +        except json.JSONDecodeError:
> +            print('JSON decoding error in file: ' + file)
> +        except:
> +            print('Error opening ' + file)
> +            sys.exit(1)
> +
> +    try:
> +        outstr = open(outfile, "w")
> +    except:
> +        print('Error creating ' + outfile)
> +        sys.exit(1)
> +
> +    for j in justifications:
> +        if tool in j['analyser']:
> +            comment=tool_syntax[tool].replace("TAG",j['id'])
> +            comment=comment.replace("VID",j['analyser'][tool])
> +            outstr.write('{}\n'.format(comment))
> +
> +    outstr.close()
> +
> +if __name__ == "__main__":
> +   main(sys.argv[1:])
> \ No newline at end of file

Nit: ^^^

Jan

