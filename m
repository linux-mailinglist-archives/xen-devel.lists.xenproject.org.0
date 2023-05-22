Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B770C0A4
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537954.837625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q167N-0002rD-03; Mon, 22 May 2023 14:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537954.837625; Mon, 22 May 2023 14:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q167M-0002oC-So; Mon, 22 May 2023 14:02:32 +0000
Received: by outflank-mailman (input) for mailman id 537954;
 Mon, 22 May 2023 14:02:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXMk=BL=citrix.com=prvs=499503587=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q167K-0002o4-Cy
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:02:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47cc2ea7-f8a9-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 16:02:27 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 May 2023 10:02:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6635.namprd03.prod.outlook.com (2603:10b6:303:12a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:02:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 14:02:09 +0000
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
X-Inumbo-ID: 47cc2ea7-f8a9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684764147;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NMkvZl1QB6H1Mk8oacbZNLa9GQY57EkbQ9CLZAexc3M=;
  b=CNTg9+UGIcai9CkrENona8rcQ/qgHUOoXNQLfHM0VKPH5Dqb4E7/jmbS
   UMuL+HY0eemEV1AKRCpJ/W4ass+EujdR2xAN4skHtOQ+hdUmFPoKpiTt+
   9wBQAnZueC3QKS/L0VO/Vlld72eQH1Gv2VgYzsjHXRAegVtp6dqdVWUWW
   0=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 108690935
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Rr2WtarQULXBPhn+XmjYCKm7V01eBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBnUPfiNZ2f8KYwiYYm08k1XupOGnNFhSlY5+HtmEi8S9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzSNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADwnZE3Z19O6+qyARqort5Q7HcnJLYxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrq400QXCnTF75Bs+ZHK9/+WQ0W+HW5FxD
 3Ampggr/KIR3Rn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yxjJHtBqFffsisWvQG+gh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7CJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:zZFGZKlTAtUQRKPKE7OWjSBLOkLpDfK03DAbv31ZSRFFG/Fwz/
 re+cjzpiWE7Ar5OUtQ6exoV5PgfZqxz/RICMwqTNWftWrdyRiVxeNZjbcKqgeIc0bDH6xmpM
 RdmsNFZOEYeGIVsS+M2maF+rgbreVvu5rY4ts2h00dKz2CRZsQljuQUGugYzVLrCoqP+tDKH
 Ldi/A32gZJNxksH7iG7jduZZmzmzV4+aiWGyIuFlo77AGVgXey5KTnFgXw5GZgbxpfhaon+X
 LI1xP0/b+itfbT8G6j61Pu
X-Talos-CUID: =?us-ascii?q?9a23=3AD0zuaWqxCAjKS+4rTfhp/ZjmUcwPeCCHnEbcGVG?=
 =?us-ascii?q?DBSUuee2NeF+y6awxxg=3D=3D?=
X-Talos-MUID: 9a23:a7E8RAibt8Zm45O04udVSMMpBe5uvbiHU2E0kdYon/W2aQ51aj2+pWHi
X-IronPort-AV: E=Sophos;i="6.00,184,1681185600"; 
   d="scan'208";a="108690935"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwiqFEZlweyk4wTZloS39R8PnptRKPdxmVgrlcu1WCDNwQY8tB8fz8lDfFUPghtTerYU1JfEEJ3k2ucmkKdKErlCkWhOOfSl5pfrBX6gl7uvRxaHKJlHKKW5uvCbipS3ourn5NQYuj7cS6Bfyf0V2UMvH6DSakonSZYajMyJKDPcih0vm3anFCIss2KKLAxOYvrKHVnYG760d1NGYegh3n2OpK892Kyzqo0Byx+ylaIP3suH8BmKkz0WylV5XIWpqSPyH4ZF039X2NeNIYcZNy0Gdzf18HH4tfPhCqU9Sj6vRXYBpJlaWV8DDBCBk8t/dAbLNWKnPE597pOyLsJbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMkvZl1QB6H1Mk8oacbZNLa9GQY57EkbQ9CLZAexc3M=;
 b=Omr0IMetnoDlz068Nt66eOocEjBDKYHv0eQwL7rHCMFpQcHdF9eTZOQ4Tdo9uO6nAR5iGPXG8838s7QjIFvHT5DXhiFGxUn5dGraYT51xjUlMMpNGlDITJUoztsnfTSi/5tPHZavESW2eIvRHFGnoM3ozkLZJR3ywzzuoWOXpxpSDQlLrnJL4Zn2eX33FR0EkztC7aabCuEhjNd3mGWlXQYlYzL48IKyyO7p0YMuihyVnPr8PCl8RrCDkMRKNiCJkB933jxd6U+n/2fyR8mbxb4om1nnQBxm1XgAssG/+BwZKUJNSIlrxvdPHINeYEJCHUjJ48WWI4BK+uyJh7yWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMkvZl1QB6H1Mk8oacbZNLa9GQY57EkbQ9CLZAexc3M=;
 b=KmXzgDf4ntfUu/80u3xTLOkDQl7yOG0W0/S/2FNPMDktse9L1YAAOewdgXf3dACB9ZRik7O6obz45BIlqOeRzYAuUEwzgTNGnDeC1Wy7fTEl0fcBvZ3aLyr3cRRtR6kcMsuq1aTH4KH9wcQNMwyUG70I15Eg946aCg7dYbJvMqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b7822620-d2cf-0486-7e43-acb7adae73e0@citrix.com>
Date: Mon, 22 May 2023 15:02:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
 <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
 <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
 <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
 <22a6bd70-887e-da72-ccff-16b3627463c3@suse.com>
 <54b35fa0-160e-3035-6c22-65a791ed2f84@citrix.com>
 <a53a77e3-6dcd-2668-0f3c-282de93d8b04@suse.com>
 <897bac23-b17d-ec4b-613b-d4d1b4c77d58@citrix.com>
 <9bc8f75b-e46f-48fc-3083-aac30995ec29@suse.com>
In-Reply-To: <9bc8f75b-e46f-48fc-3083-aac30995ec29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0162.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a3d184-3a8e-4cee-e9a4-08db5acd220a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J8zJ2EUYY9N/X2bApqMbD5DYMKlY1bmfYZ4Ljqy05ccqa/dTVav+w4Y0/MD99kdpgJNM9/T/qhuwO74mD4Ls+2OOBpZYeOkngVDpm+BMaOQgGzV/QhU84O2Hn4W2X4W5VOGcpi/srzMFKJsoDCOkK0k8/Tp/XFiXnyZwjaIEWxmEjKGWVuHqsau9LnNVvldWWGpIKonjCYZh+mUToK01S9Y/Bcdw9b4GrE99pKbuPPfBhDMvoEHQhZ1nbzF8lWFMazl/QGNziSj0yEnP1HORbhbThe3eLiFlwdDoPPcOOodWZDJr4pPF0IcH6ThKlC8VJyQ4teor2VGRGXfjmW7EJ1Qnmg8kmn/oV9n7jyas2LY4xARhD+PbB/bbDSZl3F11g/c8qYo2azqLoq09x2Zj8iMSwUYfLSAkQMKPvsMkebu7GCXJBR5FSl+hQyHjWbkOEd4NQeM4g50EC3NcHdTYd01rIsucrJioXDU/8ODyCGt87ygjH+d8/TWQwJEDbDgEqkgTw2KRz4tHdOwFCn1V+p1Up33nvDsLNYAYeX2tpklMTEA6J/7Sa9v4TxZcmHr6Pco3LjWLM/+mYDudS7ciJYMaLCttASNercuy+rQkKNOi42d6EWsxZ/2RMGfkI8aAlZ9Vvt0lH1hZDkM1QiccQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(316002)(31686004)(54906003)(4326008)(66476007)(66556008)(6916009)(82960400001)(66946007)(41300700001)(6486002)(6666004)(38100700002)(478600001)(31696002)(86362001)(8936002)(8676002)(5660300002)(186003)(6506007)(6512007)(26005)(36756003)(83380400001)(53546011)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHZzQWFpcm8wMy9GQm1nN2NZMlZvTU9kQmt0YkNva0g3TW5nb3ZPVG1vVVV1?=
 =?utf-8?B?YlZHdk1vUXF2T2ZKbUpPb0lkcEJhU1NpSlBMSXV4OTc1Ym02dmVTWVpQQzZU?=
 =?utf-8?B?MmxNdDU3bXFKQ3NGZHhuVlpWSm9sR0theHZZeFM4MHFRd2ZteklQdHRvTmZI?=
 =?utf-8?B?WENQdWJ2ZVM3ZTV2UmFSdVVxSEJ1b1RxMTFvYU11ODBReGVLNDlLM1c1aXZl?=
 =?utf-8?B?M0huNkFlU1RDZ1BIR3lkVC85UThhTTZMTWMyY2pWQlV3bkFSR25xVUdEcXQz?=
 =?utf-8?B?MFlycE9SZTVSUWxpa0hvTHU2dFRwTXZyalBUV2wvNzBvM0o3am1CbWlKY0tG?=
 =?utf-8?B?OEFVWXpPNEVRUmZHVnVYTjRDbitNajV3a0xiV2o2L0h6RUcvT2ZYL3lMVGF4?=
 =?utf-8?B?ZFc1dmp4dVdXUFRCNHFkYzRsZEtRVXhSdjIwR0VIbkxmVDEvWFFwRlFwbDBF?=
 =?utf-8?B?UXVEQTRDWGJDc2hhSWxDbGlpRG15OUE5RTE3TnlSR0RlR2xyby9rdHltQ1o5?=
 =?utf-8?B?eWdjN0JPeG5HdndIVTJ6Q1JjTmEyUThQcXZ1SkZRRERkbi94cEZzbHJqVEFm?=
 =?utf-8?B?MkVYeENseDd0WkU1eUhON2IxSjdMZ1cxRlNBSzNhUm1TZXhCamp2ZHo5cUxF?=
 =?utf-8?B?ZFpobHdtSHdURCtLbC9qYmNHUVJuRmYvY0t2cHhIYjBuanhlb1FPWWZLTncy?=
 =?utf-8?B?Umc4NWxuRVZWWE1Odi92YlNjTmRWbG9Wb1IyYnJqallqZTllUDZNUjlING1Z?=
 =?utf-8?B?MHMwa0M2aFhTWDRSR21zMTJ0U0RScmZ3dEdySVlBSDN1UHNjdkd1NW0xVjhC?=
 =?utf-8?B?dzdoaXBPd3NIWDJnS21HMU5JaS83SXZ2VWJ0bzdjdHd1S2FxR3RjYlpUeThx?=
 =?utf-8?B?YldQTldGakJXZ1FUL0F0Wm9hWTBCdE8zclBvQ2dYbUt5aFo3S2g4RXM4Tlpp?=
 =?utf-8?B?eG5xcE1rK0Q5M3c4NEN0dFRKc0JYMnc5VXJOSnVCTXpUZHhacG91cEZkL1hR?=
 =?utf-8?B?NUQxRERnM2dhZlk3TGFjbXc1M2ErelNWbk9wK0ZEMWE4eVoyWHlLTXB6NVZK?=
 =?utf-8?B?M0lucHVrMWkxem1OalE5V0czZmw2eXJNd0loR25WV3BpUmh0ZVltUmVmTi84?=
 =?utf-8?B?OFVMRkJOd0tJalhuWVUyQkNJSWVKL0RSdWZkMSszSWREM2IzUWFja2N2ZUxw?=
 =?utf-8?B?c245SlFvM2d5bnhIb05JajhzUDJ5N2ZLS2hnYkVDcWJDWTdHUzJtbHlLUGl5?=
 =?utf-8?B?NVpMSEo5VUlDUkdrSmRXblNhKzhmdlBkSW1FRDRyRWxVK3F1TmFrekdDeFpO?=
 =?utf-8?B?VDZEbUxIMFlkYWFSbkJ3OU1Vd2hsVUFvMHhENHpoczFKZ24vQ0N4VmM2YXVJ?=
 =?utf-8?B?UktyTGpkSzJncXJRK1c2Zi9ncmZvWm9YT3QvOEl0ZWUrdHRUZkNtNnNOTmY3?=
 =?utf-8?B?TUFGWmN0R0NXQis2b1o5QUpWOFRTTzlHaExNakVQSldaemtoTWNLM2p2NXZh?=
 =?utf-8?B?ZitHUnNaODhjc1JkMW5xc2NqL0hjcHFPNWVUZjFjR0Q1dEVWUitGQVpsSWNh?=
 =?utf-8?B?Z0dFZ1NjdTdPNFB6b0FwM2Y1WFVyTmw2VkhCSFljSnlTbEJBRTBMSkRYUmhk?=
 =?utf-8?B?cUxGR3QyTFp4SEhYNFA3N3V2eUVPSVdsTVljYno3T2dhK0FYT2dtQXRrei9s?=
 =?utf-8?B?SEJGRE5oTGpxbkZtM1hjZG40cGR0emNuMWRMTUpPa0lOdWh4L2JVWmVWWG1t?=
 =?utf-8?B?Z0U0eDFHOTQ0VHp4UVpZcVQwNW9JbGp2OUFrTVc3Ukh4d1BaNmVYY3M5VTlP?=
 =?utf-8?B?c2hXRkNIcCtUYU1ZbVRkbzh6enZ3V2Z2dUV4WWdEbXlkTlpiL2xsV1VxT0ZP?=
 =?utf-8?B?NnRHUytoc0hXc00vNjVQRFhxcTF4TWJwRXlvV0RtNzlicDFRMHB4SndKS2pS?=
 =?utf-8?B?bVhJczlmSnJrWEV6VUhIOTkzajhJU2RqdkljTW8xa2R4R3ZEOFloSFAvc3Vy?=
 =?utf-8?B?SU1lZU0xcW5EL2xZaVBHd3RiRVBTY1NmVVp6NmJReWRsYlRhalphNXdMRjB3?=
 =?utf-8?B?SGU3OFBhSlREMW14N1hGUHJKYXJ0dlB4VTgwRHJPQTFjdG9SUmpXSlkxa015?=
 =?utf-8?B?TU1iVW1uaVE2RTRBTzZ6c2EwU1Yxdi9NU0tDZUoxVmN2WFBYbFVxOVFmTWc0?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rQfncl0iJ2zEYgCLWYYcWxFFpT8pDh6X+Yt5nu7SPuH7rWm5qCDtrpfY993SazKswxMybpJa7BZJodoXXrNTbKZLl9zOPfZDzyC8tkMBFkiW6MTMvwg7UWpJ+RCwCocXN3uFIrRSqJQDVprbYa1YCvIZ8tvB2Y8dxzrC55kslSbBcF3tVquDfKnf8rupUufSXEOr0+z63RWS7Q+O9+p/pH9A+oufVVqWoQXZmmmpr76NMCdSs5+w0QZdKMgng2sQOJ4H1mB3RHBc2AhXx7Dsuuzdyd1fC5/A2NXyRh6TdUa1WPLP2/6VZoqWn9OYToRga2sjgnX0A/r7MenKc2D86E20HzCWV80+58S4UaD+CcOgZ4CSAa00Htgn9S8pNkqoplfx9LkhVQu9Gg/PEsDo/L63iBPz3D37TbzJF20it/6Tz4zdABPIRTZRALQyGGWoehd4sQC9I8b4eaj8iUQsWT+EE3NxrvKN+ZAhmlRVDv2DVwEDvxAWSQDSOxNtU4/CI9pR/oSAJO7jlIX6anQcaI3lAgHQzSor7mTLWnJ4Ymr0OB/UaLZYcktMGLQaT2oKRFwB987+IwsbY0t75Knwg3jjlm5RRxHjhONs2Cera3f36wu53AWu4oOFcSkg5Khp4VV+vqOEbIkfV0wTxJG+JDwGxIZfZUp1UbZwOdWu6ECY2r0Zsp1YuKss4fjRxZNd/pWNDqaroUCKjDCWRzioT9x+iaZjzPlUQF2E3zQwaugB/8A4c4N4SLx1A9xPn0mK02Q5xu/R4G/P49TZJC/jZPfcF7wkUm9lMQ/SjbPxRKlCB420r6z3uf+74++W81lr
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a3d184-3a8e-4cee-e9a4-08db5acd220a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 14:02:09.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5RAAy0JwuI4f6Por23xArXRL5T50naonxN/inEzhAsH5BIDV+Kzmg5ymGwZSAwVFwDOA6+cRQH0EEZrTpGJRXgLCnc/KuMGbIBPj/aBcOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6635

On 22/05/2023 8:31 am, Jan Beulich wrote:
> On 19.05.2023 17:52, Andrew Cooper wrote:
>> On 17/05/2023 10:20 am, Jan Beulich wrote:
>>> On 16.05.2023 21:31, Andrew Cooper wrote:
>>>> On 16/05/2023 3:53 pm, Jan Beulich wrote:
>>>>> I guess that's no
>>>>> different from other max-only features with dependents, but I wonder
>>>>> whether that's good behavior.
>>>> It's not really something you get a choice over.
>>>>
>>>> Default is always less than max, so however you choose to express these
>>>> concepts, when you're opting-in you're always having to put information
>>>> back in which was previously stripped out.
>>> But my point is towards the amount of data you need to specify manually.
>>> I would find it quite helpful if default-on sub-features became available
>>> automatically once the top-level feature was turned on. I guess so far
>>> we don't have many such cases, but here you add a whole bunch.
>> I'm not suggesting specifying it manually.  That would be a dumb UX move.
>>
>> But you absolutely cannot have "user turns on EIBRS" meaning "turn on
>> ARCH_CAPS too", because a) that requires creating the reverse feature
>> map which is massively larger than the forward feature map, and b) it
>> creates a vulnerability in the guest, and c) it's ambiguous - e.g. what
>> does turning on a sub-mode of AVX-512 mean for sibling sub-modes?
> Feels like a misunderstanding at this point, because what you're describing
> above is not what I was referring to. Instead I was specifically referring
> to "cpuid=...,arch-caps" not having any effect beyond the turning on of the
> MSR itself (with all-zero content). This is even worse with libxl not even
> having a way right now to express something like "arch-caps=..." to enable
> some of the sub-features for guests.

We discussed this on the x86 call.  In summary:

Right now, arch-caps is off-by-default because it doesn't work safely or
nicely.  I'm working on safely first, and nicely will come second.

The end result of my work is going to have arch-caps active by default
and supported.  End users aren't going to in a position of needing to
specify cpuid="...,arch-caps" in their config files.

Fixing libxl's ability to specify the contents is something needing to
be done before we can say arch-caps is fully supported, because right
now it's the only way users of xl/libxl have for levelling a VM for migrate.

> To explicitly answer the AVX512 part of your reply: Turning on a sub-mode
> alone could be useful as well (with the effect of also turning on the
> main feature, and with or without [policy question] also turning on other
> default-on subfeatures of AVX512). But again - that direction of possible
> "implications" isn't what my earlier reply was about. As you say, reverse
> maps would then also be needed, whereas for what I'm suggesting only the
> deep-deps we already have are necessary: We'd grab the main feature's
> dependencies and AND that with the default mask before ORing into the
> domain's policy.

Having discussed this, I agree and specifically have an idea for how to
use it for AVX512.  But it is also going to take a fair amount of
rearranging in libxl/libxc to make work.

I.e., yes, but not immediately right now.

~Andrew

