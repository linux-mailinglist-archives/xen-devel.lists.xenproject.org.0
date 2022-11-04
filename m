Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C028B619998
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 15:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437605.692063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxbM-0004MA-8P; Fri, 04 Nov 2022 14:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437605.692063; Fri, 04 Nov 2022 14:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxbM-0004E9-4I; Fri, 04 Nov 2022 14:23:20 +0000
Received: by outflank-mailman (input) for mailman id 437605;
 Fri, 04 Nov 2022 14:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqxbL-00047l-1Y
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 14:23:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 388129ab-5c4c-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 15:23:17 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 10:23:08 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6515.namprd03.prod.outlook.com (2603:10b6:806:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 14:23:03 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 14:23:03 +0000
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
X-Inumbo-ID: 388129ab-5c4c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667571797;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=QGCkcVnG/NI9RAEeRDXnzxwkn0vXfi6vNsr+1YpUetE=;
  b=DquVKi2JHNPvRGqgGBhUxGizvsV6nR/+qxooL+j5YoQcM3G3rkGhyW7O
   LbKau8iyCL2ppKUFvGM8baoVpDxx7kZBWS32KmMIcSjiPNiQxi2s9cp+p
   r9443muN0xYFGwYYJnZoQ4hkpWiaqzGjtMRL1nRX1OHyi1IBl7GhH9Jyr
   8=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 83265212
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kyOMC60IqQj3+2mJPvbD5SRwkn2cJEfYwER7XKvMYLTBsI5bpz0Gz
 GsZUWCFPvvcamWjKosnYI23oEkPvJTXmoJqSwNtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKGtV9
 MAdMGo3fx3TgMa5/raBZMZzv5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1cZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r83bWRwHmiAur+EpWy+f9KhFSiz1AzERhISxi54qa+hV6hDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbjNHcs1gi8YwShQjz
 FrPlNTsbRR3uaCRYWKQ8PGTtzzaETcRBX8PY2kDVwRty9vprZw3jxnPZs1+C6PzhdrwcRny3
 jbMqiE9jrcSiMcj1qOn8FSBiDWpzrDKQxA04EPLX2ujxgJ/eIOhIYev7DDmAe1oKY+YShyNu
 SYCks3HteQWV8jSz2qKXfkHG6yv67CdKjrAjFVzHp4nsTOw53qkeoMW6zZ7TKt0Dvs5lfbSS
 Be7kWtsCFV7ZRNGsYcfj1qNNvkX
IronPort-HdrOrdr: A9a23:a1/x/6HNxJTIUVk7pLqFDpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAvhHP9OkPAs1NKZMDUO11HYSL2KgbGD/9SCIVyCygci79
 YGT0EWMrSZYzlHZK7BkXOF+r0bsby6Gc6T9ITjJyAHd3AQV0gs1XYPNu7deXcGNTVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xA+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlXAnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxOIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh57D3xHklX6voIRiKprzOSI
 JVfYDhDbdtABinhknizyVSKIfGZAVyIv+EKnJyyfB9nQIm30yR9HFouvD3rk1wiK7VdKM0mN
 gsSp4Y8o2mbvVmGJ6VV91xNfefOyjqfS/mFl60DBDOKJwnUki926Ifpo9FrN2XRA==
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="83265212"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yu502h4sGqGLqfbxHai5Gw/1v13i6xqSm3NmL8kd3iMN6k2v9fNAK9OaXnrduOoxVVlT2I8A/DHXiUHnf3o0eeujhct2eAK4pw9yV/nsNS57MJ/dlD8Y2sBOhVTdtrao4SUzOZ4/Gvm6mCPqpPPhZAzubl42E9kfeMXBrl5hPR8DuQK1Q2hUKeZgl8it/kAiL9oV/sPY3bXM1ocxrpt+4aFYCQNFSvW+ZVva2DjPrQ5ln+qZ+ghCz0aaI2vp5vvxdTGlxU8+VBA/7IIJg8CIKWkTBIBgkpAv63OEhZRNee7ev7FA9d2LGTR1lkcYRk7VZYtGkA9XmuJyKmESwVLPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5FcoykpRdaBEJbDlbJSB5pw20ep6imNx6ZZTjFvKdk=;
 b=ZIkNlDOUUWd+51Y4kBsFEH5DwbrLFt72tfMJKVrvpV+rSMnpRTunZ/PzYKLln5xF+FrUvCqQ2shCw392zTSALUBopM5xS3SMY9/LNfVXva+nC7VyWLriOwDSZRhjxfpWnxnK9j5mkq2amnCUB8vrgfC1LfbU/lvkgiF2RWNyJgJVpac4bfPmf988t2kceJNlALm81+9uUKvll3eoLbi9ryoSpMkisf9u8eZdew0zkgAk/uNHA3rF3eU5OVYqiBfH+b9EY8TQzoNaqGe2aTZWtpvHKgTH3kJ6aIjflB9d6FS3nTlA775gHMBwAPr6o5u87kw9CbodghzxEfnGTUVWgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5FcoykpRdaBEJbDlbJSB5pw20ep6imNx6ZZTjFvKdk=;
 b=nRemdBN3atvG29DPIXoiZ8Pprm+jgEhhC80qDSeuNL2u/bVGgtKrC8udcB69NJ1sSvbYtbMkAH0OH4NlzOhFhSRJYcEQqlPLx6lGRhvMyKL24TVnvPMBCHFGrBBWOLDMk75cKpQMZU4SxPHT6OWv2nY6b5gk2NSvGWDmLGtBQPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH for-4.17 0/2] vapic: followup from assisted APIC series
Date: Fri,  4 Nov 2022 15:22:33 +0100
Message-Id: <20221104142235.36556-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf0201f-d91b-4f29-f2de-08dabe701553
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hCcf+hTx5o0dMIScUYj1mYTvyZ6s5aMqZUjKns+c4eXiZY5uYu8fY59+RJMZoeftWOfYS3+d7aUNpLwy+6zD5Wlj5mnRM0fGJ/6tVU74YiVWIf0BXRX7D7lupfdv2NWnBBiKGpr6oHYnyOUmoU/t0z14ZrUQvKAvSGpCaImKy4YByR6Ae4FCl+TvJujtI5eaCRd4/x8tfuaijq1lHBJybV8aYmpxmTrV1Mah3L74LjpjkbNcVUEcUgTVH1ZaVyXCfEDDhfDZY0qUxl13mzeU5mX8b51PeAdcWylyKldl8s/O7h5k0gC/fVF/P9I406c/jDOlPc7sIxvaGQ53YkG2pEPknFffnf7DMyjMcvfiFcrbysjBiz+vmcs+yw73MMuelLUGw3NQAaUK3ILnLQe8xqE9HU+Z57OlsO9kSSIOxqek2UTP9gNVJzX8oNZDIiM2CiwYhSpMlYhv0Lro5wAHZSzzmqJZ8SvN6RN2v7MQihyxnCqgphQe5FOv3pvOzyy+U/Yo7QWrYEvIaclThGfREt6jDzHYhdkScfTk74Gjr5EtHm6xwzXhgp5qzY9v4WKvdYYUDCnb65qqdZr2t70lh7ammGLpQ5QF0UiGH0WK06SCByb9vx5H2Zj1ohpRTD2GSNdsVyJu53K2Ig6xplrcAPd0kA6eIEW3Oyql4vR+jmEWcfHWbmTkUTvGjMRhK0fU4VR+Ic3Mdh4079LLPUriuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199015)(5660300002)(82960400001)(38100700002)(4744005)(66476007)(66556008)(66946007)(4326008)(316002)(8676002)(8936002)(54906003)(6916009)(41300700001)(36756003)(2906002)(6506007)(26005)(6512007)(6666004)(186003)(478600001)(6486002)(2616005)(83380400001)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1V1NG16RmZDYVMrMzNjanBXUm13SVJldWdaYThxWWFvUnRhMEJURlFlRVdu?=
 =?utf-8?B?L25Gd0VOVkc0NEtrd01hNFBtbG5KNVQxSnZkd2IvL2k1Y0FEb05TZzlmaGdn?=
 =?utf-8?B?WEw1Qk16NjhncUFoODVyVnBhV0F0ZThyWXZrNlFKbDVvOXlrUXNhMXN3cVRY?=
 =?utf-8?B?a0lNaXdqYWlxd3JtU25kaytCMTZpdEkvakppVk1HdUR4d2ZEQVA1bWhmUHRQ?=
 =?utf-8?B?VkhNbGhSSHlDRjJqcEVKM3FUWEszT0h1UmFGTmtUK1N3S1NvdG5GaWtmR0ti?=
 =?utf-8?B?YXFTOVhmOTQ3Tm1CQzh3TUJweHFiTGw2QUcwd1lyNmFkaGtOWVZBcjF4V1Fm?=
 =?utf-8?B?OTdYUDlvMzhINFZDN3VIYXF1aTJiRUxUY2lVaEZSZG8vZTlLOXFGV0E3VTVw?=
 =?utf-8?B?dVFITmhUY0hxSzNqU0JxOVk2QkZoU09nT0xqZWl4YWIxWWN4cGRkdEtleHNp?=
 =?utf-8?B?bmV5angvOTk3SjRkOUpJR0pwK2R1dHkvVU1wOE96YklDVzhNWHV3TlgxTUNz?=
 =?utf-8?B?RDZ1S3JjS3FOQmd0RjE2dHpBenh6ekJmcFBlQ3RDVlRySHQ0UDBwSDdUelA3?=
 =?utf-8?B?aEhrMGRQbFg1eHNlZWY4U0FEdjZ6M1JheTRFU2ZzTW9OeFp1UkprcnBzUXBy?=
 =?utf-8?B?djIyVTV1THBJaTJSZG9Relk2N2Z0THBLL080NVAvcnV6aHNpNnlqSGlYUUdF?=
 =?utf-8?B?eHlOUUhzRUg1ZFcwM1RpUjE0bWR3QS9qVFgrRlRkSFh5dnc0NlJvbWpXbUx2?=
 =?utf-8?B?dUVqMEJmZ25Wc1NPSFprN0E5cmdkSnZLVzBlYThOVENmOVZDcXI1TmdSeXo2?=
 =?utf-8?B?bVU0U3dFL0lyQnFST2xsV0RrMWppdUcxTnhyb1l2VTZTaStHcTR5RUZqOEVB?=
 =?utf-8?B?RHNVOFkyUEN1cThuYWJ0dDNDWFVmZmFWcXRJcjJacXkwY0k4S1hBbWtXQ0Qy?=
 =?utf-8?B?dUFzZHQvRTlSNkNjSXRHdFlZOTlEUnVGRHRKOWdacnVtTFZCSHJPRjFHRXdt?=
 =?utf-8?B?eTlybnNWUUozM1dqa1k2MU1lVEVsQ1gyb2FjLy96NndiQUxuMXlRTWJmbVVM?=
 =?utf-8?B?ZFVVa29FUms3cGFocmlWS2NlSklDb0JvbEpJWVNSdHVkK25jYTdCdFpvOHFo?=
 =?utf-8?B?Zm5icDREZ0llTVhHVXJNd0I1Mkk4TlRveEhnOGlrTGtCMzJ4VXQrQUlDL2JQ?=
 =?utf-8?B?SXZyQzlXMGpsUlhaaTEyUWwxVjNEaEFPZG4reUlXaTVMV29Ubll4RExxbWhs?=
 =?utf-8?B?UVF5dUJ1djRMUGVqejhGYTNJN1dyNWdWWXJ5KzBMZUxkYjZiN0k2UGdZQ1E3?=
 =?utf-8?B?Wlc2WTVWcDM2TmEyTkJhUFVrWHFHZVIyd0Z4V1p4QzB4QS9GYlorS0Mrblhl?=
 =?utf-8?B?UEQzeTcxa1FRcDJCL3JvUmZtR1ptVFhXN0FiT1NFRFdKWHdXSGRjeXVoTlE0?=
 =?utf-8?B?ZkJsc2tIMUxESjBSUHZYcGI0aEFZaHZ4cDRKakJOcnRJM0JTeDBsY09lOU5P?=
 =?utf-8?B?K2dzVm84WXRRWGNkbVBmclpyLzhONXUrWm1ERisvalFKYnZrRlZ4RkFMTDgv?=
 =?utf-8?B?WlFYeXZ3VFZSMWZ0MDV2aWVYenpTZEJjWTk0YzRkUDM5ZzVNU3NmWWc4S0hL?=
 =?utf-8?B?b21uVVFJeE81SEJtaDhOOHZqcjBwYjJjN3dtNjNEenFyU0l4MlQ5QUFCRUV5?=
 =?utf-8?B?bURFZHk4NnBQN3FUSm1GWTlseVhEL1JINmNLaGc5bktxUHkrdlh1aTJ5Ukxi?=
 =?utf-8?B?RThsY2xIdkZiclVrV3BYbGxFU3BHT0RDdkhsNlhkMUsyem50dGJVUlN3eXha?=
 =?utf-8?B?dmhRV3hudUZLVzl2UTIyMTBSWDdhbzJIZHFtaVF1RnN5VHBSdlBJdnc0cFYr?=
 =?utf-8?B?MFBjMW1tamtnaVZEOVdoM0w2czd0a0F5NWtLaUZGeEpQbGp0SWUwemFpcVZW?=
 =?utf-8?B?Q2hSdlNuYUVBVStZUHFWaVp0RzNFNVM0QmhnWmlnZW5HdHhER3VSNzgxNjA1?=
 =?utf-8?B?b2tvTlZhMHEvK0c2YjlNa3JTSmMzbEpuRkE4SjF2d3FDM0s5ZDNFZXRGZlFi?=
 =?utf-8?B?L1g3eEdBek1GMkttUDlCOGlYNU9uWTArZUx5RzRGSzhTVzhyKzA1VlpGTTdI?=
 =?utf-8?Q?VX5u0mGft9bNRIDSAUyu8VM3X?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf0201f-d91b-4f29-f2de-08dabe701553
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:23:03.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Tcd05pH80sQZiu7TlwPvUQ6GP3r7SgwH2+Nrkohz1QWPTraIb4F6syEYYKUsUTb+0Si6YWoqVmNPr28DZLVxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6515

Hello,

Patch 1 is a plain bugfix for a feature we expose in viridian, which is
kind of unrelated to the series but patch 2 in its current form depends
on it.

Patch 2 is the actual meat and changes which features get reported as
part of the x{2,}APIC assist flag.  This is an attempt to repurpose the
flags so we don't release a version of Xen with a set of flags that we
will then either remove or use to report different hardware features.

Thanks, Roger.

Roger Pau Monne (2):
  viridian: suggest MSR APIC accesses if MSR accesses are accelerated
  hvm/apic: repurpose the reporting of the APIC assist options

 xen/arch/x86/hvm/viridian/viridian.c |  6 +++++-
 xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
 xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
 xen/arch/x86/traps.c                 |  4 +---
 4 files changed, 28 insertions(+), 15 deletions(-)

-- 
2.37.3


