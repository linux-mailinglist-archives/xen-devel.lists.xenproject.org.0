Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB98581655
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375436.607816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMPj-0002sB-Ju; Tue, 26 Jul 2022 15:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375436.607816; Tue, 26 Jul 2022 15:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMPj-0002qI-GB; Tue, 26 Jul 2022 15:24:03 +0000
Received: by outflank-mailman (input) for mailman id 375436;
 Tue, 26 Jul 2022 15:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGMPi-0002qC-90
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:24:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130050.outbound.protection.outlook.com [40.107.13.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9d97378-0cf6-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:24:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6891.eurprd04.prod.outlook.com (2603:10a6:10:112::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 15:23:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:23:58 +0000
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
X-Inumbo-ID: f9d97378-0cf6-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d95E6FHnWXCAImAxvtU/qRh1X7ee7iMP4RTngXInGrK5irX7iEPdFcSplchDYzvOzCQ4h4A6HhvO++1BJ3Mxz2FNNbqg3iQ8m1fCRgRriMzxQHw7uDKUW8lyL1iV9E/jjhBU6PhYGQv1vqAF5SNJpXECdfQuk3SXNeDMG8YpHuBFowGrpU0w788qVMU+EZJNIXegvhDzwal/T30uft5JPPFRuSqAUGxDqD5+X3VWogaSX8H3+3JNIpzLS8PpuSnp04eKI+TsA8coQbrJRA5uQobm/ysVKwyb8PCuxZu8YPgXgTgDnshMZeqsPvkriDlDmEUpVFVBtT7ggiHQ/22ZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7p2iaxgDH0aR8FX+tXM1Fvf5NfQywoIgZP+Tf3sW8k=;
 b=YS/wrwhh0X6uTpmWoK4H/ZleKweslFSCObbO5NY0Tuvwddfvj5YJIEqHbY7EILqHle1bMpvpwJGigbP7iP1S/VAvWfr0DnJShi2fdbdZ+ahmHp2tK+NlfXTXMqGoziq0lt2HnLU4BzoDvUBI0LicLSCqYU+ACQoBi3n6/AB8sMpwHogI526SGeFqAkbMeBPYsJRTBWCsRHN5jVOH3TZ72WDb+E63jVe+93gKHQ2PV0ui03OMCce53B/WZGT0p7wU//tc+sdMNg3vGmOuTPmT0iUvug+WwgGlZROHBmPgBYAPhEhNSGVORAluzX2FNAX1Rwmn2eQT4Xy4gsn1L7WZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7p2iaxgDH0aR8FX+tXM1Fvf5NfQywoIgZP+Tf3sW8k=;
 b=CHJTXESCcYcojFmsbDMG/z1+8AU9cKyktVs2M2VMMSF7ViHsMI5Jx/ZOrUWKqbOYdQfL/q50Ehg6gGZCE7hKzIsuxf/ZXwizPvymkYvNkngeSOIezAAKGB5DX8ALYYLMBIWh7QXBypsb9s0Vab+2ueab5XjC9Q1Un3svzetQ/P5u1+RqdjThT/+rsaQadTHLcklR4xkVYn+aokZP2HthGo1slFWRkYiLxvcn53cFqNJR+dcoVIE59qx1NlS57XMfdEJD4/SOzLsjIOb2eqhjunR0uFsSADvSSHgdYKYyDmGz4oQJ6d0s5USRWfza25Cq8TmA57sJgofcXaIWtoKgFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d31174b6-5477-d3b4-e557-a8010e86f914@suse.com>
Date: Tue, 26 Jul 2022 17:23:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 08/11] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-9-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220719174253.541965-9-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bea6f6f2-a305-49b6-5d49-08da6f1adc3c
X-MS-TrafficTypeDiagnostic: DB8PR04MB6891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RYA3OPESGV2fR3FnUO7vZXGiCLqT0qzEX9rL11BRnFDxWUQo9Ruabw5mhCxZ0UDkpMaabGxHQVWNFdEEqnzdOddQN7+IqPDyjNYAhxWLU3hs80xzt1G+rIKGFdDt9JMV3ufBRUrMr4iZ+7MS4JVmrr6FPBYYefhApJnzTrmDTLY96IUqtQ8lGfb0IHchizjaX0+xW7IpuAZ8P03rdqOyJLBnfSTRHdapj1g1X7mvlDGe1GugQXqG3rzSlkQ22J1iQOkfJD2L9VT7RkdQDJp4XtCrh5pfGkN3A12L0LqVVn6pkeWVtUas2Y/KqRPnkc7s5GIv5AdBxjHXtk75JZzHb7TW5c7pQ2D7CWClhWAbHolVANt/HpJVZFBSfIBomwtankHh/+XVeD06H8bZweTrLxa/e/3rfA8BoPSy+TCjACU+M9E+NBfJz0NytTtnw+hDmYCqBiybNTOLsRo9D8Z5Qn7zSm/NXQEu3q05qx0cVW7lUygJl3UDAdjM7iQHoHa8F3vXRdgG4Ujkyw6D+AdmeEwcPMZb4puncP7xEv3/naZ1mV6UVaO9hpfhEsWBIRmEXl6zzFs3wvtIh07rsaZKEdXIOrNNonYbZo2fYge3G4qa7ly7kht085/kvFOu1KFVOpGnhUIEexLmx6DLuoTXnUYJBycdXkpR6sP9IrQjdw1HwiW24VSZRUVxtcEuFD/MFfIvYrX5heC9y422pZ62PLdSKDKsaLrKEDDmRyNE/KLnAp5beFHbeA4CCEstdqmEwcozOTkjPi1BKnHvX/WD7/dQs/CiaJAC1CYlEv+P3qkqfW3W0Df73bnV4PEzPd1Asj+OZ0ZAnYi2OVze4aB/Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(39860400002)(376002)(136003)(26005)(6512007)(2616005)(53546011)(6506007)(8936002)(5660300002)(4744005)(6486002)(478600001)(2906002)(41300700001)(31696002)(6916009)(83380400001)(186003)(66946007)(36756003)(38100700002)(54906003)(316002)(31686004)(66476007)(86362001)(4326008)(66556008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ync2dG1velJBYzRXUldFV3ByM09wVGlDOG5Zemt3bnl4N1NERkQ1a3NPUVRE?=
 =?utf-8?B?SWFIa2dOVEZJN0hpOExaVkVRNkpEMW51a2s0emVBNU9hT2VLV25ha1Byc1FE?=
 =?utf-8?B?M1hlNzUzMytxa2NJdlRWcVZuOXcxVm9kRVBrSHhCdW0wdDhabjVGRzdGVDNk?=
 =?utf-8?B?a2dOY0FyaWE1SUF5b0phTUFvVFpkVUlDeVVZeEdBMkFvUk1oVGZVTWNFYThS?=
 =?utf-8?B?OWlTWGZlbVBXTGVTZ2N3L1pLRkhhWGNrK0I4SS9xZlV0eFFQQ1dkRVphdFZL?=
 =?utf-8?B?TEZ1Tld6UFRnY0JhZ05zZUJrbXlLTklZVE5tZ21mdk9ZaE4zeGtjaG5idFc4?=
 =?utf-8?B?NFEwV3Z4MkZEL1R6NHVoaS9OcnpNMnhsYlNyMjlaQ09NOGpMelluQTBsQTR5?=
 =?utf-8?B?cnQzN0djbEcrQW9hbzFyOGowRGxpUU5BRFd4V25KVTllUGNFMDJCY3F2dkNm?=
 =?utf-8?B?UTJKQlZxQ2ZHRUVqK3RxRnlLdTQxdGdYcDk3TzhFTnRyRFk3OXB2WUNwSnZr?=
 =?utf-8?B?KzV6SEhTR2dacGtQSkVxUTdydmczR0V5MVFxOWZtVjM2b3UzWE5IUWNFMjJk?=
 =?utf-8?B?RTZzVUN3SG1CcThQL2lCeEhTVWY4dXVvU3cvam15WGxVWjJYWUhIOGNXR1VZ?=
 =?utf-8?B?ZmlIWTB1R0JwMFBRNGFyZHZjRUdab0Q4dEg3VFlRSlVjYjBSVUlHak5JamYr?=
 =?utf-8?B?ekI0a2h2aitSOHpJbUNRUjl3Y0o5S0FsbDNvRGRYdXZZUFM4bHM5RElRSjBs?=
 =?utf-8?B?YmFISXlacGVReGkrbEpnaVdiNnFUcXhsOWI4YlNzRGt4OGZidUN0bWkreVE5?=
 =?utf-8?B?eUJlVE9vVElqMjNsa0tHNGNNL3FwZE15Rm0wWTRpN0dIRUFXQi9ZMjdJNTQx?=
 =?utf-8?B?M1d4SGptaHdKZkZkZTd1bjNjMDRzdHZQVXA4NkN0MW85dGoyNkZOTjRGSFFz?=
 =?utf-8?B?RkdwdVhPUHE2U09sRCtCK1NJSTZReVo4aCtmREFnVjlOTW1zdnBTL1RYeGd3?=
 =?utf-8?B?SGFIZ1pBM05tSmRHTGlpbHlFeHVyMDMzMWZjUUVDWlBXcEdqVWRNOEJZbUx0?=
 =?utf-8?B?a1FqdGdST2t1VmRrenU0dWlCRHhBRFFtTEE4U09mL1JsOGF0M1lpNTlSMHVh?=
 =?utf-8?B?WnZyZEJ2MyszbHA1c2tROTNpZkxPZmdQajF3NW9WdVJzOHhiZnZjQzgvNkJG?=
 =?utf-8?B?Skk5L1pPQklLZy8vQUcrcG1sb3VMa0tPS2Z2TEQ1SDJ3TlQ2TERsb1ppT2VP?=
 =?utf-8?B?SnBteGdUSUtEYTM3WXNONVBuRlBzaE5Neld3NDF5R1dsS0RWVDE2NkJkYUNo?=
 =?utf-8?B?R0lITmYwZEthandWT0ZTbklCcUVtZ1g0Tyt0bExNUXhYbmk4TE5UanZLL3VG?=
 =?utf-8?B?dGZoc3BXRlFmVjBMWDJSVTZ3dE41dU5uVFBpazlvU0xkZ0J5UFgvODRScms3?=
 =?utf-8?B?a0NMTGo2TTI5cHROL2lhRCt3WXcydC9uSzRtTlQ3M1p2SmlWbGYycS9KV3Fl?=
 =?utf-8?B?cWJqYVd5SFRvL1ZVaHBEL2lFdDRISys2VUdqMXZmUHdUQTk1czEwK0xDRE1x?=
 =?utf-8?B?S0FaVnd5dFBKS1A2YUp6U2dKY2Q2Z2l5Q3JnbFNITWdtK3hyZHZZVTlOS0FR?=
 =?utf-8?B?dnJ6MGR0YU9rQW1xc01xbDhCQUk5TUpGRS9Qc1VaKys1a2xJMENqMmVsYWM4?=
 =?utf-8?B?Rm5RYUlOWlRPZTE1R1E3TjVQbVk2eU1nR2ljMXVkUDhPejFiT2g1RDRLLzlG?=
 =?utf-8?B?VFowS3RnMnFHd25yUmh4bExvMmIrdFVqQVNDZFZJaVFNRzI4YnYvelB4NTIy?=
 =?utf-8?B?cmpnNHQ2U0dsOU8xYzJrVVh0ZmxiMjNKd0wrU1h6RjAxK1BkM1U3WEdwTFRR?=
 =?utf-8?B?d3UybG00VnpwOE1OaHVISWJaenVGV24yLyttM0FMelZjYWdRdlkxdk1xQ28z?=
 =?utf-8?B?UFZzYThDUlc0cUY3cnlvVXNkNHZsUTR4ekNYZGI0K3NiOTh6SFBFQ3dqWStR?=
 =?utf-8?B?RC9oSjJlNU1JTHNUblkrRk92SGUvcXRTNzJ4UzhOU2c1SzB2VkZoUEwzUU9W?=
 =?utf-8?B?RWlhZDk5M2xyT0xDbDVDend6L2tyOExiK0hPWnV0OFVnbC82Z2FXSWpJTlEx?=
 =?utf-8?Q?D1iU90f1Q2PrwEicYGyVnWVoK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea6f6f2-a305-49b6-5d49-08da6f1adc3c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:23:58.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYdEoNEVPd63Ux/uuW9KJ0OSpgeh2UcsBRq931hu8lxEHA/ZMAy0wZzBBmt7f1jJzxe0+g3ZdKKbLmtsJE4kcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6891

On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Reset the command register when assigning a PCI device to a guest:
> according to the PCI spec the PCI_COMMAND register is typically all 0's
> after reset, but this might not be true for the guest as it needs
> to respect host's settings.
> For that reason, do not write 0 to the PCI_COMMAND register directly,
> but go through the corresponding emulation layer (cmd_write), which
> will take care about the actual bits written.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v6:
> - use cmd_write directly without introducing emulate_cmd_reg
> - update commit message with more description on all 0's in PCI_COMMAND

I agree with the change, but it's imo enough that you also need to sign
off on the patch (and this likely also applies elsewhere in the series).

Jan

