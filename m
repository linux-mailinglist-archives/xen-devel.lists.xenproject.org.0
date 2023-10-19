Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDBD7CF083
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 08:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618914.963224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMwn-0002WF-GB; Thu, 19 Oct 2023 06:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618914.963224; Thu, 19 Oct 2023 06:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMwn-0002Sr-BX; Thu, 19 Oct 2023 06:55:57 +0000
Received: by outflank-mailman (input) for mailman id 618914;
 Thu, 19 Oct 2023 06:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtMwl-0002Sh-JQ
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 06:55:55 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4d4a60-6e4c-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 08:55:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 06:55:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:55:52 +0000
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
X-Inumbo-ID: 8c4d4a60-6e4c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJwmPOSaH4dk712KIwHdjh10cWBXMid30YyOKCtYLtzvSkHm0mF88ZBKlEpc2JFrce6hDVlXC0nGdyR/9GdW32uXQsxJ0f2onsi8tXbcioUvzt802BICJONr1WLVjPz+BITQarLqqaXCfjxyK+REmoJ1pc+MeGWLfcYRJKDqgmQ3Trj+MOcSBtJMAlaFxY44ZudVmv69Dw9X5sYpdBn9a1eenkv8OnuNselYbGaCUHCZsxnjIRiyaqmIYAIBG0Q0JDyVDxlK9MYEExeFTjCJc2g3Ei5SucnWsLJdS2Em1L/5s6gePcVpySJXJu2KMypFwBqW1eJDGEfLxbre7ptdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bhVrLuQPKC+8kpciL3ONqdJ4d3A2oDVyZxZYwtoTOY=;
 b=lWV8vXE9vCcmjN5f9Jl53eTc7WrGG/Ui2q7GjqqeqWCuqs50pqUJ9WeR+ppzTIZCPgmNQ45tU804DoG7pOVra1pMen5goSErP+2w2LLw3/F3PFj5g/uF7u1OQUQvveC/CW1m1GVxfzxu4ik3dv4fUq5FyavsHOb/KcXA6GOgUDEvHUlRPvRHJ3r/4zs9Ta8psIBgb3ZcsZ+kNCF7Et4zUZDN98YoxT0s1rZOF3jLVaNA1xhFOxFvmf/rscDKjbHCMz2xOsXUkPVv/FWyLwr+ue8GjuC3HtdE/7coHTOWpirUFuaQKf49MUryq5KlUrYfIhVI+2EB4686jMBd1ADAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bhVrLuQPKC+8kpciL3ONqdJ4d3A2oDVyZxZYwtoTOY=;
 b=Pj5CfMD9Bu2AO38TO+BnpmVmIkXMj25LOuCJCG6QcgBMR1YyG+IO5jiq0FbozksrHiPWQ9Uo9WivSx+i7S21gF2AyADpM9XBDqMU6ZPq3SLFdIizzXhcnuRrKu98V59HB3hrxY3BCKMAo9dzgz/qzgLRgn7eDJS+ZLCWC56caRrQeg7+QNXzBJO8w7kyZnkniZ7OkowIpBzFTAGVMKm7T5mQf5fUJ8/IAaHM+CDe58jf3pVCNNM4Patog+HrCBS8VGTZhDokDCoBZFKvei4EZg5JCdq/bgKIwP36NB3Um/5SHip3iRyfFIHdc9BSZ87pa0ulWncQF+1OusqzUzKbiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94f59896-5182-c711-98d7-dcecf6073201@suse.com>
Date: Thu, 19 Oct 2023 08:55:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com>
 <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
 <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
 <dd3534dd-29b0-129d-9f34-b542ed3ffabc@suse.com>
 <alpine.DEB.2.22.394.2310181703170.965337@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310181703170.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: dccf94d3-0ed2-40aa-8064-08dbd0706f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zGdjks5Fv60YCCrAFFG9IWipxIyMvZ2KDBsYsWC0GeK3N0Ecy8QyR8bZQlTSH/JfUHivkhygLxk/RcmSoHA4GdM/Oyu5xfIBJhkaFQT2Fq/LsrzHXqxw5C3gwTQ5gPd0aH6/Yj7NInq5B50UglLtUH6/GJgRViY2XY9menuXqPzsR/n8K7f6FbBLx6WbladOiHYEZkUShkDRLRVXm/SLpRGKBrcQ10hlY9gaShYRud3ObHnFhcnMrDUDpjnDENb9vdL0is9gaVsYwXrJr2ka1ycOYUNmfJjD/QR5ZYuF+zjSifCFB6nHDCMWKTAQCKhSJWSg0xyIxWfnvc8FWKr1yuMUeHrEJMq2wfXN1TwB2uQuWRzPI7L7UsjpDwBmSVH0H7sSWINJqF1nwc0vFhR6ou4+Ex3aJZEGjsVSYa6jNZvisgVeSvMqoRD6lLqRzgW/Z4hkc9eisTorBYCHv6v57VrhBptMMc3LekbTiE/ZJzdRDZtilOZhuDaNQn+ZuY2VMRPflzDY4FH0eQgYF4QRmILDOrPgrlWY5exIpNh84jPitHUpPLxGYX1ke1d/5Kfjh/tw5ntHLnTcya9LLbJeGoCbi2YWxgNWz3gAtfdhn0H/xMK+Uw0Vl2VvY+vhdVT87yNr1B5D06v4Sni8vINRvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(86362001)(31696002)(478600001)(26005)(6486002)(53546011)(2616005)(6512007)(8676002)(8936002)(4326008)(5660300002)(2906002)(7416002)(6916009)(66476007)(316002)(41300700001)(36756003)(54906003)(66556008)(66946007)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1IvN0hId3MzTDl4WXk1a2hyRTc0bisvUG5qcDZ0UnNOSFJJQVpCQVByYW1Q?=
 =?utf-8?B?czg3ZlBJTk9ibm1Fem1rMlZVZUxJcnFqb0NmelErQ1FNUzdERFltTjQvOXJH?=
 =?utf-8?B?c1A5cXRUMVEzak4xcE9SR05BUnFxYjI2WVppbm5lK2t5QndiUVROMXNDTWtU?=
 =?utf-8?B?b0o0NmZJYVVPbDRrZExHZTBxaWpGR3pqYVZEbTRNdXJZRzExcGlJTjhTUUhr?=
 =?utf-8?B?anhNYjVnbEcxNTEzUWsvZ0N3Q0Ryb1RJTCs2cFNTc1JBSjNJZGdLKzhLeXhV?=
 =?utf-8?B?TEtXcjRCaTFpN2tiU0NsenhOalg1SXc3aklFNFk0KzVIckpPNXVWRHErSU41?=
 =?utf-8?B?L1c5QlFZZnNodXNtVXA0elZUNjhrbDRUNHVsbVViWVhOMEJ4eXFlOWZZUUlt?=
 =?utf-8?B?a0UvUUVlZ1VRaFAyNDRuYmw5eE5iRE9vSFNQc3FNWENMTGJ5QUpkeUJ2Q1N2?=
 =?utf-8?B?Zm1zdEE4TnNyQTRaNFJPS256bm1tVlBHWFB2OWVyMFpWMWJEWGxCQmMrQ1Nz?=
 =?utf-8?B?ZzVpVmllaGllYm41Ni9BdTNnYkVuQnlyVDIzKzZxWDBPbW4zenpPaG81M2tC?=
 =?utf-8?B?SXVsOVc1UGJCT044ejRQdHppZzRLeXlObFdXOU1EYzZaZHp5TmJSeUZPWmVR?=
 =?utf-8?B?aFJwb2x4cm4xNjZCNWJwcndsUnNDdkZqNmVra1c0aVJVT0RNLzhPbVNqRVJk?=
 =?utf-8?B?OVFsMkhXeDNVa2xLbVlKbjBKVFVpdHFLQ21KMXdoQVAzUmJXNHlsT3NodzFu?=
 =?utf-8?B?Q1E4ZEcyOFBUaVh1UnU0c2lWanhpeHZkcUI3TnFWWW43dCs5S1IwaHFIYWRl?=
 =?utf-8?B?aHFQanAvbDlUMFNvVVlnT1hva25pQVN2a3JqOEh6WVRzSm5DWENkZGNDY0NU?=
 =?utf-8?B?TVVCSjJxWXgrUm1FdnEwOFE3Y0xQTUp6dDUwa0xqRDNPak1nTVRXcjAwNSsz?=
 =?utf-8?B?eldTMmpYaGVQeHJpWGs1aFhsazBQdW1MZC82dERBMVdKTERUR0ZMVDBEVFhk?=
 =?utf-8?B?MEl2TGhMZUhHNktTdFRxS04rc2xvVkxqTEJ2T0MzdkxsNDZFVVlkWkd4bDRG?=
 =?utf-8?B?UXpJMk50OHA2eG1vQVlrTklNQjBwNFhSemExRnpBV1lXUjNEWjU2Uk15V1E1?=
 =?utf-8?B?a0VDZjQzWFR0TE5oSk9CUnBmaEF5K2RYSWVRWEd5eStFbVExZmtMbXFhZDVo?=
 =?utf-8?B?d0hHZlpFUDkyV2oyYlhVMDIvdlZScmlxcCtTMWx4ZU5teVkzbjZ0VHEvRDBs?=
 =?utf-8?B?bjYrejNwY0Rzb0dTZnNlRUU1V2drTm41b0ZDV1oyRjZPTVFEdEhTRnVpTzZl?=
 =?utf-8?B?RlorYk9Vd3RaZURUMTdkaUdmd2g0bk1pRGJDWXZNdzNiL20rUlhXMUcxSFhp?=
 =?utf-8?B?ejBDMFhvVEZiUmVHQ3NuODFmWmdRVisrWDVwRW9GaGozQXZ6TzRaVjhLcEwx?=
 =?utf-8?B?K0ZXa0dRRUdKS3RVeVU0M2xUdkdJYmdxSERIR2NtZmtCN1VpVU1hZmNLNFND?=
 =?utf-8?B?T0ZIb2RWdFdqT3Y1MDVMZkRLN1FZWmx1Zk9YOXhYTHFkSDJSTmNPNEpxamJZ?=
 =?utf-8?B?RU5YVkZvNVRkOFowR3pFdDhvblRlTlRicHE1WWZhSFhwS05UcGFXWDFFa3lL?=
 =?utf-8?B?QWFXam9FeXM4elpCdTBISXR1YjYrTzRPQW9JenFqeFV1bDNjaVVYc1NHalIr?=
 =?utf-8?B?ZVZiMVVsUWJTVU45MklWMzBaV2VuWDVWemlFK2hIZk90UHZVdGVBT29pVjl6?=
 =?utf-8?B?N0xFS2lVcGpHZDFUNGlLSWE5ZHB1SkJtOC9JaVUwbUNXSENSeTdGMEpGNm1R?=
 =?utf-8?B?Mi8wZXpkdVR3WkNPRUJsN1lnTUtjYkNhWld6RUxvaXFqWlB3c01tYzc1LzY5?=
 =?utf-8?B?UTlzVmlSR3hNWnc1L1FlQ00rZkM5czdSRll3QmtZWWhaRlJnbUNIZ2Z4dERW?=
 =?utf-8?B?aG13SzI5dHd1Ymh3enNZUElXNWh5VWVoOG1FVTVDU2lONWgrQUxWK1NTY3Ew?=
 =?utf-8?B?ak10eHcwMEw3OHZTRUFhaklQQ1NxZnpiUUh3amVlMngwbzBUVld3eUMxUG1E?=
 =?utf-8?B?Y2RsSm44RmN4TzNTODdhT2dScU5jL2FqbjE1a0d2MUc4aStYVWRKbFJoQm9U?=
 =?utf-8?Q?V5gpEOYucTU33jyydlEIrpyxS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dccf94d3-0ed2-40aa-8064-08dbd0706f4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 06:55:52.6680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nud2QBRqTp4wyistqlfnsRaycKi/+1Itkp6ZdkpZLkyCMbJQJq3W1IpOcCBFWLvjLev/jia/VhWjI4WRGeJfQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405

On 19.10.2023 02:07, Stefano Stabellini wrote:
> On Tue, 17 Oct 2023, Jan Beulich wrote:
>>> Jan, for this specific patch, I don't think we have the scan including
>>> Intel vmx files yet. Nicola please correct me if I am wrong. So Nicola
>>> wouldn't be able to easily expand this patch to also cover Intel vmx
>>> violations of this rule because we don't have the list of violations
>>> affecting those files. 
>>
>> I'm afraid I disagree: There are likely direct VMX counterparts to the SVM
>> items adjusted. No scan is needed to spot those. Anything VMX-only can be
>> left separate, sure.
> 
> Nicola is new to the codebase, so let us help.
> 
> This patch adds deviations for these SVM functions:
> - svm_intr_assist
> - nsvm_vcpu_switch
> - svm_vmenter_helper
> - svm_vmexit_handler
> 
> I take these are the VMX equivalents:
> - vmx_intr_assist
> - nvmx_switch_guest
> - vmx_vmenter_helper
> - vmx_asm_vmexit_handler
> 
> Jan, did I miss anything?

At the first glance - no, I don't think you do.

Jan

