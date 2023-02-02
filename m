Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875C6687CDB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 13:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488790.757035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNYLq-0004m0-DE; Thu, 02 Feb 2023 12:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488790.757035; Thu, 02 Feb 2023 12:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNYLq-0004kF-9o; Thu, 02 Feb 2023 12:06:02 +0000
Received: by outflank-mailman (input) for mailman id 488790;
 Thu, 02 Feb 2023 12:06:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7Uy=56=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pNYLo-0004k9-Ky
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 12:06:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2d3862d-a2f1-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 13:05:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7616.eurprd04.prod.outlook.com (2603:10a6:102:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 12:05:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.024; Thu, 2 Feb 2023
 12:05:54 +0000
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
X-Inumbo-ID: f2d3862d-a2f1-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdDvCT4xAJjvTIsHAPA9sl+VjtIIaQynlCt1DZlUmNMMDViX19pFw1jOv23cFoG3H8pChqYRb00bMBACSsGzriCvyvaQFyEGgVDQ5UEb93RdAlJj8vDRGfbXR8hDFXwPQOhst76d76vBKZi1nLqz+PrjwSiqJUmiALrWSW1SnaSi4DuYeY8EZIoMnU0fnsfUs1S3qKNnV2ENCgkRCxgg6bcZ+9Ypq1OqJ/cDhqtbC+dpnZzARMGA3JYToSfXHYp9NdgV4DIJcQAvyEuSf3TK13ReGm+VzlS9/gtcjBa2rLsMHjbUzHelXD3v9cP7/SJpl0ELiwHiTHI//3zaVq10AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtHsB2GsIBUsPcnfySCFMm62xZmAg6mkNF7ot1sFLCo=;
 b=K1yPE12nYqsesP/NITffp6unYVKgVTsiMK5ahpG7620AsSLAxCrBuXYPP4sGTUa7tzAYkFmvxEGgbnGtVST0kSaIywGy1qfRVN46YufF8kSnqqcUXsxO/Jb5yoavJuyKMAEirXbur75WRDhmmAHSafxtGywY8DGpU2fD0Vreng7NfRru3MPKniu3UarJDq8LXMIiBct1uPW5SGuuEWdy6+4+LgZGFiUnQODNlpzl2lpQnAnYl2bLDyGBOx7fzk5vr3TqgTaYpw99sDmCj4QOk1NC0/lgf0RQ5bjTcQn4UxHCB05NLfskJDuWvRxANnaN/HLitOxop4bJxs3Tu18wUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtHsB2GsIBUsPcnfySCFMm62xZmAg6mkNF7ot1sFLCo=;
 b=tZfafhIektJwGbK7ztbwCzkL9QEM7g/t2MGXlV++jblW67IiVPpzcSA/T7ozb+z0K3LrP5V0i4Pw2EKjylHkVBNr9gh/zxqfIJ+RoPL4W/uaGadkk9VJ9WTNMBDyi7o8KRCYOFxwKiWdjsyZNDjvBOfKCPd942ERAMwhxFo51I4j/oYyunB3rROtCAp7pvV+VmBMosEBqt2iB7gw+CebhM1bQnEDD/k05WnGDMchFApdQIOuhUjSUZ2gOjOarReoddOMMv7zxs4Vlpmlw3qPIigdQFhdGTlvMpe+ZkTMPPuHLg9x7VmvpGP8YoAKvKenqZvLpkeFUD9KvxgsQ1GQXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1673cb6-6f4f-be53-ef82-2ea2045533fa@suse.com>
Date: Thu, 2 Feb 2023 13:05:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and
 vector length
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
 <20230202110816.1252419-8-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230202110816.1252419-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c224a5-317e-42fb-a8be-08db0515d59c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z0R866sjO8mlbLJ9m3bu8qbbWQfhqKK4gao8NglyqVZqsVhM9VRlEoKcCpep0/Fa0oGjzYzT4KDOeBTbj/CwbH3FOMBLtMtNrh5R7/YDmcdmcz/5lRHZMkqXLt01pIkZN+R+xxO1gOJ2YEcua4azo1XSNqZZxps1b+R8H4GjlfxbMiQMrz0IXIDtvy73X5md98xfHWREVC+XSoy6QfTnk5Qh312LkyRtawu5AgE67DDmDeETtWJ4QUp3mH5Edz99zO0r4xiq2bECLr2JqcXZnxbqzwl9Sco4lK7zhF6O51rNdxZUoQ+0dbimCkc3R/0ofNH0gGpF1xA2GqrsEtxxAvmVMcf4Ew06IzivAAGsk+VSTg9Hv6MrHbORD1lusveakUVDVwgO5fcE70y7jdwgnh+3fFKCBxYxSzwPm3i+dR8UEF/v2ZMfHVbidFgsUL5Wvmprfwg/QHPBYHBF3Qqu1/J2tFohIZIKOnbt0HhzyRJXF0UMTg4PIUhDnmv31aLG5scEN9tbOluGaJ8DBgge8vjPQuwBrf76m0Pw6Rfta2/WHFWWYLt8erqtY3BrOC9vgj5mM20UYsEDULJKzw8meAVRUM89K/sAAQUWBvL7oEu5x1xL/wtGce+l4Irro37PLb5BQYjx2cdaAl4TemWHxDUMskGamqjLK+WpTXhB36KO3qfyJpJOZGapmE5Y68dYDuOHgR+TQ450rpZzK23o+loWM+7exls6qw1PRlW7Sho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199018)(38100700002)(31686004)(36756003)(2906002)(31696002)(41300700001)(6916009)(66476007)(66946007)(4326008)(186003)(8936002)(5660300002)(316002)(54906003)(8676002)(6486002)(86362001)(7416002)(66556008)(478600001)(26005)(6512007)(53546011)(6506007)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUsybEx0RmVnSFVnVDVYSDE2cmpjWnRpYlJwbWpZREQrZEljclVWQjNDaFNu?=
 =?utf-8?B?QS9odmt0NG1hNVhGeFg4TXQ0NEJ0bHZ0d01oUzEzTE01ZWZUUHFSeEo4c2t0?=
 =?utf-8?B?c2tlMTVKYmZkR1dTYklwSHFpdjNWVjB0dGp2Z2daeXFaQUU0cXl3RytqdDVL?=
 =?utf-8?B?VDlRek02UWM3OWQzS1VPVEJSVFcyTlh4NEUwaGlHZ21HMUU4VlBrd2ZldVdE?=
 =?utf-8?B?UzRiMzFJQUU3UU5YZlpFRmhrU1FNN1Q3bFZKUzhvL2kxMExYYUlTQ3dETmlE?=
 =?utf-8?B?RTNyODNyRXdVK3JsOERxWmlvWTFROUNya2V5R1FwY21KYlorY25wc2xqWWxY?=
 =?utf-8?B?NTVSZ2VxK3Nob0RxR3lRQkxLQ2JWNGZVWGJ2QXNSaEZNU3JBbk15cHF5Yk1t?=
 =?utf-8?B?Yll4RGxrQTRkWU5DWHFkdHdQcmFYc0p2SGdKa2xiRWlDNFpyak9FKzFZSDh1?=
 =?utf-8?B?VE1xSlFqeG10R29ycFU2UjR6SnJhcGZsN3R5QW8wL1NTYmpOR2RXYVV6NGhK?=
 =?utf-8?B?bnhEdWZnNlF4T2cyejZCc25JNHB6T09PNkF0c1FBTVoyaHJWaml5V1NSQlBv?=
 =?utf-8?B?cTBwUTV3TmtzaUNRUk91MTVoeDA0TFJrK0ErOTd6a2xYN1RBR0VqZE04Szg1?=
 =?utf-8?B?eWpTTnhwMnRIQVAxSllHRm9LWDlMN0tpcUt0N2JNT0FodWdOMG5IOUxCMFht?=
 =?utf-8?B?M2JpQ1NKenhja3k3cm5OYVdlZUQwc2NRY0FSVlhodTR2OUk1TFdwbUtQaDMv?=
 =?utf-8?B?OE9ncHpNRlAydjUxTEk2dTVaWWVDWlU4dFMxQmtQa0h6dWNxYnF6c2ZMTFp0?=
 =?utf-8?B?QUhPT2p0djRvNk5JZFV1ZTVPQUdlc2NmVkJQSk54YWFrM2RqMHczbjd6a1d6?=
 =?utf-8?B?SVRLSGRjZVNpR3d6Tll6dVY2QWRXWXVlSm5SeVJnallDM21ZS3JhL2lJQTVo?=
 =?utf-8?B?VmRpREU2TE1YL2xUMXNMME4wVWVPeis2WmtWNlU0ZEVkbmQ3UzdOS1lpQnRi?=
 =?utf-8?B?d25ZaTNZUXNOb3RlYTJ5YjhaZ2xmdHhpU3JiWVRoaE9Ta1B0VkNuT093NTU5?=
 =?utf-8?B?RGZuUGxkWmpEK3dreUw5ck51Mi9pcUEyaWh0dmozUzV2UUhmRHFjaEVzQVB4?=
 =?utf-8?B?OUNFcnBTeXNld2J6WGx1Y3cyMitwRmV0eThHdVVNY1ptQ2cwUWk5cWRNZyt1?=
 =?utf-8?B?VElmZDRhc0pySEhCQ1QzVzVzMUtsUllCL0ppV1VaL1JZR2xyMWl4NUkreWNy?=
 =?utf-8?B?akhIQkE1dFF1ZVpuY0FLQUdzL0hqMmF5OXFuVGhMQ3Q4SDRUNDNveWZZTWZw?=
 =?utf-8?B?QmlPL25wSS8yL3JTRUZhYTJydWhYUmZSd3pvQ0RSNHFUazl0dEIrRjlEWncw?=
 =?utf-8?B?SFh5NnFxV2F3cUtBMVliakRmR2xIZ3pJaHpWV05pUWhHLzlNREhuSHhJTitP?=
 =?utf-8?B?T1FiVEptSEJGWnhha1dvV0Noa0FFQmFQa2xaTDRLVE15V3hjMnZiSWo5Z1Jp?=
 =?utf-8?B?T2I3MHM3QWI1amNudklqZERCVWhndEhTWGplZWlwbzg4RnRBRnM0L050U21O?=
 =?utf-8?B?dzNYcFVrMzIrNi93Tzh6QmpiUDIxN3pQRTA0UHk3VFpxZ2JJNklQZGlMT2JM?=
 =?utf-8?B?ZzhvL2Y4c0g5ZFdkaHJ4MUlXc0x6ZkdDayt5VWxKSjg4SGJzYmlmbWJ1RzlP?=
 =?utf-8?B?OFRSRk9ISU5XUEZXWmN4R2cvVDEyMGx2ZEhZVjBjb1BlK3EyZDJDT0ljVGhh?=
 =?utf-8?B?WklDUDdtYW9MRWU0YTdUWWhJMFZWTno0YnpYeFEyMVFkaVh4QWpJbk5xZW5S?=
 =?utf-8?B?L0d5RG8yNUZjUFp3UGdLdzY1QStFejMxcmdrNmlvNmVDTDZ4ellWVG9WS2pi?=
 =?utf-8?B?VlpYa3JiTDZyaWZNeERHYkZXM1ZXR05WRSswcjVBZy9TYzllenNWemlyR1Vz?=
 =?utf-8?B?L2pRU0pORENGM3dock5HaW1zREtRWklnQmh0TmU0T3VSSzNpUHo2Z0UvbVVI?=
 =?utf-8?B?Ky9FMFptTDRyWVBIdVd0VGNNdFNKODN1VjRGQzFDTmVtbW8vd1ZNRXJNY0xq?=
 =?utf-8?B?eEZOeU00ZVIyS2NBbEM0VXd0dkJIdTRHWE9LaUFCMEpvN3loYU41U21NdkxI?=
 =?utf-8?Q?nS+cXiR1KBXbxXtge7eaMSFvJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c224a5-317e-42fb-a8be-08db0515d59c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 12:05:54.0729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsEzL2P16YXRKkHhCzKnEwoJ7I+sM89jZNZbVwL71O7brUoSp0Ju/+snpf5qDc/x6D2Ty09c0gBsnTLjZDZxJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7616

On 02.02.2023 12:08, Luca Fancellu wrote:
> When the arm platform supports SVE, advertise the feature by a new
> flag for the arch_capabilities in struct xen_sysctl_physinfo and add
> a new field "arm_sve_vl_bits" where on arm there can be stored the
> maximum SVE vector length in bits.
> 
> Update the padding.
> 
> Bump XEN_SYSCTL_INTERFACE_VERSION for the changes.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from RFC:
>  - new patch
> ---
> Here I need an opinion from arm and x86 maintainer, I see there is no arch
> specific structure in struct xen_sysctl_physinfo, hw_cap is used only by x86
> and now arch_capabilities and the new arm_sve_vl_bits will be used only by arm.
> So how should we proceed here? Shall we create a struct arch for each
> architecture and for example move arch_capabilities inside it (renaming to
> capabilities) and every arch specific field as well?

Counter question: Why don't you use (part of) arch_capabilities (and not
just a single bit)? It looks to be entirely unused at present. Vector
length being zero would sufficiently indicate absence of the feature
without a separate boolean.


> (is hw_cap only for x86?)

I suppose it is, but I also expect it would better go away than be moved.
It doesn't hold a complete set of information, and it has been superseded.

Question is (and I think I did raise this before, perhaps in different
context) whether Arm wouldn't want to follow x86 in how hardware as well
as hypervisor derived / used ones are exposed to the tool stack
(XEN_SYSCTL_get_cpu_featureset). I guess there's nothing really precluding
that data to consist of more than just boolean fields.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -18,7 +18,7 @@
>  #include "domctl.h"
>  #include "physdev.h"
>  
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000016

Why? You ...

> @@ -104,7 +110,8 @@ struct xen_sysctl_physinfo {
>      uint32_t cpu_khz;
>      uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
>      uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
> -    uint32_t pad;
> +    uint16_t arm_sve_vl_bits;
> +    uint16_t pad;
>      uint64_aligned_t total_pages;
>      uint64_aligned_t free_pages;
>      uint64_aligned_t scrub_pages;

... add no new fields, and the only producer of the data zero-fills the
struct first thing.

Jan

