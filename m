Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C97518739
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 16:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319709.540050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltqp-000609-1u; Tue, 03 May 2022 14:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319709.540050; Tue, 03 May 2022 14:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltqo-0005x8-V1; Tue, 03 May 2022 14:50:06 +0000
Received: by outflank-mailman (input) for mailman id 319709;
 Tue, 03 May 2022 14:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nltqn-0005pg-DS
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 14:50:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f33b934-caf0-11ec-a406-831a346695d4;
 Tue, 03 May 2022 16:50:03 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 10:49:59 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3650.namprd03.prod.outlook.com (2603:10b6:406:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 14:49:55 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 14:49:55 +0000
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
X-Inumbo-ID: 4f33b934-caf0-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651589402;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MdRjRfP0KbSVC/+93yyY/E205B7eXRM3nAOufUtELEw=;
  b=Cqh4EyD/lC8+98euMDRlNk9pCzcRwCoUdeFx3CYJXUfsOOhzE/YUWyC1
   2mig2miw6glyuIjDFViMvbhp+1Z6qKMLU0PEEEl8woCBvYIFrGwAhQgCP
   RklqVLXua/oA/SfbYyAayrvfnZWYzbDt52npAzTGiKGwguElU/aPEg/6I
   g=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 70351257
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:98tbEK1t8bQcoF7HS/bD5alwkn2cJEfYwER7XKvMYLTBsI5bpzUFy
 TAbDzjQO/zcYGT3fNolb4Wwo01U6J/Uz4RnTAVspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Ald+LdT8TEJfut+YfAgNGN30uZPV/reqvzXiX6aR/zmXgWl61mbBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82eBfyVvre03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianKGAB8g/KzUYxy1aUkypq8Yb9CdnQINuvb9dIw3S6p
 m2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM/JPF8Uq5QfLzbDbizt1HUABRz9FLdYg5Mk/QGVw0
 kfTxoyyQztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjTxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:aw4CGa/Bdl2z9KOHfIJuk+FEdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 yhz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlCl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFc1ccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiU7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri6knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdo99RrBmc4a+d
 RVfYDhDK48SyLbU5mZhBgk/DWUZAV9Iv/cKXJy+fB80FBt7QJEJgUjtY4id0w7hewAoql/lp
 v525tT5cBzp+8tHNZA7bQ6MLyK4lKke2O9DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.91,195,1647316800"; 
   d="scan'208";a="70351257"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsrNu3/8iybUgRYmC8qnCzz3CCZKax1J+Z8aeP4mDGKp41A4YQ0LEF4nMpai7GnkXzzGoNbI6J4SNzORDePH4duWM3AIfIyI+WlP5bbsI6DicXRvuBBYwE0j/GtcltONfVVPcfMB4Il0TsGy+L4uJ/hM8yR5N/aV3kqEgNEJ3mABU98AUpULTuvdKIsuGPhfYFNktkStOnnaYCOqOQbKNT54DvMulgBJl3VTTm11tO8i27jSFuml9J40eKdCb6WMh9lLAVbQprggu6AtkQ6WFQKQCkH3kY4+p4zu4ZY1UwQaMJ/MkzdDS4Lj9EVWkcEIu1C2Zb0EMperpoVAs4zImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyFIvEtYwDFKe2vs2Og2sJf3T0l4JaHHBJ1hwLGjVkE=;
 b=Vq1DFSsRi45F5MoIdhnY2dRFCDfnYv7JnoaKkem6Q+xrH8grrwzlRzSCZiKrqrfDiW1Q8e4OvjOVsASgZhUPbkbLsMMScLspSVOvzzMcWYSkZTazhol0Npdkyhy1pVJCuk1yp81RCtFFFYDVaiZDzCS0+1RtmxpyAE/uQnAgXpEo/L+fiGxAmdQzHA41/0Bp3hktRPET8mPZ2XU3IQnfN3uL7Is2roMwmNdiGTt6i0NxM6eZKhHEYse3PNtLJNDknQGMSAv8GVQ0FgNdcL4gOZ3c/hxMX4/TXQYsNlX773z6Ga2Twyy614avWVJutexsVYpGC0pPpxaMg2Kr7+X68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyFIvEtYwDFKe2vs2Og2sJf3T0l4JaHHBJ1hwLGjVkE=;
 b=vwPk5k+z/ACHg5x2Ap4bRUastYR8KdCMFu7Ubgsh+neQkB6LILF6rkQZ27HbmgP7rWIE6Z42t5ueK22w14IapAHD/DDK+SJg83I31VVM5VnbaMcP/zFEiLQAaxd6Ow4qMFBWN4j3pVqVt/KFN+w1nXCixf2FlPfp8xmaWK+Crf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 16:49:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 06/21] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <YnFBDsEdaMiMv+8O@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e774bd3-622c-4e33-bab6-08da2d142fa0
X-MS-TrafficTypeDiagnostic: BN7PR03MB3650:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB3650FFA2BD72F8AB229D7D538FC09@BN7PR03MB3650.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A54kzlNxp9aNGgcYq6RjUrNcQki4oFF+Ht8NJfGTHgYzJy3gxL1gKUzChIj53n9W4AHTPb3OD54HjhFzKVA6O9Ypd7E+YhxrQI/N8/dkRV8KZ+7vrB70oMDzBIWb/U3AkG4pU4daO7WjH4kvo7Uy+LMM8WgWM6acrdZexsKYQNKeXzjTRkHwsqGtFLjCVbnndkgRx6rDt/OK1MsQaEr+265yH2pLB6DSGO7QVpR1jeqWrHX81pOWznw7DbIY3wTvRKgTW8npkAhV79y9sk6j6j50kBIH9gxHp3l0xcmrAp/gyYWtanG9w6XlcvsZs8IrQOCLcU4aRtrtVPgeBigXRmqupAhi7vPk9Hl8slHbsfWmWvY803gFLSudMPuGu2t6biOJ/9lnmIPxcRIfhpcJCRw8YmdT+zo9mjwk4gzMs8uNti9UEZDHIEZSAkThOHpQTH9pVbXb4OQnoMB+mNQBDAWoKKkB2DA7rTpF74PDLHUWXDty9yQKVdEYxHF6DexS+mPt/gw2XT4avGHDqxYX+nxRZhEKxmMN+9l+O45UtZu7erzeWSuPhXF+PzLTZ6pOYvM6u3Qm+J1AscmhqcxmjdakALPLSgSZoyuFrsKFouVB0xxMl1dH4JAoT6KJeQubeib+4ddiLtb+B3gwbeu1wNzTxfhaB9QatIIbr0+GsWDbbs+uawfMfRT1V+XFZfZyAxNQ6kSdat85aD5rutXP8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(4326008)(6506007)(26005)(6486002)(508600001)(85182001)(186003)(2906002)(83380400001)(6666004)(8676002)(86362001)(6916009)(54906003)(5660300002)(66556008)(33716001)(66476007)(6512007)(9686003)(66946007)(38100700002)(316002)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkRNRksvOWxTem5na2pvbW42WnJWamZIMGdYNXFQZldIZXJwMEhlakdkbFdx?=
 =?utf-8?B?SGV5Tk9jcDdkeDM2RTArUWZpZGs5bnZKTmJCc0M0ODdzaGhwSWpGM2tMcXl4?=
 =?utf-8?B?VWtrYm5ESmNrZ01Hek83QUdQaFArVTZqYkpGWWpmMlRqQXR6UHk1aEsvMStz?=
 =?utf-8?B?T3dlTWc2SHVRWU1kcmRVSmRIbGpGTUpIZHFpSjZ3aitEeW93OWxpbjRwT2I1?=
 =?utf-8?B?UFIxaUoyVThjUS9UbEhYOUYybnNldzBjVU5OdnN2cUtEZUhRQjFsTlduK2hl?=
 =?utf-8?B?amtMZmhQOGNVSUYxczIwTXBGUDhXc1k3Rlp4WFpEYXJTekxGdVZuMFE4SWJZ?=
 =?utf-8?B?OHRsY05uL1lHb1hNemJnWVUxU2l5M21oRzl0ZVA0NFNhd0lvcFJLYU1aaGhK?=
 =?utf-8?B?cEw5VFo3ekRDUFVaaFE2QXhtR1ZpSmRJQlZQSExobGF6NER2RjVhU3gwT09Z?=
 =?utf-8?B?ZnBuajYwWnEzeHZvNGpkQ2YyaFpSTGR5ZXJHZFE0dEdXc2poYWZHMFdCcjdw?=
 =?utf-8?B?dzVxbHlzRExNNS9ZcXd6WGs2TlZiQ0IyaXU1d295MWdhV0hFMEtZOXN1UnRY?=
 =?utf-8?B?bXg4Tk5uVndPbW9DZDlUT3RrQWlnU2hrSWxpUlRLMWxYN1c5L01ZRDdlSnNK?=
 =?utf-8?B?YVVIdXNxeWlEQW9DQVJqUWJpSGJHWVpCU0RFYUg2bDZ5U1NNWU5oRmlxQjRa?=
 =?utf-8?B?WDZQVmh3OUZRY3l5c1dKZVcrQlp3ZTBLclROK2RiZWJnd21NMHp3aWNWd1pS?=
 =?utf-8?B?NkJ4WUwxOU85b0ZTRVF2YjZ1TW13d3laNHRzdFd6THU2WjlGSTE0VnIrdmYv?=
 =?utf-8?B?ZmhBTXUrcS9ha1VXRm1zbEZ1WGsrcnc5eHFmNHhVdWdIYUFFUFQ0d3ZtcW9W?=
 =?utf-8?B?WU9CVW9qdm54V0JzTEFVdFZ3VHZkVnFmMUdGMTZLVUxxVkF3eEYwUENzQzR0?=
 =?utf-8?B?aE5vNHVKclJwWVhvZTRjOXpleTNnTDhPQ0RyWGJSRUJuYjNLWHgrT3JtY2Fv?=
 =?utf-8?B?R1hkOEY1cVkwOTF4VWlpbXBPKzh0cDlCT25pRjVsWWdyd2lGcVF6TTdWQW41?=
 =?utf-8?B?eXVaOFAyRFE5V25ISHNpc3AxUjRuWGp3VThkQUxlc3pqWFpiTzdzOXFKQ0J2?=
 =?utf-8?B?RW5wODE2R0J2YmhsZXUxVnlNMk1yWW5XNHlRR0JTNE40bHdhZnFUN3NsZkIw?=
 =?utf-8?B?ZlpFaG1oVW9iTGNldldqSU03N2FoS2JrbEdZdmNhVzg1TEhpYVBtWWo2dEQ2?=
 =?utf-8?B?S3NjamYxelBuNHhaTjZERUFjOGhUQWM0ZXphVUx5dEk4SDNUTlB0T0FMUDBy?=
 =?utf-8?B?R3VxRllYMmFsSjFBQmR4eGNEeXh4SjFtUGdaSWhJV2FYRitrcmFydGRkK0dp?=
 =?utf-8?B?QmZRQkVoMElRMW9SMERoRHJzNlJLWTlNTzFmM1VaQnNhZ0JWd3JiY1ZPbkI2?=
 =?utf-8?B?b1BIeGdyNHBxSWtpSW5pZURxN1ZkTE5sL3J3Z3BHdE5OR3ZMdk00cXdZYlZC?=
 =?utf-8?B?bFAzZkdiVmdmc3UxTXhqcE44b2pyWHBFVXFwNGZrNW12UEVLZ3BqME1wQTAr?=
 =?utf-8?B?L0JMbUJBNldEZjRTVnJ2WDMrRjI1aFRrejFtbWhjM2EySnB3a0VScVREWXlu?=
 =?utf-8?B?V3lWZGN4VDRWYmdGWmcyT2xRSVMwSzE0bktCQ3M5b0NLalVXSGNDRmVBYjlH?=
 =?utf-8?B?K0NHOEpIR093enYzZktBaE5XM3IzeUNMa2t2c3hBTnRpREhxT3FIN2FHdDB0?=
 =?utf-8?B?bVNtMmZWWGo5TFpseU9GTVVYRnpWRzlUM1hJYmFvZExHTCtoMk1GS3dyUTRG?=
 =?utf-8?B?QlozOUJ6NmttN2U4L1U2VE12cUVkcjNUR2R2VGZSeGVMWVlsNkhoeFVWS3po?=
 =?utf-8?B?SmhHVEhvdjJsS3p5bTZXSVM5NTJkR2VqaHZxZVd6WXhwb3lWMEVlM3pYWU9R?=
 =?utf-8?B?N2VMYjZXK3piaTMzcEcvOU10S0N0Mi81NTB4TVBsUUF1V2tSOWFBdDdBaDVK?=
 =?utf-8?B?VzNReGUwNFBkZWJyaVl6clh6Q2xhbzV2bmxsbjhGdkZ1Mi9YMzdiWGxDaW1S?=
 =?utf-8?B?cmt1bWl5UDFGNmM5bC9ET0pzS2VUQXBmWWVnd2JDclBmbjFwN1pCNENYbW8z?=
 =?utf-8?B?dmhOdkhBakdWeitvdTlLUzZyMGJ2ckM0UnIzS0t0SzBKS3hUV3JwYU1aZTR2?=
 =?utf-8?B?ci9FL3dwNFNkSzVmclRDOVN5QjNzZnQ0TVozN3R0dHlUWWZvL1ByRXh1NWtp?=
 =?utf-8?B?TzRDVjgxWHRMcHB5Rk5oMWtJSDFoMEs3T09mUXRyck5PQWtVdU9DL3hkYnlJ?=
 =?utf-8?B?U2lHbEI2dGZocE5yVVZ2K28zL2pJZitpdE9kVHdxU04wR0orQzBKdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e774bd3-622c-4e33-bab6-08da2d142fa0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:49:54.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyfw8QuywZ/4Lssd8lxeqQS4r0oQ3KMyVkNvy5J0Rcq7OlllX7/qzR9e8KhOsS1/c0v3nvFjLbrKiKJJkPFVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3650

On Mon, Apr 25, 2022 at 10:34:59AM +0200, Jan Beulich wrote:
> For large page mappings to be easily usable (i.e. in particular without
> un-shattering of smaller page mappings) and for mapping operations to
> then also be more efficient, pass batches of Dom0 memory to iommu_map().
> In dom0_construct_pv() and its helpers (covering strict mode) this
> additionally requires establishing the type of those pages (albeit with
> zero type references).

I think it's possible I've already asked this.  Would it make sense to
add the IOMMU mappings in alloc_domheap_pages(), maybe by passing a
specific flag?

It would seem to me that doing it that way would also allow the
mappings to get established in blocks for domUs.

And be less error prone in having to match memory allocation with
iommu_memory_setup() calls in order for the pages to be added to the
IOMMU page tables.

> The earlier establishing of PGT_writable_page | PGT_validated requires
> the existing places where this gets done (through get_page_and_type())
> to be updated: For pages which actually have a mapping, the type
> refcount needs to be 1.
> 
> There is actually a related bug that gets fixed here as a side effect:
> Typically the last L1 table would get marked as such only after
> get_page_and_type(..., PGT_writable_page). While this is fine as far as
> refcounting goes, the page did remain mapped in the IOMMU in this case
> (when "iommu=dom0-strict").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Subsequently p2m_add_identity_entry() may want to also gain an order
> parameter, for arch_iommu_hwdom_init() to use. While this only affects
> non-RAM regions, systems typically have 2-16Mb of reserved space
> immediately below 4Gb, which hence could be mapped more efficiently.

Indeed.

> The installing of zero-ref writable types has in fact shown (observed
> while putting together the change) that despite the intention by the
> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
> sufficiently ordinary pages (at the very least initrd and P2M ones as
> well as pages that are part of the initial allocation but not part of
> the initial mapping) still have been starting out as PGT_none, meaning
> that they would have gained IOMMU mappings only the first time these
> pages would get mapped writably. Consequently an open question is
> whether iommu_memory_setup() should set the pages to PGT_writable_page
> independent of need_iommu_pt_sync().

I think I'm confused, doesn't the setting of PGT_writable_page happen
as a result of need_iommu_pt_sync() and having those pages added to
the IOMMU page tables? (so they can be properly tracked and IOMMU
mappings are removed if thte page is also removed)

If the pages are not added here (because dom0 is not running in strict
mode) then setting PGT_writable_page is not required?

> I didn't think I need to address the bug mentioned in the description in
> a separate (prereq) patch, but if others disagree I could certainly
> break out that part (needing to first use iommu_legacy_unmap() then).
> 
> Note that 4k P2M pages don't get (pre-)mapped in setup_pv_physmap():
> They'll end up mapped via the later get_page_and_type().
> 
> As to the way these refs get installed: I've chosen to avoid the more
> expensive {get,put}_page_and_type(), favoring to put in place the
> intended type directly. I guess I could be convinced to avoid this
> bypassing of the actual logic; I merely think it's unnecessarily
> expensive.

In a different piece of code I would have asked to avoid open-coding
the type changes.  But there are already open-coded type changes in
dom0_construct_pv(), so adding those doesn't make the current status
worse.

> Note also that strictly speaking the iommu_iotlb_flush_all() here (as
> well as the pre-existing one in arch_iommu_hwdom_init()) shouldn't be
> needed: Actual hooking up (AMD) or enabling of translation (VT-d)
> occurs only afterwards anyway, so nothing can have made it into TLBs
> just yet.

Hm, indeed. I think the one in arch_iommu_hwdom_init can surely go
away, as we must strictly do the hwdom init before enabling the iommu
itself.

The one in dom0 build I'm less convinced, just to be on the safe side
if we ever change the order of IOMMU init and memory setup.  I would
expect flushing an empty TLB to not be very expensive?

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -347,8 +347,8 @@ static unsigned int __hwdom_init hwdom_i
>  
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>  {
> -    unsigned long i, top, max_pfn;
> -    unsigned int flush_flags = 0;
> +    unsigned long i, top, max_pfn, start, count;
> +    unsigned int flush_flags = 0, start_perms = 0;
>  
>      BUG_ON(!is_hardware_domain(d));
>  
> @@ -379,9 +379,9 @@ void __hwdom_init arch_iommu_hwdom_init(
>       * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
>       * setting up potentially conflicting mappings here.
>       */
> -    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> +    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>  
> -    for ( ; i < top; i++ )
> +    for ( i = start, count = 0; i < top; )
>      {
>          unsigned long pfn = pdx_to_pfn(i);
>          unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> @@ -390,20 +390,41 @@ void __hwdom_init arch_iommu_hwdom_init(
>          if ( !perms )
>              rc = 0;
>          else if ( paging_mode_translate(d) )
> +        {
>              rc = p2m_add_identity_entry(d, pfn,
>                                          perms & IOMMUF_writable ? p2m_access_rw
>                                                                  : p2m_access_r,
>                                          0);
> +            if ( rc )
> +                printk(XENLOG_WARNING
> +                       "%pd: identity mapping of %lx failed: %d\n",
> +                       d, pfn, rc);
> +        }
> +        else if ( pfn != start + count || perms != start_perms )
> +        {
> +        commit:
> +            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
> +                           &flush_flags);
> +            if ( rc )
> +                printk(XENLOG_WARNING
> +                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
> +                       d, pfn, pfn + count, rc);
> +            SWAP(start, pfn);
> +            start_perms = perms;
> +            count = 1;
> +        }
>          else
> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> -                           perms, &flush_flags);
> +        {
> +            ++count;
> +            rc = 0;

Seeing as we want to process this in blocks now, I wonder whether it
would make sense to take a different approach, and use a rangeset to
track which regions need to be mapped.  What gets added would be based
on the host e820 plus the options
iommu_hwdom_{strict,inclusive,reserved}.  We would then punch holes
based on the logic in hwdom_iommu_map() and finally we could iterate
over the regions afterwards using rangeset_consume_ranges().

Not that you strictly need to do it here, just think the end result
would be clearer.

Thanks, Roger.

