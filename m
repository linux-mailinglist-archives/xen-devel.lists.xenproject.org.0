Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0F71065F
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 09:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539320.840081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q25VU-000238-62; Thu, 25 May 2023 07:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539320.840081; Thu, 25 May 2023 07:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q25VU-00020s-33; Thu, 25 May 2023 07:35:32 +0000
Received: by outflank-mailman (input) for mailman id 539320;
 Thu, 25 May 2023 07:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q25VS-00020m-0u
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 07:35:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b74ee2f8-face-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 09:35:28 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 03:35:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5834.namprd03.prod.outlook.com (2603:10b6:806:f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 07:35:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 07:35:07 +0000
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
X-Inumbo-ID: b74ee2f8-face-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685000127;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZT61XllAzQmDrjsQNS1CD2/g6lwbcPG7bOk3Qi1DXG0=;
  b=iXyNIMRMEvHRe5NFY9S94MtZ4cs0PdDFoT1D3H4wyAVz7XszjFaPEdbo
   b/gyKKvnkiQQp4gm0tUyr8TwcEagKlPMJkCVEyACsFyg97v6AgNVxsrFx
   Vzrbl78HohJFajyUDy0m5OIYel3nn2hr/JILCJn2t3CY4WLnrvY36AcB1
   M=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 109093415
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pUqmiq5SBUE02ySHrY6PFgxRtBLGchMFZxGqfqrLsTDasY5as4F+v
 mceUG2FaPiLMTHyc9Bza4229BlXuJ/RzIRrSldsqiswHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R4AeC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 v1HBRoNKSK/psmk/JyeQ9lJ2toFBZy+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXKjCdlOTeDQGvhCvlOw+2cMVwwqVBilrNiQtheGd+58J
 BlBksYphe1onKCxdfHmRAGxqnOAuh8aWvJTHvc85QXLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6k2hxPLC9xlQKi8i4SsHSmqm
 m7a6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHa1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:F3+aXKpXomFuMOrXeoMklmUaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:sB56fW5EfeD0FHbGXdss609LN+olNU/h7VzCH2GdAFZMFKOzYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AILAEhw850QiDMOb+eFs6MVOQf/lmwJmlFx8crZR?=
 =?us-ascii?q?FpcSlHBApAxuhrzviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,190,1681185600"; 
   d="scan'208";a="109093415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG0kSGpzqJfdHQM91nVG+ZjejKvEVAYF9GLlMZU2sselI+eqNnno3tmR4J5d9q0T4M/IrGM/wzrZAclBnQoXyokuSgwyi4VriLGis3wtTdLjp8h+0ASnqR6OhhON545jKIcfNz7nLMnK293bcp4PJ56vfH4cFYJ7BRRrG5rKf8xIi+GyH5PIkuH+/S6SDrbvjLrEGW3qEQQX3Ai1nVFiwy9Cb+XiVPQCn4ZEt4KoCNQk+b8KaN1UAW3fXV3mgEPTYCCealjggAWrH8BIJHhh4ZUvqO65Jj2f3MVB+YbM/qTDMBmjYQeDfi3dSdqsLSMsypNBJx278puTcF7XOb0kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMTB9KDiY/p0p9NLr52mvTizmfg6ZizPVRJTlPx83uo=;
 b=ICSQb0qRWUFMm7dGF8jEfsZz9kpLLMvXbyZXY796qt99m7x2BA6/Q2D2nKUj0w+2hhKcJVsYqJG8IAloHnFKvDfS14bu9ym8mCwmpUvIK7ufMmre+DZrGs3alhFYQypFbnOJo8hrpGvge9tTGFWJyp7MVYxORRHj8aCBSIxHQUHqBi4B/vmXsQ1R/yAKFEjZ7FNMT8Zzmz+chK97+UxWru9NroI8vi1hnfxNRTu11irl6l1+fUFkec/qJ0NXaVDuUh2mEQTa+4o7vKU5uCurrIremg5cfo/s79U0OQAaKd+1wsFSSxMOduFVwnYXFtDIve0a9tIXVkzEFRU5MikW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMTB9KDiY/p0p9NLr52mvTizmfg6ZizPVRJTlPx83uo=;
 b=krW8gnfRdV64VO5YrqkIHg0JdSpgQ73MKGLMrSspC6q0Qnv00nqsuEqgKlcaFQtLdTPCmzvmz1BN/oac0/346QEGJXylazmFGi2f0fl/eY/UAJJNf5MOueIy+Yrh9affBlTcHRJv+umwn+tG1M5vOvhtVZlS9/Ltuhmyv5Viq6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 May 2023 09:35:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZG8PpDlKIy9hiGqg@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
 <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
 <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO2P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 1336e5da-4a28-4f86-8533-08db5cf28fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mlFHWYjNMT3F51W5YaWK0asOG3dJ6cbAykkTtZ24fRdy64wl+w4Ed84UWc94Vw9tYcbjtidz2Ek+n/nXJgB0tMopM0g4g4yE1L9RdA5GOFb1WxRJgu1ucKlx3VoVkM5XstabXrqVOdPOfEkiicjt+cyz2L/1EWUwuzA1RcS0cBpW7CcRbynJDIqnfXA8MwFF9IJU7Vqh4wuP4CyKloeeJ+BC7mVQ9axP+6tvIM6Nhq2czaZzA3JAl5FrznbPsiP3jd0PDrY1PO6hXLLynLtdS+Bscv+iZmsosrnMyHuREWDjy1F/6KVSqkQbBwXwKuchJ1WNntZGPC4V/fM8mSstUBIjdKYiD0r9DGgHmJNH3z7G0vL19BA+CpU9stPHDEDOFqcf+dqGKRJHhLw9pf9K43RG+sCW8Rgco2GEorgsASXCEPtIIXjxCctkUBNUIf2EXDvVgs/P6TLTDHdo5gmds3nf3YYgV8ONdmawkPekXeXkPl7DT35BpYpbCb2gtLcIkFpo708x2Cb3aQOXbxByjJF9p4ynvtwV0uaS3/VTkIWdQ+lg/oY5RS3rSDbQa4uv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(478600001)(6486002)(6666004)(54906003)(26005)(6506007)(9686003)(6512007)(66476007)(186003)(66556008)(66946007)(6916009)(4326008)(5660300002)(82960400001)(85182001)(41300700001)(33716001)(86362001)(38100700002)(2906002)(8676002)(8936002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGppZzNBOFdYckdGeUhLZXA0Y0c4T2tFOXd3a1Rwb21KY0dtUUwrbXgxOENk?=
 =?utf-8?B?THBJd1lCVVN0WGYzNG5IU3FpcTIyV1hBUUdLUVRWM0ZTbmRuaUJHZXpVRDVF?=
 =?utf-8?B?R3NBNS91UksxL1JZSXRYaXBKZnBzNlg5ZmMvRmJKL001Umkyakd5RVVwOUNP?=
 =?utf-8?B?bjZoWjF2TUNYWktRaTBkcW5JeHVZRXZ5L0kwVlpZaXB3Z1dlSzIxVVhoeEM3?=
 =?utf-8?B?RkVMREFERkVKYnVDUUxxYWp5QWtkN3pMNXRrSEZKbkxBVHFtWmpRSjNFVGFj?=
 =?utf-8?B?ZW1vd1lPa1hzbVU2NVM1RGxXTU9aaEtFUkZTNm01N2F2MEwxREY1UUt5eHl6?=
 =?utf-8?B?NFZ4Ylp4Z015MjNpb05uMUswZDhrNFAyYWlWak45SHdMaFBFNlZwdkFtMDVy?=
 =?utf-8?B?aTF0cm9CbzdrUm1oSmxKVWx4WW1wK2VtVUU4dm9mSjJMbExnVTk4WFdUcU9j?=
 =?utf-8?B?ZldrYVhrb2Z1YlhkRGpJYUJ1WFExTjJFSEFkcWtod2d1ODRrMlAwMmM1UGJr?=
 =?utf-8?B?dElKQjRVT2VtWnJaVEVUN2FiaWZMcGhZWVcxZDJLYVZET2htamFsZG9UUUZ6?=
 =?utf-8?B?Y0JvbUtZYlFlQjIzaVlVSUJ3OTRKY3ZrdlFpbm5ldXdRaVIybnNKWVJxMjh1?=
 =?utf-8?B?WTVIUjVmNkJRQ1lJaTg3dVFQdXN2ckF5SlFZbnExMnRVdXorTmFrTUNxTU9s?=
 =?utf-8?B?WmtkdGNqMU1sV0Z4SVJVVXBHYjAvL3BEd28rQk8vV0xNOXRkRUNzOVlVNmM4?=
 =?utf-8?B?R3dLZU10VnlLTDdJYVV4aENkZG13aFpqMm9maU0xV3U1eUpqMkpaRHBsMkx1?=
 =?utf-8?B?TEkwbjVBcFVnR3FKTjkzbGh0K2YxcG1BU1owTXlqZG03TXJuTEUvL2x5MWNB?=
 =?utf-8?B?aHBScVgwZjVkYzZKT2ZKL0lZeG9ySjUxNVE4VUsrUGkxUHREZHFObnpoM2Q5?=
 =?utf-8?B?d2w5M1ZxN3pEeTdDdmxtRllOY3JpdVFvRnBQNEYxZFIreEVoYVd5NmlJM1Q3?=
 =?utf-8?B?VGNSN1BmYmFYaVY2SlJzT0lrbHhrVW1PV1d3dEZHT2tZR1dhMS96SFJsNzBE?=
 =?utf-8?B?U0JCaDRHRjhhRGlKWHdnT1EzUFZnS2V4OERrUUdESG5VOFhNVVdHZEtOQkVo?=
 =?utf-8?B?TGU4OHVjRm1kbm13L1RJbW1oSlBXYnVZTUdYdUNWT0Fyb1Q1aUpiSFMyV01T?=
 =?utf-8?B?VlZpSmpOcGlNR2Uvb0tLY1VBQ2UzOTZxWmxXZU94YkJnZ0I1VDFDMC9DQlgx?=
 =?utf-8?B?NzFwRGIxVm1DOTVYZEgxWWhqcGhPMnNGc095dk5oZUZiYnNILzRVWGtJc1JW?=
 =?utf-8?B?RHhZUmpYaE1xWjZuZ3hEZTZnSjN5RHRWSXVCRThpTWhQYlE5bWN4N2N3Q21Z?=
 =?utf-8?B?TXlldGpCZ2MvN2Z0SkIyeEQrU1FHc1o3em1rdEg0ZzVNT0lpK0lhdU93eUQ0?=
 =?utf-8?B?VTFDRDJ3b3VneTRSckk4Q0xtT1N1VHpPVkhwekxDVWx4aUtxVERFVWJnOWl5?=
 =?utf-8?B?VjhXb0J5Sm5rYUthYVhwbDBDbE9JTHZPMDhmdlhtTFdhRHYrYkRReVhDd3ZD?=
 =?utf-8?B?YjRUN1pkNnk5QzFWNFRteUNRbUJZNEViNWp1aWcrSWRsMnVTc1FIMnVVY1hL?=
 =?utf-8?B?bGhLa2FlN0JCSzJVTUR6SUdVSGM0dVpkbm5majFCTHVmOHg2akhxZHZpWnpv?=
 =?utf-8?B?ZUJmejMycFI5blJxZ1U3TWFraHlHcHNKVkdmU1hXeDhsTS9oUC9DdUxKZlA3?=
 =?utf-8?B?STdObkVoeWZGQTVQVFBUV3djVGZhMUgwVUsrSWJydFRoS1E0TDI4NE1hQU9i?=
 =?utf-8?B?NzNYK3dXNDQyTTN1NjJGNnJwa3MwS1ZWcFgzVlF6dXFlWjhGWDVaZ2EwU1dh?=
 =?utf-8?B?cGVTQit1MUpDOHp4Q2tnWVdSMmdqZXM4NkZkbktLQUFuM29xNzdCWXBSZFg2?=
 =?utf-8?B?bE12a00zM2tIbWUrQnJmRVVhWC9CeGUrYkU3UUkydkkremlhcGluaDNaOVAv?=
 =?utf-8?B?d2pnQk94c0crci9LdU52cmNUbHRQL0tKaDBGcTVDK2prVTk1aC9hd0k4ZUM3?=
 =?utf-8?B?RGlQT055YzhGd3FEYlpjRDZUYWtxSmN4MStrcERrajJBWCsrdzJ3aE9xNGN1?=
 =?utf-8?Q?1uvFYiRNeEapdL8qObzNnWaWO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SRbiDj+VUMm2rQ8MmIhS78Qlh9lHCsEaAO8B9KuNf/6VL4dIErwXs6AizFsGYuKN6LErLRJY06+25RHPGPBPBSEOXScJB5X2Kqr/jH4E5Kff6Ki/x4h2CbvyN5zOEmXcLYiV6X/NDk7IwVG9aAfaIf2JjQGyF5uiGoQ8pkURxe4lp3fWhO9nC/XFOSpC3fk4etPK+ae4ylaTAFZS4EnZ2qbr69LC/kgY0I5lpgOUuzOYhjK1r4l2RBudFNneb4FLGL7+9UMzmWf2xuuK8pmVp/bWOEveHxPiW/ydI9rvzOb7BeT5S6MZvmAGVPMeuJz3YI4Ck0/Z3kO/JBbs1VzA8x/Lu7oV2v2cDCIrX0brVrSYR3zY9EVI9AN49HneafgKs/Yhtw/JNwt378KIGF5uqKuBqx2h+D3ZuLJmr4JV3pxqxOSbU+ECNKIAtNSBLFDSbx/IniXNhVN6KbZ34M+k6Cpal/Tp6VzX33OPfWer7QFEFvgRCQERMld1tp6w5l4IxtDgAefXKRC9dAqmXz21iQX4zu6IXvoV0I+PoBe1qIz2my77rxg7Cc5OBRdBUaef/vjQ9gGmSnHomCaplBvLBMGwQ0xJ1A1IjVL4pQ5+ZJc8eVmWNUifHNE4DSeRCddKldJR+oitat1bX0dqgNPExeaMxbkL/Lcou3SiKYOlSBQJZSGyqHGtaK2Mfp7sGQ9xVJD+vzQ0Q97oO0E1pb9kqfo8PJnnbhWARxOj8WFWT8lWAWrBfIUu5tz72IUuU1CKpIRV1qHkUdYth0o/dthydVR5JT1uLMr/IxUOVkPFYXQJxrFX4vSzb6qTehR1NXn/UWHWBQAAj3fquLK4jjUNEw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1336e5da-4a28-4f86-8533-08db5cf28fe4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 07:35:07.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbdMoReB8qLDUiQAWr2Af0yUFb3Fqk605J7rJlalMuEkhxstpGK+Ksv8LRw/SOl4Boh0kBaFyRqcF0h4snOj7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5834

On Wed, May 24, 2023 at 04:37:42PM -0700, Stefano Stabellini wrote:
> On Wed, 24 May 2023, Jan Beulich wrote:
> > >> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
> > >>      modify_bars() to consistently respect BARs of hidden devices while
> > >>      setting up "normal" ones (i.e. to avoid as much as possible the
> > >>      "continue" path introduced here), setting up of the former may want
> > >>      doing first.
> > > 
> > > But BARs of hidden devices should be mapped into dom0 physmap?
> > 
> > Yes.
> 
> The BARs would be mapped read-only (not read-write), right? Otherwise we
> let dom0 access devices that belong to Xen, which doesn't seem like a
> good idea.

It's my understanding that Xen will mark any regions of the BARs
in-use by the hypervisor as read-only, but the rest will be writable.

> But even if we map the BARs read-only, what is the benefit of mapping
> them to Dom0? If Dom0 loads a driver for it and the driver wants to
> initialize the device, the driver will crash because the MMIO region is
> read-only instead of read-write, right?

I think USB is a good example, Xen uses the debug functionality of
EHCI/XHCI, but by marking the device as hidden it allows dom0 to also
make use of any remaining USB ports.

For r/o devices I don't see much point in mapping the BARs to dom0, as
dom0 is not allowed to size them in the first place, so will be able
to detect the BAR position, but not the BAR size.  I guess this could
cause issues in the future if dom0 starts repositioning BARs, but
let's leave that aside.

> How does this device hiding work for dom0? How does dom0 know not to
> access a device that is present on the PCI bus but is used by Xen?

I think the objective for hidden is to allow dom0 to use the device,
but Xen should protect any MMIO region it doesn't want dom0 to
modify.

> The reason why I was suggesting to hide the device completely in the
> past was that I assumed we had to hide the device (make it "disappear"
> on the PCI bus) otherwise Dom0 would access it. Is there another way to
> mark a PCI devices as "inaccessible" or "disabled"?

I'm not aware of anything else, short of using stuff like the ACPI
STAO and reporting disabled devices there in addition of marking their
config space as r/o.

Thanks, Roger.

