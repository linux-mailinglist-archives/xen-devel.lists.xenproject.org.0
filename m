Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B9450A82
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 18:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225998.390408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmfRY-0004dE-1t; Mon, 15 Nov 2021 17:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225998.390408; Mon, 15 Nov 2021 17:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmfRX-0004aH-UV; Mon, 15 Nov 2021 17:06:55 +0000
Received: by outflank-mailman (input) for mailman id 225998;
 Mon, 15 Nov 2021 17:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmfRX-0004Zw-3m
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 17:06:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e754a5f-4636-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 18:06:53 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-qRL6pCpYPKSs1lE-4YCcQQ-1; Mon, 15 Nov 2021 18:06:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6670.eurprd04.prod.outlook.com (2603:10a6:803:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 17:06:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 17:06:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.6 via Frontend Transport; Mon, 15 Nov 2021 17:06:49 +0000
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
X-Inumbo-ID: 6e754a5f-4636-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636996013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZjl3Q9lo2QDlYm2sIO7NtrPNxZquufQIqcnP3IMC+8=;
	b=ARQ4ntwt0yG7OTwBwEa4rPGQaTmFrThQ3UBsUZxIeczheXRACH66XKKnE7Vu5dxfd3DnR2
	IXbIkweU3hOaEvLpl3D+EeFpgUrIAtoO3JyfOS+VkqJZ9dREubr2hrWqzthxuyCgsi7SaE
	6A/Kwcln0D+pgEu5dIeKJJshO5VbSZE=
X-MC-Unique: qRL6pCpYPKSs1lE-4YCcQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJCDeijLRmAHxgOVcECCJVQWtE5Xqi5wJvYA5HXRNMJtYkn8CVPqlbpW+bGJO/z4+j0eKTbDzTixiG5IgBssf2kfBtpl80/h3wHOhHEefp9JrIoLvQ/uckJFKMDod1tlgbTpOrFo/be7kj8mdsO2cjXH1zsmO3solLWBkgXO0RrGd57gExkFEGumOV6JEdA0NgmLbW0fod46Vqwqytr7kzD1pKEB87xquubukDrK1sfIbpk9JFjDV99P+gzHkfaamSl53yk3TZQmApehH8Ti5yfHjSx6r/mMRzVDEBxZQiR+j27/PVPiNQiFxRJsafTbHBqlkC2OeJlcVFPJtEhUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZjl3Q9lo2QDlYm2sIO7NtrPNxZquufQIqcnP3IMC+8=;
 b=PysMizsq3Pob3YQFV5Mg9OpM0klwFI+lAy3hbmQhmauP70maQsUkAnLaQN2aZHiTLJqAI0Dme+PAkuEba2CbVBi6xu4aJQKob1i/5Lq7wwlFdIiLPNwX9OoK2d3jGHUZzNw0bJ0JLhqqIvK1+f6dil2UblXIGm87Edq6WlBqqs4AY47Hif2qGORivdUtsHPZAkFAPf7h9dGosr40TDGYgZpTRqHt6pDDEty+TPWf9UT63OMIGdORd+m6hshBGNbTzvVVW5UMuVHEs0ilDeiBewh3bdbHxoo+zfXiK17O7se1ZXdJdjZ701lkkBRQ6WrutQPsvwaX9iM6KpMyJdraHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d72b3b0-22be-45fd-2bc6-cf27f96afe5f@suse.com>
Date: Mon, 15 Nov 2021 18:06:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 04/11] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-5-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-5-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48a82b86-ee47-4e1d-7aa2-08d9a85a502e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6670:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6670246486B314873857FC3BB3989@VE1PR04MB6670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v4sjY8lM9k3itVm83A7Za6xgqRKvD2QCCwN41kqEekE8QqWkoAPqJ3jSI2dg0ih9HGIFRDrsA5w62LqrMv1FeGufMdTglclgSCd3eZuYSI0gVY+6t8gqnS2XtisoyMJ1fl3O7VhJgZj8DhBdKPv9or4EmXYe9Jv65X/RyonrF0qCLGEiSh01xwwgpv8txRyA5WC8gHZMku35GlSh/kUfyYcYtMLjONasySwiYK28Y9Canl92iwmrJw15A1YlIfIPXqo5FMIdy4OvP+f7H5QwyIEi9LFzmazCnHI8yVEAXUGWoCW9973rQOEJxk6XQMx2IVtgSK/DuATRkLxNZSa0sYG4hvUmMr0QXYSDPYUtkL7YX4pAJt9KI48JHBgcIpX438paQ6X4ECWKbbuIV8ZhPEGOWPwTC8Lv3JMcGjyJVZ56yI6oyn2auwxqna/7grBJrgnB7uqqOFZEJgkOgjIp0s4Ba4367IkFebBBMb0ykgZM+GdhguqSDgT6cmxQ+ywxpEcgtszHZFFyVnGPjkkW4GqtmQZMbKLb3+mr0vXLV66daF7kolsYyir/oXz+EZtRi4NfmQpy2ITdAbuMrosf90pa6STnYq7fon95s2ULxcyUv76iVkt4ZgMdsc0aJSHvR3l2WCnWpStXWqRC0/ooow06qshEgTxeAFpbvb8QrOVmJPr3ZL2GewYfosoraHuLSve1sqY5rUTuLqbKMiv3xsGPjftOgAMdBculPdcqWtw0jIIkgkdzmgCJ8MwoSWVE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(31686004)(53546011)(83380400001)(6916009)(16576012)(8936002)(2906002)(6486002)(4326008)(31696002)(38100700002)(8676002)(316002)(86362001)(2616005)(36756003)(66476007)(66946007)(66556008)(7416002)(5660300002)(186003)(26005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akUrTWU3OGZieHQ1SDBUVFJqbUpkNHNRdjNmV3ZEU0xEemIwU0NUTDM3WC9t?=
 =?utf-8?B?QlhmYVVGaEc1Z1k0OEhlamJuRkFzbmovZEFpc3FxNzUwcHFpWmUxL3dTVTM2?=
 =?utf-8?B?TTUvOWVrMS82Y2VweDhUc2Q4ek9mTHNaWEl5VGZGWTBOSVFWQVpBU1VlTzVV?=
 =?utf-8?B?VWdCWE5SWWZWYXJHa1QyT0NjenRNZW1BaGF6cWx0ajNHeVdmUTd3YVd1eGZU?=
 =?utf-8?B?eG1sVmQwMXk4S0Z3eFJvYmhMc2F2N0tuRis5Q1J3WUt3KzE0NmN6TURKSWVN?=
 =?utf-8?B?WkRicGxwNkw3TEdXYUFZeXdMZWZaVkRCNytMUnRxTG5SSEI5TVBKMVhiU2wr?=
 =?utf-8?B?WG4yQzlDVE5CR3RiUFB1SlluTUNHWm42RUpyY2F3Tkk2RVh3NHVaUllVZG9F?=
 =?utf-8?B?SUtQRWd1dzc4dXc3bXNRN3dmZU82TDhhTjBwWkpya1Ztb2lKN0hqOFV4YkFH?=
 =?utf-8?B?c1lva0w1VS9qL1Z4WVowNExnQ0dYdjE4VFJNMVpRN29EbEhpY0cwOFRuaUtW?=
 =?utf-8?B?UDVxRlJwa3I1cHhrMGR4QjQ0V3MvL0VBRTl3b3FsSXNsYjNSZU10UkY3RlV4?=
 =?utf-8?B?eFVrTDBCWW8vQ21VNnFCNnQzaUJiWnN5WjVvYzBwbVBBa0RlK2l5OUhFMkJZ?=
 =?utf-8?B?dTFMN1k2dTY0UGVzVFhzQWFuL0dQYmxxbnB1R2FrajhtRFhKS05IQ0xTRzN4?=
 =?utf-8?B?STRtZmFJV2VVZ0FCQlNTNGdJQXR6b1lWK1RQTCszUlZMaVJRYzJzeDVSSDk4?=
 =?utf-8?B?dWVydERyOTd0MmZqbXdjbFdmR2ZoOFdxVVNTajJKSk0rQnJ3S0ltOHpPbWRy?=
 =?utf-8?B?dTFhOEt3QTZEN1c5ZXJ3akdjalQydmtnYmFxeFd5eHNMNGtlRGs1TmcwMkJP?=
 =?utf-8?B?YWJWdk8wWlNKK2t6Ynhwb0dRMWUvMHRRMUdHK2srODl1Q1FtSjBTb0RDYnVq?=
 =?utf-8?B?L01laE5RVFRTTEpXT2lKSDdpN2V0WExVTDNQOUJNcm1jWXI4Z2xMUEpJdktW?=
 =?utf-8?B?RVNPTnR1cWtFMDdySUZJYW9Hbi9Zd0phcGVYT25CNGFXLzR3UnZiSERiTWVF?=
 =?utf-8?B?VjA1UnN6ampGOHdod3FhYTZPdHkxckRrT2lWUzloenZvZVNiUGFHRnI3SjZO?=
 =?utf-8?B?R0xFd0VIQVR0M0t4NFRkamJwam1hMTJZM0lFKzRpR0V6THVGeEdZbnp6Tm5Z?=
 =?utf-8?B?UXRHTFRiVjBYQkRwSGFhM1ZFcGlFRDFKazc5dGJzenUwOTk4eVRUZmR1V1I4?=
 =?utf-8?B?bTJWUThOcmhlTHhiUkpSOVdTTVA2WW9FajRlQk04VVhqTHp3SnJYdStFcDND?=
 =?utf-8?B?ZE4wOW5MRTBOOHRKUHBUV3RGZ053Mk1wMXdwcXlKMGtHMmxKWjloYm1Sd00r?=
 =?utf-8?B?cE1rWUVySmRhNnZBTjhsQWZLWllaWlhIZ1ZVOW5HbWxtUzRHbzU1U1lWT3pT?=
 =?utf-8?B?aWY1bEJYbkxhWkkwaDZqUnZOcXZmR3E2dXgrOENrZDI2TzIvMWx5amJkWmlx?=
 =?utf-8?B?TXN0SDA3dlZqSHhhRkZnNm9wNlh4Z0JWbVlkM3pNWUJuakVPUlBZTVV3UmJP?=
 =?utf-8?B?NW9oYjdkNVovcmlDQ3k3ZFd0VmZxNUNET092TTRCYlZXR0t3UlVoSjh2KzVn?=
 =?utf-8?B?NnpmQnIyT2Rob0dSaFhLaTA1WVBZeVllNGU3ZWlOQXRTTjdsRk9ya2dKNkh6?=
 =?utf-8?B?d2xaSmozZktxRUxza01ZQ1d2Y3VmOTJCYnY5UVJRMFBEVmdaa0tsdHg1aFVJ?=
 =?utf-8?B?Z1YvZnVZRVc1cVd4MGd4ZTlnTWpTK0pRLzZKdkNpS3NjSjhoRHptWThWVm5o?=
 =?utf-8?B?bVorZENwK29relJQdG8yTnRiQzRNcVFWMW9WUGxSUTJXWE84Z0NiaEZDVGt0?=
 =?utf-8?B?WmxDUWF4SjM3RENvOFl1bWxQZmlqUnErNXl2RWNxeTlsVXZ3RHlicUptNWpu?=
 =?utf-8?B?Y2Vya0pYSURSSlFGWFRZazdKL3l4b0dyWktUcDhXUDd2WGZBeGI5dnFjUFgz?=
 =?utf-8?B?VFJPSmtrTHZDRW1CakVBc1VOa2NqYkFMOFJxOTF1ZG5CTlhxKzRid1FaL3Rq?=
 =?utf-8?B?QzV5QzBnNVF4bmpJNFZXUU0vb29Uc1hROWxzQ01UZmdWVmk3blVURlpBRmt1?=
 =?utf-8?B?cStjQjZFeENxSHFiZDAzMkRyRlBUZkxSclFvd2t3Y2R5bk41cFpNNHZaTHVv?=
 =?utf-8?Q?3dQMxaB2aA09rkHto5EFuEA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a82b86-ee47-4e1d-7aa2-08d9a85a502e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 17:06:49.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NIpCB4gJgrx3qJ6zxwFGS/4saeF48JHAaaOJuDYwDclMVuAx6ovvLESMT7lVMtsLev4cia1zQQMAuCYJFu5rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned some work on vPCI side needs
> to be done for that device. Introduce a pair of hooks so vPCI can handle
> that.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v3:
>  - remove toolstack roll-back description from the commit message
>    as error are to be handled with proper cleanup in Xen itself
>  - remove __must_check
>  - remove redundant rc check while assigning devices
>  - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
>  - use REGISTER_VPCI_INIT machinery to run required steps on device
>    init/assign: add run_vpci_init helper
> Since v2:
> - define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
>   for x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
>  xen/drivers/Kconfig           |  4 +++
>  xen/drivers/passthrough/pci.c |  6 ++++
>  xen/drivers/vpci/vpci.c       | 57 ++++++++++++++++++++++++++++++-----
>  xen/include/xen/vpci.h        | 16 ++++++++++
>  4 files changed, 75 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index db94393f47a6..780490cf8e39 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	depends on HAS_VPCI
> +
>  endmenu
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index a9d31293ac09..529a4f50aa80 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -873,6 +873,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( ret )
>          goto out;
>  
> +    ret = vpci_deassign_device(d, pdev);
> +    if ( ret )
> +        goto out;
> +
>      if ( pdev->domain == hardware_domain  )
>          pdev->quarantine = false;
>  
> @@ -1445,6 +1449,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>      }
>  
> +    rc = vpci_assign_device(d, pdev);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",

Don't you need to call vpci_deassign_device() higher up in this
function for the prior owner of the device?

> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    /* It only makes sense to assign for hwdom or guest domain. */
> +    if ( is_system_domain(d) || !has_vpci(d) )
> +        return 0;
> +
> +    vpci_remove_device_handlers(pdev);

This removes handlers in d, not in the prior owner domain. Is this
really intended? And if it really is meant to remove the new domain's
handlers (of which there ought to be none) - why is this necessary?

Jan


