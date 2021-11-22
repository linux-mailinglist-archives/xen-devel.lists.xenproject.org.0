Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166AF458C3F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228734.395849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6Y7-0001Aq-5F; Mon, 22 Nov 2021 10:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228734.395849; Mon, 22 Nov 2021 10:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6Y7-00018d-2E; Mon, 22 Nov 2021 10:27:47 +0000
Received: by outflank-mailman (input) for mailman id 228734;
 Mon, 22 Nov 2021 10:27:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smF8=QJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mp6Y6-00018X-Bi
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:27:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d37487e7-4b7e-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 11:27:44 +0100 (CET)
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
X-Inumbo-ID: d37487e7-4b7e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637576864;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FDZaJ9EAWt2OgQjeiHNFo+HsDFdoMHgiW7UX9EMOXR4=;
  b=HowklNIxvya0ShE19IWZMppilD0+pLYKczJgy5SbSdD10KKkhgdrQDMd
   VX2W24JWav/5u8CXQXUpDwXyup4VaJ0Ua52vxV5oICAxnf9fWzvo6FxRh
   vDZC+dmP/ffE2mUcWTx7F0WK1I4KR6+qmyszMla9xyzNDNGJ2XBa/Z4cN
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: snnKygqEmvtwD13lLsoaKOWQdRFMFm0mUxIW0+6fzcK8LagEInbEYKvcAAaatNE59G2Ld0C5Xr
 QZR+7mqnKqkzTkSTnj0LmAlvjctdFvo9yLxuWr9CM2TuU4+be9n9BDfevpmW8pmuN/KOqG9iC4
 HKX7mer/+KOk+eCODFTBUdVh9CbncKsfaDYWKfENz6gLhXSDFPHFakCaYVx+AV38NQipcqr3WQ
 q+eQU+ajq+SXugZPHLtqAWqVm/gukKujkCsDKOFhgcA++fziYZYqnWojG7iq6HnMhHF2N6HXoZ
 4VtQ/T6ySedjr3ju2DRdAPUq
X-SBRS: 5.1
X-MesageID: 58366002
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZroW4a6yql5TAjS5BNpbHAxRtMTAchMFZxGqfqrLsTDasY5as4F+v
 jZKCzyBPvzbYTOhe95/O4Xj9R9Q68CHzoVgHgJl/Ck0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NQw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 9xS6byIWAkQN+6VlrVDDzB0GCNDBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWdr2J4WRay2i
 8wxcBl+TRiYYDB1KFoQLoIhnLir22nxSmgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzRBRUXN8eWzzafxXuqivXShiPwWI8UF7qQ++ZjhRuYwWl7IBQQWUHh+aHhokG7UtNbb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxRQuaLJaUqM+I6d7mq8aHZJBEMJZxI9GF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/Bzr9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaFUwYnY1RvHNEghBHFb5I+htDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/O/SI69CqqINIcWCnSUSONg1HswDXN8Iki3yBR8+U3BE
 cnznTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMD17VqKKn+p+I9cNcmY8vr6gw
 0xRk3RwkTLXrXbGNR+LejZkbrbuVox4tnU1IWonOlPA5pTpSd//hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:oTU1b6tC6JRDCnkQnodg09Vo7skCkoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5pau854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.87,254,1631592000"; 
   d="scan'208";a="58366002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2AaT/iAhPgRygMEAMyoR5PsfMWldD+0yBlloUUsD82B63JNZUeftbwU9ey4Bsgmh3sXoClIQApPDcGOsp3pD8GMuMDoLMFsW/xlg9/RIr9OQZjRMY0qhikJ7bekgZidSbeJvr1apbKE+IDPdpWCkKBaMx2yEDpPpMvonwKqBEPRC5mQeMCbGppGvcSfNtj6MPpXBNsF2OcRuK3KDtT5iRZpUKDLBeShR3pTqa42Z70MllhpsKgNiLV7jxSoztVKujgHMZm6RZiM3cDQygcg5JFNZpbcLQw1vhkgSXLlbsuxKA8BBfwGEPeQe41ChbMNFinC8bho+gcnyDpv/krirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/nvepAPp3RFIc7BRcUmfMMFIXAJf2aJx2Hgjj3ljZk=;
 b=h5WOMkY+YlQXphAXT4cthEdWAsCDTDRpX1pwZ/IEZTNgjfiKMbru+XZQL5jJS+EJfCMNGkDyeUxNiGw/5mmvuqKIW11KPBWXRsv7yJm4NFhSCvuDEhlfosWuAtEu5GLC/1oMNthXgnmXkqRKNDUdqagOQ8LahfwhMT99AwCJbt7bCDSsb0BomeQjjfzNykUP9p/qwJbieBYbNkxqiczIA1AE8hRbJTn/YqpV/IAAiyV5O92w4nyz+QjgLwPaL+Kw6tFyEJBbXJ7XUKtgG+uCBb+CSVWdy5PfUVz8qu2euGZsyr6WPoUUfUrshGHYfg19ho66Xlb7OEs8U1JxeObkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/nvepAPp3RFIc7BRcUmfMMFIXAJf2aJx2Hgjj3ljZk=;
 b=Nnb8KHREkedL1KgpLtirF9h0E6hNMC4fJgNHinJ2G+Yq6thbF59dqQxszpXWN+Fs5Depm/B/I54O8DAAkR/Ja+0evdswfsfRk6DIBBScT9ZrL37oj7Ic6mSyAX6ULC5ZHNEslyESPjGNzcVkf108/v+Uo0LzLvv2Jf4pTavROrg=
Date: Mon, 22 Nov 2021 11:27:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Message-ID: <YZtwj0OKrNaZ7s5X@Air-de-Roger>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211122092825.2502306-2-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e58c91c5-2387-4442-ec14-08d9ada2b198
X-MS-TrafficTypeDiagnostic: DM6PR03MB4844:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4844F81B11BB3F6502B741678F9F9@DM6PR03MB4844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbeSTuAvbzLqLavtVHj6Z1hB56zs0oGvO5xK3lCYEdkKpiRe54lLO3SOLBlrpk8Pyb0/x+UmIoGRQYZwQwccHKBl1Ezw/G1r1aQSjZStfYdFiihyeaD8YuwTSEzaIyHGl9B/KkmDb9j0K0vUm2Q36jxXPuxseK/STACOOoC20JnXN2nLU3VmzHzyIh5NfAz4ynWlP4PoVuJgkStWtBu0xkgkDaWzMF170SiopJwltsrEp4g/fjalBG1zICUPgbFN0qVgDohP0+6SaKzC6avQvLPwpFYIT3wbAxrbl6P4bHW8Q8ixbPTjjG3hFhzbXxLYiDpG1kx0GdMZ0+x5Pu5rnA5AJzQX/OWkQDG3BxS8p6uDzs2AI+TuOtr5ygnMbPMJWo4KAEOzcT9RQ0mUREI/Dhy6M09hNpO5Lq+TmyJ8eKqN/y77i+aFP/+7EBGWJNGNz/NXfUuAoq18dDQGoI/xoU5mgWd3oL06i2adMbNXeonQ6Qq71Xsde4V8WSS6VTmjxY93lM81BHK7/bjfdLyOPXTE83JfsLUccUxNtN0SJyHUF3nuvgFZbsSChO55uzJVoUFcx4BrSAFtwSCbtsfPw0W8FHhHs/iI3NTuNZkPnhz3KsFTOOaSIZpcdxX+Lzs7xfwDJ/PlWgJC3lWPaeWDbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(6916009)(956004)(316002)(66476007)(6486002)(86362001)(9686003)(38100700002)(6496006)(186003)(8676002)(508600001)(66946007)(33716001)(5660300002)(66556008)(26005)(8936002)(4326008)(83380400001)(2906002)(85182001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pPSktRcCsyeXlsVWNtV2ZFbzJNVTY3RmxYNVlOSDhMbFBoTkZodWtLRFBV?=
 =?utf-8?B?QUpvY1lid0k0cGZZR3VOd3RVZmhDcVY0d2FQQ2xaWEhOU2pwNStmSkZzbVI0?=
 =?utf-8?B?SlZiT0k3Nkg0cWl6a2lMamNjUnM1Q0x4UlBWL0pTUStPQVJ3UHpsbURnNUpH?=
 =?utf-8?B?SnZ1LzkwUTJuVjMxR2x5bEpQNDFoa3dmTC9va1NGT1NtSEV3K2U2dVhFWEVB?=
 =?utf-8?B?L2Z3UnpvK3oxTFdyM0lQOUJCcENkOUJWWWpvYzhtRlpxOTc1UWliUE9td1d5?=
 =?utf-8?B?a0pOZ1p5K1FPZFZ3OFlVMlQ1UngzMzcrOEhmVnl2T1d5TURSOFViVnlYSEly?=
 =?utf-8?B?a3FtUmViWVVtdWhUcktvZENVU3g4WXVXZllvLzlVYXArOWdRcjdwMUoxbmh0?=
 =?utf-8?B?aGZoUnJnaUZGMUF3V29SMmJPWkwrTTNwMHhVUDRhWURkaWVrWEg4T3NXZ01V?=
 =?utf-8?B?ZXhxZ2pYWHBhZytsakVpS0Z6T1lOUkhydGVxbFRZM1AzQmhoNFM1Y0NYaldH?=
 =?utf-8?B?TitPOTNHMUdBRE9HdVEycUpMS0lBU0Q2YU03SlNqR2IxYzNMYTBGSHUxSW1X?=
 =?utf-8?B?Y2pkMmhzczU4MldEL2Nsb1RBKzJNdDlGRGRLUUIwZXR3T3RpOFVnWlVYTnpN?=
 =?utf-8?B?ZUFvSlNCRXB3c2FqN0dIckU1WXhmaGdTaTBubllPRlpqT211U2ZpZGo1RWd0?=
 =?utf-8?B?S3VKQlNqNStwYWs4Z0o5RXEvSDBCZ2xSS0FhUkJpek8vWC9oUUxvem5Ca3hI?=
 =?utf-8?B?dWJVWmkwSzhmc2hPMG82anBadHQxeEhwREFSUXBxOXU1bDlTRS9Hd2FXeVlZ?=
 =?utf-8?B?cnlqS2ltZ3ZrRHRXNGxnZjZhRVlXMkhUU0xDQUpmVXZ1VVBSSUZYeXk3cTVw?=
 =?utf-8?B?eEVqOU16bDBCSFZZbTAzMWpTYjl5S242L0FCamE5ZWw1czcvU2NteE03ZFpG?=
 =?utf-8?B?TVVJUm44TlhrWW9zcm5sWHdpNXFodU8yd1A3ZG84WWtPRi9aYlo1Z0h3S1di?=
 =?utf-8?B?b25lYXhLWFFnZnFEZlJYZWN0d2RaY2x3TE5ZZ1pBM1RUbkV2RmpPLzZsVU5Q?=
 =?utf-8?B?Q1BRbTd6d2Foemlmam9mNitaYngwdHBuejR0Ri9sTG5RbFRkMEwzaXpjblJW?=
 =?utf-8?B?Z0FHdU4zS1dUbGNkdWxFai9TR3c2SmJlb1JFVzZqUmxZL3JvNXJvdGFMVTNK?=
 =?utf-8?B?YktjbjloaVpTN1E5WW53c3J3Z3pIQnpyZFRqejMzQUMway85Ty9NOVhVT2FC?=
 =?utf-8?B?NklmMXE1QlhXN2xSaDBaUGdNZ25GZWFMcmZyYlBhWFFiZnA2SkczUjdXZ0Mx?=
 =?utf-8?B?aHdYSTVFU0h6T2tKNys3QmpqY1hVeFp0cmhRSHJ2Um9FMjlrNWlMaVhoNVpJ?=
 =?utf-8?B?Q1U0T3RDY2dIWGN4Kys1YndRTFFiWXBoSTlIUDhla0duM20xcStyOXZaa3FC?=
 =?utf-8?B?dmRQcnF2UE45dFNGTG9RbGZIWDBNYVNENE9PSUY2dUZGMVcxendUV3hSUzQz?=
 =?utf-8?B?L2xsSDdDdjJzZDVTMkRub3VpN1N3M3IrR1Y2ZlVKN1QvbnhDK05yVWJCNnZw?=
 =?utf-8?B?MFMzQ1Q4a0MrUVVGaWc3SHRGSEE5YUsrS3g4d3o4anhoektaVFB5UHhTeUN0?=
 =?utf-8?B?MnRjdExOazlQb3Q2dE82WVpqYkJ6all0WjdlcFY4ZUxQQzBVV29SWmZBQ040?=
 =?utf-8?B?UUlUSG1aMFpvaGtCNU1VQ0pydWlVdWcrL2R0Vy9TVEpLaXB4Y1VtUk5XcUlo?=
 =?utf-8?B?dzZXNWFOV0RjeDZHSU9KS3cwWkFTS1R4eFBDeDNCK2wrNER1dklFRGNBakdV?=
 =?utf-8?B?bXNmbjA1SXhyTVRSMVFKQmxqVGNkR0ljMU1VRGdoRzA2dUNPMkI1THcyby9n?=
 =?utf-8?B?cTJ2VUxQQUZlaVBhSnRqVEtBeHZIUUNMd21JdklhZHNqUGtYa2pNN0pIc0tq?=
 =?utf-8?B?VXdZUnRobHRnZ1h1eXZKVENuTVlNSU5vbzYybXpVMW1CeHNyeTNTVzJhM0c4?=
 =?utf-8?B?SE9LSjUwRERDcmlIQUZwQ05tZ3NUeDlsR1FEU25qUU11clVHeUp5RmpaNGJO?=
 =?utf-8?B?MnZwNlVoSlBQd24xMTVhTEExdEx6VS9LTU1JTEV6WnVwSys3L2R2Ky85R2do?=
 =?utf-8?B?aGpTNU5ZK1RseEI5akFlSGtPemZpZStnM3YyenMwZ3A5Y2ZBbHJJSGZIZHlx?=
 =?utf-8?Q?2dxtQ3u8AWLiN7FxWDEtL8Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e58c91c5-2387-4442-ec14-08d9ada2b198
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:27:32.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB8WwNgbQLY4Astgkgw+sd/x7S19pEH/6uhWiKNhRgnBBzqbrGQkO13LkkvL/ohi0hkjGgCGrncp5ujQDU6wIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4844
X-OriginatorOrg: citrix.com

On Mon, Nov 22, 2021 at 11:28:25AM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Use a named range set instead of an anonymous one, but do not print it
> while dumping range sets for a domain.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/drivers/vpci/header.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 40ff79c33f8f..82a3e50d6053 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -206,12 +206,16 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> -    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
> +    struct rangeset *mem;
> +    char str[32];
>      struct pci_dev *tmp, *dev = NULL;
>      const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
>  
> +    snprintf(str, sizeof(str), "%pp", &pdev->sbdf);
> +    mem = rangeset_new(NULL, str, RANGESETF_no_print);

You are still not adding the rangeset to the domain list, as the first
parameter passed here in NULL instead of a domain struct.

Given the current short living of the rangesets I'm not sure it makes
much sense to link them to the domain ATM, but I guess this is kind of
a preparatory change as other patches you have will have the
rangesets permanent as long as the device is assigned to a domain.

Likely the above reasoning (or the appropriate one) should be added to
the commit message.

Thanks, Roger.

