Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B517637BE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 15:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570479.892291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOehl-0000jb-5y; Wed, 26 Jul 2023 13:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570479.892291; Wed, 26 Jul 2023 13:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOehl-0000h5-2u; Wed, 26 Jul 2023 13:37:29 +0000
Received: by outflank-mailman (input) for mailman id 570479;
 Wed, 26 Jul 2023 13:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOehj-0000gz-S2
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 13:37:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e20f85a-2bb9-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 15:37:26 +0200 (CEST)
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 09:37:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6592.namprd03.prod.outlook.com (2603:10b6:510:bb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 13:37:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 13:37:16 +0000
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
X-Inumbo-ID: 8e20f85a-2bb9-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690378646;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9KVJiarTHFwOuGunmlfrn9vJfXfousl960l8fHxPWTA=;
  b=SQ8Jt9xfepY6KULBr81E1UDkE+xOIoEKIeZSnR7TYcPUEvITi4I6UEUA
   FqsPUI5fVIi8wf8i2QR7r9xdqsP72e0nPDZbktAxYWefenv+Gtc9jHwAs
   twKPWkwcALbdkQBrDciimn7C+7kIzJxxKk9b5M1hA72ksbVVz4wzFZSCx
   4=;
X-IronPort-RemoteIP: 104.47.73.40
X-IronPort-MID: 116799156
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9RB8fa5ePRGCJjgktAx6NgxRtP3GchMFZxGqfqrLsTDasY5as4F+v
 mcXWm2PPf2JNDTze4gjb4rg/BsH7JTSx4VlTlZq+3hhHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 tgnCwEJYEG5g+O4mpaGEqpNm+88FZy+VG8fkikIITDxK98DGcyGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0otiNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWw3yqCdtPStVU8NZyvQGU52M5CyEbelmE+fmW1nXgBMp2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZNcMcjtdM2bTUy2
 0WVgsjyAjhyrLyST2nb/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7i7BNi8cOj/m/5Qqf32rqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaL5l8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:pTt4mKFWajbgmyHLpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:rcaTD2AD50TQW8z6EyZDy20lHs50SHncwi30Hhf7KHtCV4TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AUvhXaw1qYXUlHPDmb+/97AEmDTUj+5nyD2ECu5Y?=
 =?us-ascii?q?6tuaGCnRwFGum0muva9py?=
X-IronPort-AV: E=Sophos;i="6.01,232,1684814400"; 
   d="scan'208";a="116799156"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEgZPc3iUetaGkRwje5bqbms9oo1Mr0OHqEEnv4EHwCPyB7Sy3hxhBWX8Y+u2XCwrPUCUYpwl+AdeWHZWUCjwrYUoeJhaTIREiugxRvtqHp76UU1XLaW2VoptUFb3avbsz8hu8sR3bDZM0vLf0NSDfWbEXoSA0ruOPK7tEwyGoMbYLP8zANvwj5STHcSKArUEpkbtOyb9Oif7Wx4pUQqtfo8wmC9ycoS58w8xEtUq6qxnhE126vptaHyM6Zuh9TZ7JErCFf8lh3cxXILLT151nvAkE+nsCs0goPj5lVcBhrlykbFlrAKo+KvM2dPehIl48vC1YtaK9DGK8llbn2NkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej03+lMAaLOLBjlUuvv0T0UXsgOo/q90Ko3UE49jVZ8=;
 b=fRz77yjB2JwKjhPm0qFrwdb/gbPadBm7KE2D+01P2TfJ6hrtRddjk1mRA9R6DjNLZ/+GikyS5gEXB4Qp9j/iOW0nas+neEk9Zz0GGy+KCnKDj3kZzONoaV7Pkh2eoTEcNyXFeZmZM1TcrUmfYmt0D5Uur4TMw+43ZUvjgZq6ukR7g0BPdxpejaR3nJR1EkKamRGX9VDxteD4neS3VQ+rcPGV48/JjqLR52fAiIE76fRbv34M3iE99zNSGMJ6s3xeEq8TrzssUXtGlJIhtWg1i20HwvsGc3bLCb2gZTWTnw69T66blSFoHmaAQDoLhKpi5UwuU8TVIYGmq3DqPuEnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej03+lMAaLOLBjlUuvv0T0UXsgOo/q90Ko3UE49jVZ8=;
 b=to3gmp/CtHTz7qDDRYhryiTT8RrpTp+Hr8Q+nCzkIFZcYT1m3Mtg9My5GOuxVSRkPBBhPtOWesacECb2PZSoKIA4sZfaweQOM8qdzEyCjSn7aq4Tj8UGhiTTrkUjXDiB20Ob4hMMFjrqgTqIsLzEtdsJWDdYCpb/t6IhBYOl640=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Jul 2023 15:37:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vpci: add permission checks to map_range()
Message-ID: <ZMEhhxE-ozW3eYYx@MacBook-Air-de-Roger.local>
References: <20230724153741.42374-1-roger.pau@citrix.com>
 <5292942c-17b4-6b7b-a1a9-fdec87418379@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5292942c-17b4-6b7b-a1a9-fdec87418379@suse.com>
X-ClientProxiedBy: LO4P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: ac325e0b-4eb5-4af8-88ac-08db8ddd6d5f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TlDp0dHW4jU9NAiH5JCmVyPFZZNPSrw1xTQbjSqgjBPNfdheDjUz/tCpNh+uw3mLk6tzTB96nMC+ZWHPjMMaGYMH9tpP+onexkmvqunqOCUTxHUOGsMshmgbdaL9jTJM6SZkLs68EY4GP1l1KFS8HEuI10mKWwNkH0mpAp3bhGbMLr8eGmvXYGg45zToLXVOCjbLDBKe1nYVfLdPMLNz/4wx6+521wLKNLqFnUvayEXnbUBx95XnW04GjrdFXb1Pji4lYVUS1RLwCSRB2tCKXmoJ1fGLDiyj3A/U8mNvd+6/fcq7qJlHGIHWpeqZoKEDqBK1XAD9x2HoyE+SSver8LsUhwepzwCLbjhAbKL+wQycPtd3IoxVqE2j1Ne3ap8Cho78d49x1hfUCRREacm0pozX4ngi65Dxw85mbrWFKPjmf3Y64lH7Ia0Hidxne8+WqPIW+K4EtfaqgXLp5dYgqYS32DXZCqQqNYffnG2PwAYHWVXRJuQ1o7coAZrFC79Wvh8GJilNX8mfb4zFFpKt8ghtidURGvVejQYUhhqJOgPEByeWUD37Bzqlublo3X4O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(9686003)(6486002)(54906003)(6512007)(6666004)(478600001)(66476007)(53546011)(26005)(186003)(6506007)(2906002)(66556008)(66946007)(6916009)(4326008)(316002)(8936002)(5660300002)(8676002)(41300700001)(82960400001)(38100700002)(85182001)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2JFTzJTeE9YZDFsVTdGVXB0Yk05c0NhVFh4Ukc3V2VlZWRlc1NUYUp1bDJr?=
 =?utf-8?B?bVJ5TmlPaEcxWDYyaFhOQnFJRTh5UUdzVUZYOGh0WXZSLzUwaTNwS1U3NDBv?=
 =?utf-8?B?NVhqNjE5UmhZNEx0dFNnb1pYWS80ZEpnNjFyYm05T0tudllBWVdjclNNTVVD?=
 =?utf-8?B?RTBlb0VjbExPSjR1U1AwM2EzdXFPNXhmRi85ZTFxSFl3UlVWT2xnd0Z3OG5m?=
 =?utf-8?B?UGt3WlpQeGZCVFRDeEpMYTV5Zk9XcjlRN0FaUnRQbGlDVGdDZFRLUE02M0Nk?=
 =?utf-8?B?Q2MwNVpwUGNiSUdtbnc4YnUrMUpVVkpZb0pLcXk5TUphenFlT3I1aTVzaDBt?=
 =?utf-8?B?dWtpZ09sai9yTGpOL1N1dDZKVDJjUnh1ZHNpVW03NTR6SXAzZUpBTm5Cdlcz?=
 =?utf-8?B?eUsyY1gvTmZkYzRvMkVPNkRsdCtOU1p1QnUvKzRVS0tGNW9QdVgzZXk4T3hs?=
 =?utf-8?B?REgvSFpSdzU3MjNtdDZIRFVNS01JZXY3eXI5aERkMWp0S1ZvRHRNTVRweU5W?=
 =?utf-8?B?OXhVYThKL3pBaDZtL29ZSDNIT0pMMTBwYUpKaUNzTUhVRWFmcS9uaVZYZWly?=
 =?utf-8?B?cTNvWjNaZ2tJOXhZejIxSUpxWFZtOUN3T2FTcHE2ZjN0MHdTUXBRdDdUcjd1?=
 =?utf-8?B?S0hLSDdhK3pUUTVEWXBhQkZYUWNRWXVqdGlFQ3pIam9ScEMvSlNWMGJMdi9Z?=
 =?utf-8?B?RGN4eFJESW5iMzZCMmEwY3ZySXVhSjBpbG5rT3FXdmxCUmo2bFNuWktLc285?=
 =?utf-8?B?cHFsZk9udlUxa2k4OThoWFNWNFdNSldhNWlTeGhreXlRNm5MVk9uZm5zK09j?=
 =?utf-8?B?MnRDU1d6ZUZMcWtjRzRycmdQK0hnNWErNHFlQVV4WmZYKzVHcXR0SndHNVdz?=
 =?utf-8?B?MlQ2dTVHM0YrL2swRnprQk5NVHZadmRwSmRDeE8rcHBWSnZacmtTQkI3VVAv?=
 =?utf-8?B?WlJ6d0I1c0dLMVlBL2lYVDdqTmNnWnlBSjYrWitQRFN2ZzlmM05vcjdrQmVh?=
 =?utf-8?B?RUlOOWdrOEIxUm44R0oyVFdaZThZNENlaUQzeDdJdVE0ampnaXMvWEtsSE8v?=
 =?utf-8?B?SlZRU2VCOEhSa0c5cXlSckdTaVoxQ0w3d3R3cWF3bzlCTjBzTXFZOWZNL3dU?=
 =?utf-8?B?S3oweUplRjBiNnRQVVNLVGQzVVkrdHN6VzFPNnlydHVPRDNsQ21QNXpZclk2?=
 =?utf-8?B?VXJwNWxYUDdZcFNOTHZOTlFzMHZINGF5Y3NyRzB5MFN1aUpPaFJkRGlXZGND?=
 =?utf-8?B?MDBMWlFwbm5nTk9sc0F3bVFtMjRkcHpFKzBvMjR5MFIrU1pKNTZoT2lFNXZF?=
 =?utf-8?B?bEVxNitXQjh6bm0zZ1Nna1NVa0plTlNUUjlOQmFWTmV5c2l5a1l4ckpQQVFU?=
 =?utf-8?B?YVA1bWloYkdiL0RvOEorcjA4K01adFJuQ3RNbVdQNHRxTVhtYXhvK2VYdnJT?=
 =?utf-8?B?L1N1VEZqd08ybzVEd2lObnp3cEEycy9WOEVoUXpMZHFzZUJ4MmlNekN2RnJm?=
 =?utf-8?B?eTM1UmRVQUd4Q2VVdVdOUC9PRDd2b2tXRHR2MFAzb1JwL2RhdGxnTENUU0Nz?=
 =?utf-8?B?OEl3NDYrMTVBYmFxRnBTbFVFbUg1RTROUHdRSUdCQ2JmdlM5YVkrOXlVSjhN?=
 =?utf-8?B?TS84MUo3ZlJEUVMwZTBSVGZrNjhNTGV5QVQ4ZEd2d2RmdjNMMVVsUXZTTDhh?=
 =?utf-8?B?NkxjRVdEa1J0bWZNVlJ2UWJxTGlhQjhwQndwbFdYMUYzdExLY0dRV3dydFVU?=
 =?utf-8?B?SE11M1Z0ZDRvM2FLQ3dIdnkxL2ZnQWRpREQ3TVI2K0FXTWo5UzlFZXNYQ0tQ?=
 =?utf-8?B?dytScWpkU3h6SmRadFhnRXptNWY4QlExRlhMS2xXYUh3L3dzNGczakFkSlBl?=
 =?utf-8?B?ZHFlcExEK3NySVFXWHBoc1ZNNWFSNkM2VG5PbGNFa3NwL2tqbzBEM3ZhckVj?=
 =?utf-8?B?ektiMDhaYU1pcXhaUjR6c3RKby9oamx4UHRweS9ESHRmV3JXd2FYU3MxL1Ry?=
 =?utf-8?B?bVROVmYvTGtKZWRpb2dyQmVYOXQwNW1UZytvQlh4Zi9uRldsd2h2RnBrdWxV?=
 =?utf-8?B?aHZ0TzFVMFZWd0RhdTcxZ29Ub3NMZng2dEVZcGJNUFFBNFZHbmhLTlhqUm9K?=
 =?utf-8?B?K2cwZFJOMDBYQkxSS2tmYjJWTVZCUHNSbEtSbzNoWllDRGxWQ0h4TjB3VmdL?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rgnCrAEUsjpeD4hJ8bm6DOvB4UtA8lb4w9JNzvwPZELC/pVNkl88L4F8gKfNYP7bWglS+BryBjya2kUVU9UVEqe6ECoSDznz1ByhH4hgyh5yG79jXZxsaJmeGAbFOZeLb+gQAa3jDjj8M/Av1sGc02Bm4IBi9p9GhSUJZ7G1GlGhc8ltGgpTShUvgK7rTPv0oRkGvr/xx8npuHRDkaj1mnns2jTW9Q1DSLxEltRbfqKRZe09wF1ltgGsgxVgi0w8SA0SUL6pGNAjXVV6KIvRg0naDMSOFYlhNYgI/nrxIv9d3SJSQZwHyf7KWhzynWP6ODtH6iJYpTmM+DNdAqWC9/QQsy0bbBbmogp2e8OitDECLwGszzd2lzvhGdVY7bodHQAJuv47QGAZuAJBFabZdXpw4cT2fkDQWcSuELUv7sk7pTTtV7vREIz1ggMDWEfF0GY8ViQ4M+HbuReamKtGiDM3vwkCMI7Saj08fNLRktUzkaIHLlzavRRJ8CRtqsbWsv7KOTk/bKZpGOWkSXYlAUKYbJelM1zD8WkD89MRH5BkvkEUZ7qFMhKokQwPbyuHa6h045eg6xoPeXzguGQiLnFKFGuDpF1ycFrWGJxoufaq6z+b19DDIYLCHmTgHlsTMfqniu2YpZaG9BRs0G7+rw8OlGJCZzamA7a4zamqIii4Sx0C2EUcAk8tGEHoGu0HoYstMJyORK1T0mXDbTMUCDSnRwvZYd/hPzqzUTa4HfdTv1AD/LWalAePqjVzRWRSN+u1H9gNS1KZ0/NF+ttVnEmmwgQZoqprYJfKG25u5ml1ny90/jTAOaJbBKkSssdVbseMxUFzED9w9VWzyTzgXFNFxUBGeI+hJAOq6DhgYZNKQ42Vp+9sWaab19RxuRsk
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac325e0b-4eb5-4af8-88ac-08db8ddd6d5f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 13:37:16.7897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K4TR95pgTwNnFQWXyCzNDWGZtu+5cXtrQtclqfp2479oIdwt1HAxxgttNGwosQL2//NDdA4EwSCxIp1hp2Wdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6592

On Wed, Jul 26, 2023 at 02:36:17PM +0200, Jan Beulich wrote:
> On 24.07.2023 17:37, Roger Pau Monne wrote:
> > @@ -1184,6 +1177,20 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
> >  
> >      printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
> >  
> > +    if ( is_hardware_domain(d) )
> > +    {
> > +        /*
> > +         * Setup permissions early so that calls to add MMIO regions to the
> > +         * p2m as part of vPCI setup don't fail due to permission checks.
> > +         */
> > +        rc = dom0_setup_permissions(d);
> > +        if ( rc )
> > +        {
> > +            printk("%pd unable to setup permissions: %d\n", d, rc);
> 
> The switch from panic() to printk() may want mentioning in the description
> as deliberate. (The usefulness of %pd here is debatable, as it can't be
> other than Dom0. But I don't mind.)

The printk just above uses Dom%d, so I assumed it was best to not
hardcode 0 here either.

> > @@ -43,6 +46,21 @@ static int cf_check map_range(
> >      {
> >          unsigned long size = e - s + 1;
> >  
> > +        if ( !iomem_access_permitted(map->d, s, e) )
> > +        {
> > +            gprintk(XENLOG_WARNING,
> > +                    "%pd denied access to MMIO range [%#lx, %#lx]\n", s, e);
> 
> This doesn't look like it would compile. Also gprintk() logs current,
> which I'm not sure is generally applicable here. IOW I think it wants
> to be
> 
>             printk(XENLOG_G_WARNING,
>                    "%pd denied access to MMIO range [%#lx, %#lx]\n",
>                    map->d, s, e);
> 
> Same for the other log message then.

Oh great.  I changed the format of those before sending and didn't
rebuild properly.

> Another Dom0 related concern can probably be put off until we actually
> get a report of this failing (which may be more likely because of the
> XSM check below): The function being used as a callback passed to
> rangeset_consume_ranges(), failure may affect just a single BAR, while
> the incoming range may cover multiple of them in one go. Depending on
> what functionality such a BAR covers, the device may remain usable (a
> typical example of what I'm thinking of is a multi-function device
> having serial and/or parallel port on it, which are fine to be driven
> via I/O ports even if driving via MMIO is possible [and would likely
> be more efficient]). Of course, to allow some MMIO bars to be used
> while prohibiting use of some others, further trickery may be needed.
> But not exposing the device to Dom0 at all doesn't seem very nice in
> such a case.

Hm, I see.  For dom0 we might want to consider ignoring mapping
failures, the problem is that we would need to narrow down the pages
not allowed to be mapped, as part of the range passed to map_range()
might be allowed.  We would need to resort to checking permissions on
a page by page basis, which is not overly nice.

I think it's more likely for such BARs to be marked as read-only
(instead of denying access), in which case the checking here would
still be OK.

Thanks, Roger.

