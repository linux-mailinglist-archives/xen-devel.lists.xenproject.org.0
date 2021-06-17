Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB43AB27B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 13:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143847.264944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltq8R-00065C-BS; Thu, 17 Jun 2021 11:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143847.264944; Thu, 17 Jun 2021 11:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltq8R-00063H-7z; Thu, 17 Jun 2021 11:24:35 +0000
Received: by outflank-mailman (input) for mailman id 143847;
 Thu, 17 Jun 2021 11:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zva=LL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltq8Q-00063B-I3
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 11:24:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 540976f7-2254-4020-8b1e-ca050c4969e7;
 Thu, 17 Jun 2021 11:24:33 +0000 (UTC)
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
X-Inumbo-ID: 540976f7-2254-4020-8b1e-ca050c4969e7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623929073;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FRTYgjr+wUmeNbU8WdEE6KfYISOKARM/JijwunUPSfs=;
  b=KwJ3wbVF6r0T3Hyd5tHz1QROHJ6VqX117jxp3g6dysMSFex/PuzSikn/
   rYq8p7H01kP2h2kr1mfynB3RWw/1t2zVojixmCljhYSoRdGfkY4sGTXSg
   62f0Yc6IB5J2ToM+KYsQsNvBqr7yTyPfl1UPx0bvcqtqzZ64AOgHpC/Dy
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rTw3W+Yrn9YB/J/ba8zCeW56gmYfNOwrEPKKVAhQVH6WFi0REFRwM1IPWl9a/LJG1PwED1E2Ph
 Dnk2u4Q5XIjCKbbVbNCxpHQ0vrL6pAgd41bLGWYwPOVg6ggs0ynuCH4ys/x8tBa9mZqtqUHr+q
 vHtQJ4N+QHCbY4CV80mNAVN5T4gRtpVfcz0iYp85Lk/g7wqedNiNdQkFgB4xbzB9ZTAiG4CiTj
 KoF0U33reukO8ElFc7IjnvFxcr/8FlNPuuGCgzPe3PWIaYx53lZ+eWE+r914xrI+92Gd1r2i1F
 YsI=
X-SBRS: 5.1
X-MesageID: 46082215
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ui3X56hm8ve2WqPiF0VEx59YsHBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-IronPort-AV: E=Sophos;i="5.83,280,1616472000"; 
   d="scan'208";a="46082215"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCXb3CZhIzUy7B2pPrUhdLmj8pc2LGo/627FsH0+ZSMaA9Jvpbx2GYIwscve49H6fogmzCaSt7TxEiKGWRVphlqnOF1TP4MEhYPu2BI7h7R2tAHm0M+7SI4PMBRSq+MBX8b0bgSPA5cN/OEwdEsIh+XhRldLfF5qhFrc9U25FVftI2qcByLeVI4pytlzMCmwnLN5Am8hOAD7rsDJ6PuVRLlzZYpcqTGn4hN5fRffYfLlbZ01VBvM5IUIvfwJeV1HeyTgYuqvTkHWswWIZ8ZS/ePOQxsh81gMQxXvmcqFkwIv4LWEs/sLQXfpMTEttYKMQORfrvwe3Cr4oMgHPM3amQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRTYgjr+wUmeNbU8WdEE6KfYISOKARM/JijwunUPSfs=;
 b=LFxxNmqGKdQNcUUono46lgtMhsA/UBUWNJYTO8TpPrtm35IlXQeH9Xenue8c8aaAclsLDucETkw8TA6O/O2mZRImWMkdzEsY7r0vnqrqW+YsSkXqlQQ9MvfJ8FM2kIx6NLE9Wr9CYoCGyMlS7AdywsYbbCl8XZ+C38ArpaAWgWrLPI+fRFM8imJGx3MKKHr6/0w6n9AhYzYHa43kf3gXoDdXSh/ulObt7smgGoTKqtFaUcuKJ2QzgJIxTR6bI5v6AQjXeo8rB4QutRLK9ueoRns4mgjvuuSTiVfo3ZSEqrq5eQpcrqe3yuzQ+/pvO0RiZDVoIILYxyOQJfV5sD6Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRTYgjr+wUmeNbU8WdEE6KfYISOKARM/JijwunUPSfs=;
 b=MTqqIr8rX4bM6iddfF2K9kZFu2HllSuNa5YRhbBSl3w9aG6H6gM+LuyTX1tLIJ0Bia2H4G5iWkCzdNwc1s3siEKwxXgLDwDutDTHb3C4JswEvvqt3it3qyUtZnMpFCxeHJWb6tjKfqGYn2e3j9h2HK6XpP+xe98t61CeR+iblpI=
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210616125129.26563-1-olaf@aepfle.de>
 <968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
 <20210616173831.5e8214bc.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
Message-ID: <861fbbdf-f3a6-ae1e-9487-b3ca37b30ca8@citrix.com>
Date: Thu, 17 Jun 2021 12:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210616173831.5e8214bc.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc6cdc73-850c-4d93-304c-08d931827863
X-MS-TrafficTypeDiagnostic: BYAPR03MB4551:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4551DCBAC172BC35B35C9C20BA0E9@BYAPR03MB4551.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3MddswsixwcAipQbV55OhPp2KjnGkSVldftEg1Xv6rsEV7QzVaVtk8iK8sBwaA9DvuOCcdH4+drlHnkj6P3tbjQ3IUMAuuYiAsBVQub2FIw8/WHPhhEX91S37VbMllqqcPVaM2BCCzE2MOYrOBgxboeAVQDxU/IugH7BrI2NgpRKuNMP2QSpWqanIfuWd3IvIHUj0sF34eQUMVv4fMP/GDOD42hdq6BIa57EuQwvnJ4dyYzyIdoKOlCAygm6onHe03/gxbNMFm95Efy4N2knLMKoSUmm85NA2xCLnxeiNmMZ42nAqpy8MbyQBBoC8jJE5VLxYVxwCcVy9AXh1Zbau4I4Uyt39cptfd/BH5R4wEle3wIxDJjXV3PU4W424qf+q+pZELwINvNNIlAqKKEPg6bJp0YhWVJhQsLVQ7Pz/ACcSXh076Enas6Ps42q1bT1MsnszK3HG3mRJXR3DEUs16WommFVPTONJa6M/PvN8UM03diY+mIKUTgf9jdsdC9hJVOr0k3v7dpopod97nF2A6weYHlxAilTPo+Dj9prRL7rBPRlC6TT+r73TTjT8V2V3dDFl9dYnoMCUAqwg54VKENU6BVHw+tuHyOZFudRgXAAk63Ao0Xpmsgh63xr/pIAboOgnsButpfmpejAtVcE6hMmsYwVtYdCG1dQZY+fWv3LgZOeWHNP3Pg1Kl1zirf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(66946007)(66476007)(66556008)(38100700002)(16526019)(31686004)(31696002)(53546011)(16576012)(6486002)(6916009)(86362001)(5660300002)(956004)(2906002)(478600001)(316002)(8936002)(6666004)(4744005)(4326008)(8676002)(186003)(26005)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?YMn18TRgUslGBXdBLX+NqOh9xeiGiuz6mnmdUK3SQkbZxyupiT7BMLj8?=
 =?Windows-1252?Q?4xa4nfOK4D5lo7MQpMv3f0xWvJ6EmJwyTENO4ooLiVflFzV4ka98e2f+?=
 =?Windows-1252?Q?RWATVkYOHWk1DExyQuJivxzG331zxcp0k5RcXmZkZ6pkDcor3GaahXIA?=
 =?Windows-1252?Q?Gszo0Oq5s0mOxEEbagJcnJquH1KlIanzmd+oySuvYBl6VEy6AUW/+qvl?=
 =?Windows-1252?Q?w4r7vB8j+GKNfP/LTfCmXRO5XdsG4zHBq7kpgYfYZVAK8Eigy/HTdRnk?=
 =?Windows-1252?Q?Xupp5FB8KhROA6AElERp+erxw9sbL03Iw5vJiC1OYbHqzmsIAAl1dzsk?=
 =?Windows-1252?Q?Wax363xRWE9+9Pp0keOtlte1Yknu3Rt9K9x4VB9j4qkdp3J9EJcqWRHo?=
 =?Windows-1252?Q?QQeV8QxDrPqP6qc92nhqkHZLvq/9dGifkS9AgQlnRlf5NEEXJ5Y03iak?=
 =?Windows-1252?Q?ttBYV4rG2Z/Tip5y07kwBWn0iUbJsYHfkY/Y+Kqeh6J40VTvmdEcL2QB?=
 =?Windows-1252?Q?XXNWNfDcXIQu7J00h2jaX6dOPjhcYvxNlsS07vh6GsDjmItRYADSsNVn?=
 =?Windows-1252?Q?h5b5mz/u62NEMvSeZeDpFrl3+v2vCvdk9t0l3xlnrqmBbaIW9EIQ7lZ+?=
 =?Windows-1252?Q?Bie1chxhKA8ktZbKIAsfH/q+2yeuzDWnFe/FGVq4eh4aB9eTBeImLVze?=
 =?Windows-1252?Q?ONgGImiFzaVOSx8CZJOqnG/iIEM1kMpNFSWmkotvzQMElEZTp6Tu46HE?=
 =?Windows-1252?Q?0SR45DyFyUzSBJsGr+OCRbR9Ao10XNUpxRAFH0WOIS1+nCE/qH6iCEXT?=
 =?Windows-1252?Q?24ynnqvUH17lEQalBkpMb8tQhgdmc4+l3GMW0Y9mf4P1M47/5Vic01JP?=
 =?Windows-1252?Q?MoIjssB9O4AhliK+Mz0xK2f65h6C7M6VxTJInJCEZgJNjlGqDBizRVdg?=
 =?Windows-1252?Q?wfQ3p+NuZbrP3I05Pm5wS18z/HUlhnlSI4wptag8Y2XAlsiaEd1EuDXA?=
 =?Windows-1252?Q?OSo3PEVwCUOIJenWW8j+/25TPVETQ3SGcTf4+to4Ra+YEx0Kx0PHEWb/?=
 =?Windows-1252?Q?j1VhLqp5FyQLzx5qq2+akW7ldfaZ+bbxj9euaDwOMtSPD6HP6C/aL3HZ?=
 =?Windows-1252?Q?NAwSmhfbC/jt7RT6ViLkizjhw0IAt8zZYkk5s+D1IgA3SED35Mf1HVi0?=
 =?Windows-1252?Q?YYr1fpktlNsELt3Onj/1Ygg2+eqI8rYWiwM4JTvIiy0sOQOCd5wN2q5m?=
 =?Windows-1252?Q?DeDRGKIMAKoOTHGcaJncqaiIBthQZYqtv6TMdRAzl5QZizEkjpG3ao/8?=
 =?Windows-1252?Q?QMccTvf8t1H4WzCoLac9nh2PVZ7xEcMvbk9LzQObhkhplPghlvlAz+e2?=
 =?Windows-1252?Q?uthyfqUv+wDXwcKyDChkniUY3TlQU98t71In2fUzuLibx1RlKgPr1O4m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6cdc73-850c-4d93-304c-08d931827863
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:24:28.6051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFfEnrVcjjjM6JMw22Ipsev+RZrB3G7deupOyXrUqFQR+1DT8foMHUaw4G0IcPIS5+0H1NzNh/JFkCN6vLCc1WnFc9/cd2d8Cfjb8mfs0CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4551
X-OriginatorOrg: citrix.com

On 16/06/2021 16:38, Olaf Hering wrote:
> Am Wed, 16 Jun 2021 15:50:24 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> 32bit toolstack build
> as in i386?
> How is this used in practice?

Every OSSTest run.=A0 Also, arm32 is absolutely a thing (the only reason
ARM can't migrate right now is because there is no logdirty support in
Xen yet).

> I guess such build should be marked as CONFIG_MIGRATE=3Dn in config/x86_3=
2.mk?

Migration (v2) very definitely works for i386 toolstacks. Part of the
testing process during development was migrating a VM between a 32bit
and 64bit dom0's, specifically to check that we'd got rid of all of the
bitness problems in the stream format.

~Andrew


