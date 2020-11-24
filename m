Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF92C2BC6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 16:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36556.68503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khaZN-0005hs-I2; Tue, 24 Nov 2020 15:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36556.68503; Tue, 24 Nov 2020 15:49:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khaZN-0005hT-Ea; Tue, 24 Nov 2020 15:49:29 +0000
Received: by outflank-mailman (input) for mailman id 36556;
 Tue, 24 Nov 2020 15:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khaZL-0005hO-MT
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:49:27 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8f1a77d-49e1-4cfa-84cf-e2686110dc82;
 Tue, 24 Nov 2020 15:49:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khaZL-0005hO-MT
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:49:27 +0000
X-Inumbo-ID: e8f1a77d-49e1-4cfa-84cf-e2686110dc82
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e8f1a77d-49e1-4cfa-84cf-e2686110dc82;
	Tue, 24 Nov 2020 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606232966;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=B0AHOWU5/O2a5HTnH/yfjCvoUWmPbB14HEU14RtM+fo=;
  b=SsHVwm+tNdS/M5WohQ28aI4r6uVMAAX4Jy5FFU8UvWbnwws4+jbpcH5J
   2OOFBLY9iyVb/iuKPqeVuhhG9Hm4Ni+DHOFKfCI+2Sqcaq1+BVOUeon9w
   SeUgcEqowotDKIOUN3dUnT1rB7wVeyg1Z7u5h6Qaen+J5LL/FZuoy/UFb
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vWlt506xwQLDgQhVp4uKkIJpPNOe7Pg6BSMEEonP2tOXy/JtCRYIGz15G8MezFd757eBQciJED
 SkVGUl+EvbZ0Z82UKOimhKc1dQbHizvAzuwpuMUY2Jew+7CxSo1DILBGnuvxENwIoiLThCs9+X
 oo5rRkAVny7ELsXn/fXQ/gcgQUsuTKt3UDE6HG6FSl3DMaKSSNi7kOkBCU/1zx4ptCkgcyy5TC
 nz4Y4oGFYn1fjXTE7peLYwzk57Cf7Vwyc5ipq/QjUoN9ouo0Jg1DEUxYCPd6+UpApmDFxFNCdh
 BGU=
X-SBRS: None
X-MesageID: 32184396
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,366,1599537600"; 
   d="scan'208";a="32184396"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdjCEMN+bhzikaEv5GU6hoVRuM2JmvcUweRUTcjRbe/yb7BplZ4XA5esJI8EvRXcKwT3I1eyNFfhyYTO+KU581/s9RtB43hrJdAF0Wr7PA3hFIVeyrIpwf90sfU/kAWKrW4AeHs/rkyCRjKq2E5MiUpM2Jyk++pjxEaWxLOJplrwjl4UNNebc1nEOt5BbRFOs/aqahjSloWERF4QGdVfERm2+7F6KX/GkmccM6CkRqOV7bODkbSf/cIoUuvFcDrufqvrVTrsIlRXEBpf/Tbk8l+Y32rTY3qZYgKUELJE7sd51pLJQ31Jnnl+eclCaTyH2jBIfa+fwiHPk0uu2dMCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGQbamVpFC7tNhFrt/gNw+e5L2jcDt0svi9b393BfSI=;
 b=oX9fnBr8mEs6aM8Q9Yy9U/S5m2S1pQy+eHeqFb7Ub2Asev9G3lsbYg8ILoWbU1DsNrhuSo9BPTNkFR6x7EQGrw7tfn0QMwp3Htb6yXH/v75StFqQEmhyTDhuOffBJiFk6LoCkTT0fqBBnQp7f/NiBf12OSZd20xBXm5fVx6BPj2FDZCGPLUrtuzDxRRBJv0etAtERuzpRN9Cth6lmZex8olQGhYpoAD0jwm/pF48hRw3ALvbaaAbKXnRMwJaXYxUggsWCTMdFlIBJjYb62QDAVV3fBQWP4xth/lzFY4ye4jA9R8Gl0KNN7aO/6A3dFgvipBwNDU+e7b+bFRikvTjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGQbamVpFC7tNhFrt/gNw+e5L2jcDt0svi9b393BfSI=;
 b=SzsXfFYRB7Vwfk6Xjg0SspbqlbdJcxFvX69TV495qDfOlajFYx9TDidVZigFzDNyb+BgzFF+646ulC2UQnituEYHvVLgGtr5WJs2ZHrlBNPFCi4/XcQ0qhKMO4xwKDYolxm/fciUpIoYqogOidyV5tfvSA39mKbRuqozlyovZTo=
Date: Tue, 24 Nov 2020 16:49:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
References: <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124150842.GN2020@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::11)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70df89e5-87d6-4426-2bb5-08d890908349
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4475B5E14D499F25D9D3773D8FFB0@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlBdprVHtEYOPdP3l2yysMksKl1QoQT371AaMOtJMTvkGw7sRvaG0uV5spC2KwVfdOSMnipcYHivDDIT0b+1dH8kPzttYueZXOZ6Q8i8XzQFU6Yp3PzZGxfS1X2EAz34tFF7n0Pq05J7yHCATlM4dc3qc+4Yz/xO5gtfOergMiOtMQpBKNasdHLdQE4N2E5Y2Z5tZQp9t4/0ymc4VzZ/tk9q7LFdYuoGQwahnqbWCecy8QLnml4q3kkWMtr5ntM+IMQkrquDHra1jHC1JM7rafXydV2jqKp/4U6VUT7/F9uzmO9M5dLizSmIuak0HgWh5/EwCCedDVglwwTpUm6YF6klk2TDQlAEQXRm156cbGlHkiEj6goq2Anm/CGFoYZ/dtG7STqm8fjwDlDtOkZpxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(376002)(396003)(39860400002)(366004)(966005)(6666004)(2906002)(8676002)(66946007)(66556008)(26005)(6486002)(16526019)(4326008)(53546011)(8936002)(6496006)(9686003)(478600001)(956004)(66476007)(4744005)(85182001)(1076003)(186003)(5660300002)(6916009)(33716001)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: O53Nft3Y/hMwR/oL6eOLfTKNRWrcf0Hl34LB3WaHwLJT/evZXyqui5263SmdAhDDI5wGOstNRa1ZFiSoWtxwu9h66Ec0osJrZ6Powczeq9SgS4i927aSEItk8roeGq6vDFkHSEhAkjOx44qs3HRBFweM2WL7ifhGYiOwOog/n7o65DfWwuRjKHh0aJpKqrbnQDb1Ue/hmNCQ4mdkCsnt1ylfSW06dsCWR0o7MCh80E81E8YSyCMQlW3E/azhd3zxaSpThqw5Gh9sjjQ3EsY7pCAPstb5oBrLBcyfEU9vW6PMp4yH96ktplepWEeuHSvjAgZA56oQgQ0MV8fHwg/5lGEPoWc0ka0UiZflYQkDWfj7el2tqLDwrr7CuRSog3HeTrxbjvV9Y6HvIEbxcDBsLD9QnM55J3VjANU0n9ntyAxtDtqGoYkXJTwHr/vNtRehzQ2dVcJwq1qjUSjZvZGBl3x2QVzmXAgfSdxcedVgobbosAcwSmIxBejZnQAUidQVzli9DGsqJrtSl3DYDweIoWyVuliTuZ5XUNq9GQ/666qUjanVWK9feng/sYOpuXXcK1m6w3Yh3gZhaLG7rcn3xn7V1fNINkH7nAF/7OJI/QkL5t0bgfrELUVkfEdb/3KQh2K5Qlx96rv9pUfcoDyZSg+ap6nKaueNRCacAupwYI6Ed7G+CPMBH6zUJpB32IjAqTuLSIZiPHcQtt/Kkcgt076skoHtvSx9b1NpdR0ywGJzFWsvF52bhoI4NI8A50LNWk1ow4zbCkgAuXlSJTyqckVc/3YRs5SaIGX8hV0R2dazApj7+ZPft0FsweDOPdcN0MEgIA//KvXUhdgZu/fch1Y+Rad6r5FHGnnVpEHmHw0adbMxEqCbl1tygdyY0zmLIqoPCvzuqEwaKRz3U5ix9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70df89e5-87d6-4426-2bb5-08d890908349
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 15:49:22.6391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwJmFNBWrShY3w8G8LjjHY9diyv2RXogBz4O3jNFfCSCSp4+fBzXS3fxewLiuSRYxqBPJOWh5YVZ5kQ5lv2mnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

On Tue, Nov 24, 2020 at 04:08:42PM +0100, Manuel Bouyer wrote:
> On Tue, Nov 24, 2020 at 03:52:25PM +0100, Jan Beulich wrote:
> > On 24.11.2020 15:27, Manuel Bouyer wrote:
> > > new log at
> > > http://www-soc.lip6.fr/~bouyer/xen-log7.txt
> > > 
> > > this one ends up in a panic, I hope you'll find what you expect here.
> > 
> > Did you actually, just to have the data point, ever try to disable
> > interrupt remapping ("iommu=no-intremap")? For PVH we can't ask you
> > to turn of the IOMMU as a whole, but aiui interrupt remapping is
> > not a strict prereq. (I'm sure Roger will correct me if I'm wrong.)
> 
> I just tried, it doesn't seem to change anything.

Could you also give a try with ioapic_ack=new on the Xen command line?

Thanks, Roger.

