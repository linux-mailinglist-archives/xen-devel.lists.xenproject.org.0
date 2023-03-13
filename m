Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02D6B75AC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 12:15:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509228.784590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbg9J-0008DN-RG; Mon, 13 Mar 2023 11:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509228.784590; Mon, 13 Mar 2023 11:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbg9J-0008AF-OR; Mon, 13 Mar 2023 11:15:29 +0000
Received: by outflank-mailman (input) for mailman id 509228;
 Mon, 13 Mar 2023 11:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EdO=7F=citrix.com=prvs=4292f2e3e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pbg9I-0008A5-Ge
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 11:15:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18b7a8e5-c18f-11ed-b438-930f4c7d94ae;
 Mon, 13 Mar 2023 12:06:32 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 07:15:12 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5069.namprd03.prod.outlook.com (2603:10b6:208:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:15:10 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 11:15:10 +0000
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
X-Inumbo-ID: 18b7a8e5-c18f-11ed-b438-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678706121;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QAqgqIz/Q4OQsnUeo0RoPpwsCNItJFW5wG6Mt4PqacQ=;
  b=XatZvyfd+GO15f0AKvNjCRORBGpfIApHbXQD/9lOsDnRRe58uEtg1ma9
   ntTQdhA+LOUEg7hypxLyGhkjVCa42YciUGncQjEWBrp8NwakiXkqyDvju
   Fz+J8clN7T0uWw92Z5E9rWx8MVpqFWLqtQWRnDJJ5y9DkzgA3VX4bj9Ma
   c=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 100496418
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BmUr/qwZJ4Aaorkk4/l6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUCn
 zceX2nUPfuOM2XxLtFzO9m1pxtU6J6Am4I3QFBtrCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKsT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT5l9
 Oc7LCpSVDDZjr+cnYyVSPR+pf12eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eXwXKlBNtCfFG+3v4prUC9/kgYMwNMUkW8sdmho0K3X90Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoISFUD6ty6+YUr1EuRH5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:h8I526xpXy8PG7EYgAlaKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="100496418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvS7vf+k+9s0H8XAsclXqNuTFx8h1mKyGunPzPP4UNKxIkpvWJAB96WiUwJhnXSaDg6EgVabUJxk8b8E5wfwdJACsSsUsaaNObM5Gx+sA8UD5t/ocw8KdJRGdsqsKhJJwggh98kArYqeOexxF0nO+hqpSPrBAxsiNdbpOOyMzD/sEQlm3fc8iChL2K67dcPF1RGhnyDLkMFAJNN0R3HVkwoDfVHBuNH8OYQYB7ev5v6/lm4cBxVAQXiwx6iQbBYkqRewyukNAkVQLn5kzeQrZnN+UgY7/C4rn2Ns3zHrcCkcEnZjVNagez+pC0zEC/AdPnnAxwNlmqPqeOr2vXO/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRtikbcNYxFdn9wOyJ4nwC8JE2eM3drG6mlMS0sPN/M=;
 b=cLcdnGSUIbm2ho11AtZIGKle7lcG9bvqUdqMFoJbe3bKi77WlPKpWr02rjLbYi+Z/HdvX5p/BUBQSlL1kHHRn24SZHNMjDpxjW3la0jzB0NvpvAkDPZqkCm0LkNDlhubQhJOpVbM8SCTPvhEVUA3rAC3jGzlvvIB5O4n6VOzqox4cE0l7ccdsSqfAY/K+1zEvOzrY5TGByNF6iov2eW0pplmKRUBu3896ONNTdbl8D63yyffFZIlWws4pr8xLMvBpm/idHpx9n17U1IHIZpklKGT88vqDoRsxWaMkIdHqBVp2k2Ndrh1RThY/kQG7Zh6u0j78dY0DYfO/8MaXZaRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRtikbcNYxFdn9wOyJ4nwC8JE2eM3drG6mlMS0sPN/M=;
 b=Y0kxeCSW1D67WKShqORKHfeIei3SSjsh1Mif9/4dBNT2Tx7BW7Rze24FoUJ/UX4QSd9TTUa4gKhKgAnSiEVVrdW6Ab04eQaZG0RBzlg9hOuxEFpmg1Kmln7IPSnjcuaYancqSB6xiYqaoitnTZdfAEXM8UdM5r+g5givFAQYHBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Mar 2023 12:15:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tests/vpci: install test
Message-ID: <ZA8FuNP8A3lPxSMr@Air-de-Roger>
References: <20230309165812.33918-1-roger.pau@citrix.com>
 <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
 <ZAsyxw6VvQHYrksG@Air-de-Roger>
 <29c3e26e-e6b2-1b2f-b442-d468d8abb505@suse.com>
 <ZA77aJM7/6dhu5F1@Air-de-Roger>
 <9833177f-9dbc-4f19-a892-14b63629a91c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9833177f-9dbc-4f19-a892-14b63629a91c@suse.com>
X-ClientProxiedBy: LO2P265CA0472.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::28) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c49cf9-23f8-44e6-e417-08db23b43546
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8A3q6Gj3lOtinjA5nNwWhPUrZqLfBeBWJq/30YH9COHmrOA3km3dR3/Df+FMGXZmWauvfnknrk7ppgUUF3tfaR9am1y6YEjhKqDBcl9irZMwuooy7wb/LOyKrv0BgkbxHC0RmuK4URKZN9tzLw/zQL91348Ie8+t73ADoaCp92PbTXVxKvfJIdRLCHBX/IPFoQ9SM+hmosm4oiO49Ofl+53gJusoMnfo8KJEdtiIrKawoLdExNNdJrIVrHI5kk7VtQRT2fUKUI+I2roiMdie1HRwo85UEGKS/OxZwDi8n2SwtaJEEnQIkQfntxuHpAc5AL49f/SkjQN8U2HN8JLUReUGW/FaVqFQDQbLetrL+wExiHXPvyKUOWTiQ6Hvci89uDakeX4DpRibrB/Tt4mi0yh+T5jUkn1tJbI7pmj+1WA+F/TeTiOGpCg7MNc6kZ5YXDOUhu2rm3qzBWV5PdIntorXZ702XT7fPhDS+kyvZ8uXlx1bLH7lf2ecR8TRd/oDtrtug3GLBN9Ic+7DxSfHGa4A8AYRDPrT7W0076wZNFfLpevhPcQLIx+daIGcgN8Son3IiMOwaUR3zW9PVi5XjIqe7C0/NtA9Z+6NoJi/izulpQpW0cMxMF4tf7rKu/27gdhYJxj7459RsPoI1L/8PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199018)(86362001)(38100700002)(33716001)(85182001)(478600001)(66476007)(8676002)(6916009)(66556008)(4326008)(66946007)(54906003)(316002)(26005)(53546011)(186003)(6666004)(6512007)(6506007)(9686003)(6486002)(2906002)(82960400001)(66899018)(5660300002)(83380400001)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjFEL0EvaW1KUytIMVlrZW5hRmlpRFVETGZ5V2VEVzFDeWlUK05OaW9kM1JZ?=
 =?utf-8?B?eStvZHlmcm5oYUN3WThvMjA0Zzlvc1haTGhuMFBSNTNZYmtxbjZibERCUzUw?=
 =?utf-8?B?QlhuV3l2Sy80U2NnUGZjNWo3c0NxeHNLTnlEWlp2REVKWTlHRUhITjdzdDdV?=
 =?utf-8?B?dWh0SnZ2dnMzMThRYWZSZGwwZUxRSnozcWVMMllXdkttUHM1MDEvS0wyKysr?=
 =?utf-8?B?bmJpdUhSTnM1K0RkeC9rd21WMDFGWlhkNEd6L1dWNGpyWVR1V0tpTEdoZnV4?=
 =?utf-8?B?K0hmLzJObDZwMmFZWU9pUm1wMGJWWlpZK3BveUZVcVRHb29MSDRGaUlTTGxK?=
 =?utf-8?B?RVpiZXU0SkRQL1FnWWtrN3VuL1RNYklENGROTWh1b2ZWU2pML3pDV2tnRTlN?=
 =?utf-8?B?UnlMNTN2WkRuMENWa3JGMVhiTlExOGkxL1RmTTV6dW1zbER4TFNSclpwa2Fl?=
 =?utf-8?B?djE4K21xdGdvOE9ud0RPRVhOcEhoOFB4UEgzSmN2UDQvWjMrVnZpUEhIU3lD?=
 =?utf-8?B?djhPMXdxVWpCcFRQSk9XUllTWlJES0ZMbVd5Vmk2ZU1kc0NkbTdlOWlZQ0tW?=
 =?utf-8?B?Y3VtNHB3STQrZnpmdjI0WHRkd0FYSlpNNnBoQzM0Q2Urc1VFUzIxMXZ2VlNp?=
 =?utf-8?B?ams1d3Q3SDc5Z3kyQ1FUd01kS0lFN3dKK3JNQW13MnAxYjJVUjEwdVY5b1dB?=
 =?utf-8?B?WmNFQnQrb3pPR08xZ0FsRHk2OWd5V3BVanU2bmcwMjBpM0diaG5icEIzbGky?=
 =?utf-8?B?TDkxUjJycnYxQnVRdkcyQTUzNWZyK0FyNmt1dGdaUmtrNlZhdjM0Ylcrd1NS?=
 =?utf-8?B?SzZkWURES29TZjM3NHNYUlRsNEtTZUdjaWlMNjkzK1prUUtpcmRxcVRNc2Iv?=
 =?utf-8?B?b1YrMWxGRHpnblB0S01pckFzZXpjNVFZdEF3SWxKTTFHSTVvV28yaGhmY2dN?=
 =?utf-8?B?elZNQ1ZDSWEzWTdwemN3MzRRbnQ0Mi8yV2Qwc0FtcTZsbmRLQ1FmcVlPRU5S?=
 =?utf-8?B?eWZMU2NyZm04KzBOQ3YyV1pnVHR4TTZnaU82STN0MGJubnBXbng4QW1jelFa?=
 =?utf-8?B?V1YzTHNybnRiMnVjUll3bU82NENteldEbUgzMnNIS0gyOVdpSi92bzdrMFZP?=
 =?utf-8?B?WWVQVVN5QW0yRFJ3ajVESW9qNjNJT2l4M0c4Vmx0bUNRV1BSSHU1VXFlQjlV?=
 =?utf-8?B?cDFldW5ObjRIanJCZjJ6b3EvZnBxV3p4WjZ4NVFRZ2hrWDZQUElSeTB3ZG1Q?=
 =?utf-8?B?SnY5TGMxSHJpZkEwQ2lXQlFJczIrc0gyZ0xpWkpadVZ0MWxqTHlRSVp1NVZ6?=
 =?utf-8?B?UXhWL0g0R1VPcDFHNnAxZFlnWFFPQm1TYzhoWUZndkQycXVwTDlndTNjbnN3?=
 =?utf-8?B?M2V4VHNEU2c1U3BLMk5velhseDRhZWZTQU1nUXRlSld1eTV2T1dSeGM4OEQr?=
 =?utf-8?B?MmNpdFRNMDRkVWl6em01U1hXSzkzTVFMRU1hbUxXMytMY3BEMnQ2VDYwb1h4?=
 =?utf-8?B?a3JrTzc3YXJmaXdUMnY0WnhOQ2NLOHVFOTJkMGJqbngwK0dBN1dTWW80aU8r?=
 =?utf-8?B?YVArRml3dnlaNTBoVEprZHpkNytNOUhVeVFwK3pUWCtwbk1hTzRFb29LYlpq?=
 =?utf-8?B?ZWRUVHl0UXBEYzVKVDFRd2tTTG9Zd3QzY3JyamQ4U3pXTTdvYjJhdTViVDhv?=
 =?utf-8?B?d1hJT3RJRkxuZDBra0Y4cHNQTC9PbUt6TzBHN1lBTklMTXNVVXFLTVdvMUVY?=
 =?utf-8?B?VmlQbjZZVllPR3BXT25PSitYOXlGNmV1U2VaKytLMWs0SldPYmhwVDlsSmZt?=
 =?utf-8?B?bGdkak01aFVBZ1NObWE0N2lmU2F2R3R5cEo3dmk4eHpNZDhETjRseGtaWExy?=
 =?utf-8?B?dEtQRU4veUUyQ1JhcmI2MUQrSnlUYjBGc0VFS1RxbGZlYXNtaWRPa2ZmZmFP?=
 =?utf-8?B?emxxakl1RG1VZ1dHWDliSnpLMTlSeFIvaHRNUkw1cHM1RExEVkdCZFB0U0ZP?=
 =?utf-8?B?aS83aHhTMmN0bEVTb0ZMMnorZTFtZWd0cEQrWFV6VThqbWx3UFNIV0swSkNu?=
 =?utf-8?B?di9kOExRdldaUStJQ3dWOXpGamNBMzZqVVQ5QnRMUXExb3NGRVM3Z3gzS2pz?=
 =?utf-8?B?VG9WU2tmMzMweURLWnF5QWFWVk04d28wU3NMdUNBUU16NUFHNE5ZMkV2Z2lB?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	edcQRC/JPLJVRzy5jwmqUlbVBEFr4TDU73PlWSSSq/PMAjQCUJ1mW2q0PvaiF3Xpin637gAPMok8lWrEX1DiStYZVwc8z9CMGhpdw4kBzkEqXBko48o4b0elY951VqWKX5NsE/rhNkjB+f1oFSzm2P2rxK1r50JNSWQEu0hH/sFIR5wOU0huqjV2U0Rg1vaF7iRTMzXepqHo6GkyC676hbyh/FrB4ZPq3xR1NmAwFKqel9z388MzGcmmNFCOwjoPzynF7+NOLadhr5bJYMM71BdYVPbEc9xxJU2lC6w+8q7GvjIHvUSSnz46U8bPNjPU8SUoFAvnkfjp9dnATtR9fW6akM1tITKwyfDB/AutK9S0UX1ADdr7nWjMGtxmgasftYQv9IV/N18eqTe0Wz3DQsSoFkW67+CGPy9mRRJgwy6I8ckTFwdTYSIlDaArqSEJ8gQok6BPhEgC0bR8FEzMB6z2Tfko/5wt15EkS9L1K45h1RqwZika9d2bQ9KxGkSdeuihNAA7XmuBwiICc2K0RS1uebZ1QP2wP59xBw+NHjhXGLTB0XnEZIE9EdZdgnaT0IkCnExTXR7WEXpZA6WkhIt/X5vpruhm9D+8E+35cEBFcTj9yhOq84ROXSvxJ6FbsSkHwlAxu1dec8Fi6aVMNphwqbah+MXAVI8Hy3vom3bOpF2LFgivD84gLTjgVlfkvq+KnC/E+gWPUrVT0PRs8znHBiz7bVy9Nw08NlLUNnDyLiYbRjbs6cU6Tl1jnDtSRQu5VdMCpIwsMviwQGSszgqwSuj0eRncvrEeTfCzxlfIwjjz8pxaeziNN6IRGUrTToIRBcYFST/CBXPqP33bCQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c49cf9-23f8-44e6-e417-08db23b43546
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:15:09.9543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7KlYAbmKuJM0K4KP4laNu2nv6fXsAO1jEc7we1o39Vked+7sJUGkU2EwZ8onPlGChOeDREPvBWKC0VX+H806A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5069

On Mon, Mar 13, 2023 at 11:43:43AM +0100, Jan Beulich wrote:
> On 13.03.2023 11:31, Roger Pau Monné wrote:
> > On Fri, Mar 10, 2023 at 03:32:41PM +0100, Jan Beulich wrote:
> >> On 10.03.2023 14:38, Roger Pau Monné wrote:
> >>> On Fri, Mar 10, 2023 at 12:06:29PM +0100, Jan Beulich wrote:
> >>>> On 09.03.2023 17:58, Roger Pau Monne wrote:
> >>>>> Introduce an install target, like it's used by other tests.  This
> >>>>> allows running the test on the installed systems, which is easier than
> >>>>> running it during the build phase when dealing with automated testing.
> >>>>> Strictly speaking the vpci test doesn't require to be run on a Xen
> >>>>> host currently, but that allows easier integration with logic that
> >>>>> runs the rest of the tests.
> >>>>
> >>>> I accept that as a possible way of looking at things, but personally I
> >>>> remain unconvinced of this model. To me what is installed should be of
> >>>> value to users. If there was a properly separated directory where all
> >>>> (and only) tests were put, I might agree with installing. (Nevertheless
> >>>> this isn't an objection, merely a remark.)
> >>>>
> >>>>> While there also adjust the makefile to use $(RM), and rename the
> >>>>> resulting binary to use a dash instead of an underscore (again to
> >>>>> match the rest of the tests).
> >>>>>
> >>>>> Since the resulting test binary is now part of the distribution CC
> >>>>> must be used instead of HOSTCC.
> >>>>
> >>>> This breaks the run: goal, doesn't it? If the new mode is wanted, I
> >>>> think the two kinds of binaries (and rules) need separating (maybe a
> >>>> way can be found to avoid duplicating the rules, which would seem
> >>>> desirable).
> >>>
> >>> The run rule is not hooked up in any of the upper level makefile logic,
> >>
> >> What about the run-tests-% goal in the top level Makefile?
> > 
> > Urg, I wasn't aware of that target.  I assume just removing the `run`
> > target from the vpci makefile would be an acceptable solution then.
> 
> I'm afraid I wouldn't view this as acceptable. I would very much like
> to retain these run: goals, as I view it as important that such tests
> be possible to run easily and right from the build area. What might be
> acceptable to me is if ...
> 
> > It's still the user that needs to explicitly call run-tests-vpci, so
> > it would better know that HOSTCC == CC before attempting that.
> 
> ... the run: rune would be enclosed in "ifeq ($(CC),$(HOSTCC))". Yet
> even that is fragile. For tests like this I view it as secondary to
> be runnable on the destination architecture, and hence I continue to
> think that if installing such tests is really wanted, binaries for
> host and target should be properly separated.

vpci test is special in this regard when compared to the rest of the
tests that do make use of the hypercall interface to a degree, and
hence are not expected to be run from the build host as they require
to be run from a Xen domain.

I think the benefit of having the test run part of XenRT is greater
than the downfall of installing a test as part of the distribution.

I've added a guard to the `run` target in order to check that HOSTCC
== CC, hope that is enough.

Thanks, Roger.

