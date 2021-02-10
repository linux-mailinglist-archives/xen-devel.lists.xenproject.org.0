Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F8316104
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83488.155500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ksa-00088k-0U; Wed, 10 Feb 2021 08:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83488.155500; Wed, 10 Feb 2021 08:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ksZ-00088N-Tc; Wed, 10 Feb 2021 08:29:43 +0000
Received: by outflank-mailman (input) for mailman id 83488;
 Wed, 10 Feb 2021 08:29:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/zh=HM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9ksY-00088I-PX
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 08:29:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e58bb0c2-e654-4c0b-9294-f960bf46bbca;
 Wed, 10 Feb 2021 08:29:41 +0000 (UTC)
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
X-Inumbo-ID: e58bb0c2-e654-4c0b-9294-f960bf46bbca
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612945781;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UMtyzgIZuOXNpNwWmsl0meo2GD642Ak+5j1R92yhDWo=;
  b=F3c744fCpjvAGiB37cAGWhDtqVBvawFa6dg6KRgFQlkA+MS37mtXYmll
   CCFks8j1bOMB2CKLQfP83r3+hlQKPS7rmseQ+c5TYFdFQ9Lgas/gxP0Ge
   uGQJRnXy6Z2Ir5mbCd4zuMPiXJPY0NTaGLQ26QVlPqkCF3Qgjaxo+uYYV
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WuRgUfPxBPSwhfDErkDvHd5CHI6RJLSoQoX020a0dE/7eR8FKW/4SM+/FiErhzHSH5egOfd1DT
 1MstnfEW/IGfTRX89fgctzEymqXcYVfR8IgWfdHri4uRH3tE3iJNXzhaO0LbrFN+MyGSAqXp+I
 cfeDws1ixQteLHqu9dnNQyfxfCh7pJHwLb0+ZlqJ/QV+rwRndZVRyiBw2VqDXtFwneSOGQ4v2H
 /gTa9pRqWK+NVvmOAI3g+n/wmjYdMtrIColsPdd2E06uwY24ajIM9zzlPSqqWepDRQjV1llhkq
 nDI=
X-SBRS: 5.2
X-MesageID: 37128466
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,167,1610427600"; 
   d="scan'208";a="37128466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3zTYRHWSu8ypTsi/rdOU6GmRA5prKYbuwKNAzdg1HbwIsVqJb66giuwg0gM0ZwsMGSTs+a536ya+1XFA8kOsqVsfzI4iVnwnXkfWofslgEnDFgExO7XLRq3x3So+NbKKf+lqPWnZ7yHGVDiA2kO7+ADOIe+EjmrIHda6oh6WV/fJgnzQS+XCXWP8Dzdlw5WsdsVvBBe0ChFdriFzNRCvkSueQOcy4vEuo8fc77iRyFUXdsF8Jzx+zMgxNr9vO0C3iCnOO6V8jbb4+rQQFdAOvigyYNSkJF4QFn6KMPkVWVJT3MSZ6W5wc/QnFOZN1aFtINcXnvSrS4HsmGfp9cgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMGIVTMavWni1yEkj8pJgHZaJwyiQFr6zEaJOla1vTc=;
 b=Da1tbaWGI9tZg5Py1UHeM6+/wFBDXOhD4slfXMAzBmslN9WCktUDqpqg4+hTaVb7yLDCqe014+/k2ejC3lnP6zOp2xl15k4/QXaVnpGwduS7qh844AmiM9s6Bo+BEb/SfLTL1Snq3uCp8pwLUHr6qXo9twOD8jcX7p90XEwjEFG+zwjpsn4NWiiIu5Kl1x1EAqLvZs5e72s0YqqKVc320K5O1tYPph6EaYzuMS88yf3ve80BoFt43IdWOWE6f8wbzWn97CjPFLbn5kVkBUDERVT1GX0IyILINAmWvcQL3aiMp8Um3zp6atiaZr57onlCBfzQgOK1aWdGwTwj+KJL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMGIVTMavWni1yEkj8pJgHZaJwyiQFr6zEaJOla1vTc=;
 b=NjJXEnQNiD+FHOUyx0AWRwCffBcEIWeqiIfQEA7cduE9aIhzIaWA0o1AoiVVUjhCIejeNlUgCsEeIydsUwGujqIyLNCg4WxjwuFhdGanhJ9NpsRqAjXAILuMM00DXsj+Z2O+bcbRlw5oS8blBvEl6zBcINQZY8iMZPgdbGrGUVg=
Date: Wed, 10 Feb 2021 09:29:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
Message-ID: <YCOZbNly7YCSNtHY@Air-de-Roger>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210209152816.15792-2-julien@xen.org>
X-ClientProxiedBy: MRXP264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62e52f71-b6e3-40aa-00aa-08d8cd9e0132
X-MS-TrafficTypeDiagnostic: DM6PR03MB3737:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3737382FCB52868F7C4D7F008F8D9@DM6PR03MB3737.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSvAGQVIg6XhfuA00L29GeOlufke8keVbfaDUqjSZ6iE1Lf0ZskOSb3LksPefwT44tnYyDkZdnQUchSc3PArQuo6H580ApVatIJ9U934bCv3hWfRs4mIvHOjxcaYC1EO1SKR0gidMVNnI2FVpfdeBzulBgipiL6XJ58wlO5IXyYT+kQe9SE/IzuOLBCqc1L9pOsLf0k/ST8zRNyJ8sLdQhHmTmd2yITEvMhVK3wvn5C6eW6G12UaDJx5N+0ov8Yd3Ok7jlxcpLISaFIqeTTyC9bs4+2Qr0+m6DQjOLOUniFjyxr115bLxrFT/UxZXe/+Y3l4zL8/kO62n8G/rmF2D8MTPMjlESS48fOmd5AR4RSg5d2nFhgYke4ukeEgJ+0R9L1KjR6dnwz+h4PQwGJMlLTHoMaIbnsOTDKr2nQl3WP7Rgx9Y6z857cBrVkgPEwMPE8X3V9FvcRw7AkfCrJooGrkjv21pgvE7hXGEBEcKVc3SSyTMovqdkPFsEOo3rcQX+AkPMTZjS41yYS+vZeOfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(6916009)(478600001)(956004)(8936002)(186003)(86362001)(6496006)(5660300002)(33716001)(4326008)(54906003)(8676002)(2906002)(6666004)(9686003)(66946007)(316002)(6486002)(26005)(66476007)(83380400001)(66556008)(85182001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEFLR1dvcy9QYTB3ZG1zY3d3Kyt6cmwvSmIveG9hTS9ybGJDZTBZMHdybDlN?=
 =?utf-8?B?UDNpYVNLSVFRTVBESDZSaEkxS3dPQ3JKR2dmc2FvbC9EWk82eSt4Qitia3FG?=
 =?utf-8?B?blVsMFdNQ2M4SDNPYXBCSGlIa0dIQTdpVXN6OThuWEZ1TFZXcEZaclRlOTlu?=
 =?utf-8?B?VmFOWWNnNUMvNnc1NnUzN0Rodk9qdVpZRlNoaUQ2Z2w5elhnaEhUalNpcXdG?=
 =?utf-8?B?eElqbjIwMVJJU0d2eVk4TlpjeGJBQTRiYXN3OXlsSUtDRGFxalVBL1UzSVgz?=
 =?utf-8?B?YytVODJ3MkxKU0ZScGVWTUFsMnJoZVRrTXFnTUVBMC8wbDhlUDFrUW5XRER5?=
 =?utf-8?B?TjBoMVNxS2JJNStmVTl2U1dKR0FhMWVvc3dSd0RDbnBrQzJkNWVPTXpYcGJF?=
 =?utf-8?B?QjkzNzhTa1dBdjFDeTZ2QzZXQS9YL2szbnVxN1ladXlrZnNFZDUyUVhWeGtH?=
 =?utf-8?B?azJEZlNydWZtd1UwSkZDaG4yWStmRkI0UCtrY0J2WnNrQlZndnRzUUdXd29M?=
 =?utf-8?B?L0VoQm1vN08wTmhES3M4RkRwWDdxQjlCSjhnemZQWGZDTXRYVmJJYWhocDhD?=
 =?utf-8?B?OCs5KzlkRmxHZjBVdnNKZXMxOE5nSndCNTF1SXJORmlseWR6enIyVXl1QWpi?=
 =?utf-8?B?NVdEZzRNdlZzQ1FuamtKdkoyRUZtbnpiS01FbXFlZUFYSnJjN2k1ZmJqUGJV?=
 =?utf-8?B?bzlzc0JWYmJXUkN0TDMvdWtpSXMzbjFTaTZoQWdVV3haUitVbXJyQmZHQlJ3?=
 =?utf-8?B?YnFLV2ZVeE5OQlZ6RGt0c2lqY1RudXpVNkNmNFV1Zmp5U0pnbXpvN2E2REV5?=
 =?utf-8?B?OVcweUpRU0hkNER2cDVLai9Tb2Y1eFFwSktKWkVsZG4zWExoQUhaTnlqTnoy?=
 =?utf-8?B?WXJjekJyZEVVNHdVLzlBL29GakxWbm5SRnFUVkxhalNzcjB4czQ0dXBWOU1J?=
 =?utf-8?B?R1YxNDA0ZFNMM2ttTWRZSThSVzRiL0kra2VJNm9FUS9iZ0plZ2pEbUdZV1Zp?=
 =?utf-8?B?b3hueG5GbHZzYjVmaDhlUWtCUkkzdGt3QTV5RUlqMXFmUDZaM2I5UmNqY0RZ?=
 =?utf-8?B?V1VyQkJTYlMwNHJlVVN5ak5pbHl6amUrT0d3c21EZ3lkRTBCU3hnZHVsUnBj?=
 =?utf-8?B?bGdDQlJWVFZmdHN2S3ovSVB5ZFNsU1NQM1NzT2ZpbkowcnRjWE5ENjhVb0hB?=
 =?utf-8?B?WUlNa3FtNk5wb0x6U1JPYldtaFBTR3NZN3JRZWplZ1dTWSsrYVdQK0F4RnhX?=
 =?utf-8?B?Q2lOVDdyajI5UDgzM2oyNWFINmdYcHA2bjRnQm1jZjBJejhQWFdGK09wemNC?=
 =?utf-8?B?VDNRVHNNTXVBd1BIOXNpSHk1MC9Mb0hVWWVUWE10T1Z2UnNYbE9hNkl1YWJJ?=
 =?utf-8?B?MFhNVVM5OUw0dFhzTU1nV3ljaDVpNUh6M0F1N3VEM2lRQnd5ODF3TEVCem0w?=
 =?utf-8?B?a2VQcXdoWi9DSlp5K0ovclNvNm1iZTVMaC9KcVdkQkVvc2VxRElXc1ZWcVlU?=
 =?utf-8?B?VGJwVzJ2V2NYWi9wMlM2Szh5REJ1L2lkSWVCTklBMmhUSys4RWZvSGJ5WCs1?=
 =?utf-8?B?dDBWa1laaWEvZ2cvOG5CckMvRjRZOTNSUFA5ZzBEQXFNTFdLUldibks1SXZL?=
 =?utf-8?B?YVlXOTB0a1l3cG03NVQ1aC94aHJPeXBHNmg4Q3djeTBiQ09sSUZ4cmZvRkYw?=
 =?utf-8?B?MVRvN2x3eHUrY1ZHSm9QMExyQlMrK0VXTFhJNzFKaVNVZ2VoQTNlYkxkcU5K?=
 =?utf-8?Q?eCQxeG40O2mEH58WQ+/12mGkCy6+T380+cXyYA3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e52f71-b6e3-40aa-00aa-08d8cd9e0132
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 08:29:38.2929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuq05WfodddlXYg30sjZfvCiIhKaQQgW4S2rqU2vZjwd3yOO3Nlm1ipFGcVlUMxuezjZloQww42HJUxZE4oEzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3737
X-OriginatorOrg: citrix.com

On Tue, Feb 09, 2021 at 03:28:12PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, the IOMMU page-tables will be populated early in the domain
> creation if the hardware is able to virtualize the local APIC. However,
> the IOMMU page tables will not be freed during early failure and will
> result to a leak.
> 
> An assigned device should not need to DMA into the vLAPIC page, so we
> can avoid to map the page in the IOMMU page-tables.
> 
> This statement is also true for any special pages (the vLAPIC page is
> one of them). So to take the opportunity to prevent the mapping for all
> of them.

Hm, OK, while I assume it's likely for special pages to not be target
of DMA operations, it's not easy to spot what are special pages.

> Note that:
>     - This is matching the existing behavior with PV guest

You might make HVM guests not sharing page-tables 'match' PV
behavior, but you are making behavior between HVM guests themselves
diverge.


>     - This doesn't change the behavior when the P2M is shared with the
>     IOMMU. IOW, the special pages will still be accessibled by the
>     device.

I have to admit I don't like this part at all. Having diverging device
mappings depending on whether the page tables are shared or not is
bad IMO, as there might be subtle bugs affecting one of the two
modes.

I get the feeling this is just papering over an existing issue instead
of actually fixing it: IOMMU page tables need to be properly freed
during early failure.

> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/include/asm-x86/p2m.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
> index 7d63f5787e62..1802545969b3 100644
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -919,6 +919,10 @@ static inline unsigned int p2m_get_iommu_flags(p2m_type_t p2mt, mfn_t mfn)
>  {
>      unsigned int flags;
>  
> +    /* Don't map special pages in the IOMMU page-tables. */

I think this should explain why special pages don't require IOMMU
mappings, or even just note that special pages cannot be added to the
IOMMU page tables due to failure to free them afterwards and that this
is a bodge for it.

Thanks, Roger.

