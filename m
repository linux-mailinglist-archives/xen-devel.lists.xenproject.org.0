Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E66E7757
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523302.813221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp51B-000129-E8; Wed, 19 Apr 2023 10:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523302.813221; Wed, 19 Apr 2023 10:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp51B-0000zf-BP; Wed, 19 Apr 2023 10:26:29 +0000
Received: by outflank-mailman (input) for mailman id 523302;
 Wed, 19 Apr 2023 10:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp519-0000zW-KY
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:26:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02016b7-de9c-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 12:26:21 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 06:26:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6584.namprd03.prod.outlook.com (2603:10b6:a03:389::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:26:15 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:26:15 +0000
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
X-Inumbo-ID: a02016b7-de9c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681899981;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fVaIfj7D4pt9xMiM0aqUN71wJRxU4Y1ye+3bbjQFGPk=;
  b=cGY9DIlJswqRF/VTMvJn5llJMv4LTwKPu/L8UjJ288X4N2eAQ6Po8yMO
   LW12opFDLN7O2KnXmSQAoFR/mfoV8kif8aW7Rn0DCl4s3ogaG+SuE8i1D
   7TM7fnFqE71sCA/lrqS5ZCXingil4yNRhMVGbjMd4FJHvOscY/5liM352
   w=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 105978875
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xcatzq8IHu6PCN3YArIDDrUDBH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WYaCjqHOaqIZGT0fIpyYY/k90IGvJeDx98wT1ForiE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOakb5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklKy
 OERIz8pdyvavOLonJeqUPRtjPo8eZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUujdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXwHKkCNJNSdVU8NZ6hVG13F1MEyYEFkqRkeiJtmm/atlAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmtx6zO8kCmD24LZjdbbZots8pebTct0
 1qUmdL1FHpqubucRn+H3qeZqyuoPioYJnNEYjULJSMH/t3irYcbnh/JCNF5H8adlcbpEDv9x
 zSLqikWhLgJi8MPkaKh8jjvnDaEtpXPCAkv6W3/Tm+jqw90eoOhT4ip8kTAq+ZNKp6DSVuMt
 2RCnNKRhN3iFrmInS2JBe4KRbeg4q/cNCWG2AEyWZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y8PhwIRrKiuqRMSTI=
IronPort-HdrOrdr: A9a23:dSBMSqn1lK3qzCxsZUdRxjNct4npDfIK3DAbv31ZSRFFG/Fwwf
 re5sjz8SWE8Qr5P0tQ/+xoWZPwJk80kKQe3WB/B8bAYOCLgguVxeJZnO/fKl/bak/DH7VmpN
 9dmsFFYbWaMbEQt7ee3ODXKbcd6ejC2Ly0g/zT1nJ8JDsaEJ2ILD0UNu9YKCBLrcV9aqbR3a
 Dz2vZ6
X-Talos-CUID: 9a23:r29VHm2FD4nZIUVTBNQK5bxfHv04e3bS6G7renS4VzpMWaeISFWu5/Yx
X-Talos-MUID: 9a23:DGcBIgZ+3VCZN+BTpzrgoitTa9xT8ee/InAcoakhuviPKnkl
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="105978875"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ2/0qhIuDSEBTsEExeKhojDQMvhEv00q04JlV1CpAMMIgiYyfV9i/1doNFtar6+SzmSyt7z3vhracfuq6UoLEAcu9OM7CeHWPEnbznUXWm5Wk2gi9iCXNE6Ct20ojci+WMwwzGN4bjqpPWdcZD2fN1TajgPNZHL+rhi3a3cTOPWIHbipTnUrB2d6WlPaHI+lxIrvYP7AYPtlXat/xSPRlLPKjmj11iDc4YqokJ3+DUs5XEiZFL7dU/KBrHDqoKhisB4DLR8OuduNSBylVxjJcN8i6/b0clO0oZ833hL0dOF/Iy6rE0xhI06zDHiEh/3CR4GekAkXC45+k7sl7x5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdY0eKT7j39fP0NB5timUkRgE5tyBNYd1dMHw+IPysc=;
 b=ZOZzybQI+pUQ21Tue3lLrnTlPi1QjcBimA79Sh/jORrq0n+VF7wIO83B8tAGecK7Id9S1FKTXA9y5Zb7ME65fHJJTX8IHfszlvEA3rWteNBms3/vop8mrTxE9rURCnXQuqxysQj1oNqNuswAupsWr3M5whC6BTiCtKoUtxd0VLBujlO74bawnTt6AOptrkqLATNbyhY0e9qC/o4KqrGUxWakvmCkV9I/5nGOuxSo4eqILomQkLzkOCSEMJ41KGlcIoFGRuHGSA8S7kj26bQCHruXQdYY7r8SHTQWqJCTOTwvy0Fu/4Bf26nnYe1U1H+kz6FfY1LzqyTpeu+kO62Dag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdY0eKT7j39fP0NB5timUkRgE5tyBNYd1dMHw+IPysc=;
 b=kYfXF11yX2YV7wB9iaY2ojy6bK/nJV3hQW4E+JUt6gmX2Sgb2K2+wHikEoBGQsVgg8FDStarB0WkDQOJJbXju6Ahhzv4rsLQcsr08oGe2X1McLeCW+5X040v0tmhY9wfNEgLg5m108ujDHiocu43a86LPDYhIQwzA5kKgyydFg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 12:26:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Message-ID: <ZD/BwQ8u+rmOTt9S@Air-de-Roger>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
 <7452a070-48b8-03fb-26c7-3dc7d652dcba@suse.com>
 <ZD+uPd/wICTK6qB4@Air-de-Roger>
 <619fe14d-e5cd-c355-bcfa-1d20e0c219ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <619fe14d-e5cd-c355-bcfa-1d20e0c219ca@suse.com>
X-ClientProxiedBy: LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a5fb83-bfaa-49de-b60f-08db40c08148
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Q1gSDz2ibOv4YdZhyHQkDXTfYXIty4R/JIDbDfEl5sBtk7JLjZZ+PLNV9kZ/+kXwquYmPEi10ulLSKtwXJopxRoJM3KrhHM8LTS9di7QN6Z8vKJEolRkF0d4YqcWUNadMOokWbmKKrstvJODNWz3Mg5KXf4tNMdwiOiD5WxyLWGOf1oFn+DbH17WdBAShqeieGsWb9pgzXWibmhR8Zu7IOgLy/y1F1kPABIqxPIiRI4HWkUtA3xdsoNNH1nJn+2UhGqGIywHTjHbHCqzbCEfLfsSCmuEvB9nCy/7CKiOQ4pRwFmoXVpQHJt6Kszb4j2+JNIkma1wO59XMs6dVy8V+fnRqKH1M53C5CsTso9sJoSqnELPKlOUnu4wzTpYGwgy//Pr9O+kyCpCum5qP3eJyCLIdpXyYZ120qe2cT6NwB7whEZ5SkLJBlAL3AnTlpjaJHyBJcCpi3ZGgrcgQqJ2LFr0zfD+AgQDG4huB6N/VuoFaQ0L/pguU/uOfXi5N42Zrd24H+76IrBXggvtWT/ErdPCx8RebDd60Dk//UTjlVxdSmREGR7SGNvrdFcjGC5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(2906002)(82960400001)(33716001)(478600001)(6666004)(6486002)(38100700002)(83380400001)(26005)(6506007)(53546011)(9686003)(6512007)(186003)(86362001)(41300700001)(5660300002)(316002)(85182001)(8936002)(8676002)(54906003)(66946007)(6916009)(66476007)(4326008)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnFIUDhCM0NTWjVVOFQ4UHEvZ1k3M2daRlNRc25qNTUzZ2ZqQW1GNytETVBm?=
 =?utf-8?B?UUdBQnJjYTJhSXNJalEyNzJkSTJmTXpVaUs1OHVVemtiMk90MVFvWHVHYzhM?=
 =?utf-8?B?bjY1T1ZMVEdOMnEvVTNMSXlHVjRYbm1PNFp0NmZmczQ4YXBFd2s1dTMyRWZs?=
 =?utf-8?B?dDR5RWxXV3V1WXNxY0V3VjlRWVgzdDVPUTlCdTFMY0hFd1dkZm14aEs4S0Rz?=
 =?utf-8?B?S0FiMTM4WGN6TmpxdjlQWEhLREtVQ1ZjV3I0ekt5aERzalA4MHpqSFphWGxE?=
 =?utf-8?B?cnB0WW9tR3Q0cURWOTFXWk9hMFJOSGNaTFg0TE11YmovbEdqbXMvUERhMnNN?=
 =?utf-8?B?a201U0RFZVIrRnQ4eW5KMGxvVm5tZEpRWFB2NW1vZjJhSTBGNHBKSHc5WHJD?=
 =?utf-8?B?VEkxWWkzZkxwdmxGcHdHSTRjK2pmbXZJWEVlQXV0eG9nZ2dvZ1pSV1JwNVEr?=
 =?utf-8?B?bm1RM05laXhnQUpBMm1nQ3BvNDJUU2NYQlBLUVlESERlNEczRHk2Wi9BM2xL?=
 =?utf-8?B?SnA5eGZHV2FzRGxxNFArY3pySDQ0cGhzVlMxd0ltSTZlZE9PVzFDcTQ1ZFU1?=
 =?utf-8?B?dVI2ZGIzMTdJNWt2VzV3RTVGNkJlNVRNRkhMOWVrMC9ITkQ5WnpqeGd1WDZG?=
 =?utf-8?B?ajI5Unc4MWNJWXlmVFN3cTBPaHdwNWtYVmhRNHFxY1VmT2ZKRUJGSmJnS2g4?=
 =?utf-8?B?UnFDUnZtNU4vcmU2VThvM3ExWW9tRVZJSnFXVnprcWlwaG5WeWV4NGZLZVEw?=
 =?utf-8?B?YUJLWDBNL0ZFRElrU0lWS3pKMXFZRXhVSzAwQW9iUHpOWHNncFNwUVgyLzJo?=
 =?utf-8?B?cXU4TnFUVGFVSE4ybHV5dkFhMFczVGpvTGZidk9uenI1SkJJRWcrMWorMnhv?=
 =?utf-8?B?SVlrdW5CVkZPQ2psQ1R5Smprem1WUVRIR2dIWEV5VWpLYm9pbjZiOTE2RGFQ?=
 =?utf-8?B?b090WWR2ZTVTOFdPOHFXbDUrclBHTUp3Vjh0VzRLMGE0SmxUNDVqc2syNHRH?=
 =?utf-8?B?M1dPRDZWVnQyZEt6aW53eURtWEw5ZTQwNTQ1M29OWm9iRW1vcG1nZ3FoVmxR?=
 =?utf-8?B?WFZVWDhlcmZlazV0OUEyYWR5NGU2K05qcjg4YnM4dFRjb2hXUE9jZEl3d2RE?=
 =?utf-8?B?M2FpNjRzeDFJZjJXdER2WUxZTmNlc2NEbDlCY2FROGVzai9wUXNSZmFDWmll?=
 =?utf-8?B?d2xBWHI2WUdEajJDcXZHRUpGdWR6VGkyaUUzb2l3dXU4UWxQODcvenF2dDdN?=
 =?utf-8?B?eEJxKzAxQndwWkZTY013RmhPb0hML3NMekFlMkdoaCtyeUx5V0FRRU94djFU?=
 =?utf-8?B?Y0xxZkVNY2d1ZmlaMWpDUlVoT04yZCtaUElWMGlQVFZXYW1sZEJpUnIyV1NH?=
 =?utf-8?B?eStDRFdHNHdlQng3YVNKWUlMd1FsOWIwdGF0WW1heGxCbG5PdlpBRnhwRjl3?=
 =?utf-8?B?aG9XVFB6b2Jpbkp2MHF0a1ZrdXdiOWsyR3VyTVRWMkJ5eVBSVFdiQWY2aVd5?=
 =?utf-8?B?aHV6Szg5MFN4d2l4a0xhWXVpWjgzMnZ2amFCNU5xTzNLM3VMTzZ3ajJjZU1T?=
 =?utf-8?B?QWRzekVnd0dmRU5acmp6RjZLMm5qZW9NTGxrVnRXWFdTSXdZZXl0YUIvR3RM?=
 =?utf-8?B?bWdUcnVzd3g0STVCRjhkODNySVpMTUZRenNqNDRGOC9GdytLK2RPMGprYkR0?=
 =?utf-8?B?cDN2RTZEYUVYdmNmUEdFclkyMDlCNWErWVVjNXgra214NElZWW5MRlIzOGNn?=
 =?utf-8?B?V3NkVzFaR0NLL05jTW5SOXBELzM4TE9JWkxaeVlkYXF4TXBDTWsvTWxZaVRq?=
 =?utf-8?B?M1NsK01ZRExZNC9uc0MwdmkyaXZnRG8reGVFenlWRm55SGM0azFuOEdQcS9K?=
 =?utf-8?B?R0gwckp0K0o4UmZsL2dRZWFRVWNnUVlLcEhRWlBaODJlVXFsK24wdHlkLy9a?=
 =?utf-8?B?OWFMV1hKaXFEdzJDajE3NFBySFhPQ2JybTVTY1pUQWFMWkV1SUJ4SzVUa2hI?=
 =?utf-8?B?MVdlYzFvTCtFdjdRVWZpV2tPOE5VNmtMeG1QWnNJbGRubWZicDZibkNJRVly?=
 =?utf-8?B?RVI2bWswV3pGSEpCNFZzWFVVOUc2MmtObHlINDFmNDBaY2VsQ1M2UTYxTlBK?=
 =?utf-8?B?WjZXZG1Wa0NIc2hpR1poSFVLQW92Yk8wSEVFUXRYQVJxL0tCRzlCMTd0V0tT?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0JqAwGWpK5tVTuBLgI5G90hBFIkON20KiadL55wfxLLOOog7yClXXGgMomaOAU3ryaRU1FacYjvj87lkoVYY7zvHUsAgF8ev5dEjtWakyEriqIskEjjdzv0SJ1vI8yMs4jc14Qx6Kd+Xdkzyw3zv5igmYUYJ+4rONB5M4QuMjYm2s4qHjng5xRsFrElvF7AD8ui2pEnAyTKbQHrg+FChPzu/Ivd5KO8Km8VXhgadi7ZA46nG2glizjRfNWusaVh/94CmTqGpodP4kMrhlCJFoBcilrSdd6Gsg/E1h1M54OH3FlO9raR4C441c63gX+1RD/g1mHGBUvRyBhKgA8N7iKhSd9+qt6Ei6R6uDZzQXpcrzySPmQiY2uku/4kWtt0jmiyDoCZ5g/8ypY33tvJrxpb2Gre06Dwpwpc6JsvXw6sb4vDVu/Qd+xPZDzr9D6LiF1k+iEkKUy4HSNOv2ZvW02qo5V4GbYrF5qPpKonpykVbU4vu5fwjgI+jJPwTrCvwKiWwANUdCMTtVj/SXO08L/lI4ESAmc4Tex15KRyt3wzRNK/X3Y+A6WABgoTgny5tCoPsyeAY0pjZdTqgGbjKmmJCQMN0iYou+RUsJf83yFmu0aEpWi+uEFnz226n4982TtZ2JX4EjSUiJEnPeKY7+Q1w8atIra0rXkFccjT+kmHQyxHP55SnnamC9i+RBlC7zUbzOHWr5cymwc+UTsggPjwclg0VRekrdLiWXjR4yICLgGV9y8s9Kmqnf3/qtn9YudEcfrjLhWI6dd1DG0aKY1yC9lEql+VR91fCG+ZqDA/tbxSukjAQLGfSu6C2v8198TkE3zx++ZT86D6h7VqAWxFk9Weua5/kS3rlh+cB3VxZp+0VGUvi+se9K+9pQmQ+Xwp0hpMELuuwfrCTPtAB2Azu5/Qw8bFsv30KpVMlLHg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a5fb83-bfaa-49de-b60f-08db40c08148
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:26:15.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTBV8mK85XA11TVcnmhloakveHXNU0dOckmBJ5vP1hC4dwfktWk+EgRoqHSoOPqAINPPiUvTYnBIgoaTbrmtCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6584

On Wed, Apr 19, 2023 at 11:18:38AM +0200, Jan Beulich wrote:
> On 19.04.2023 11:02, Roger Pau Monné wrote:
> > On Wed, Apr 19, 2023 at 09:07:41AM +0200, Jan Beulich wrote:
> >> On 18.04.2023 17:54, Andrew Cooper wrote:
> >>> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
> >>>> The addition of the flags field in the vcpu_set_singleshot_timer in
> >>>> 505ef3ea8687 is an ABI breakage, as the size of the structure is
> >>>> increased.
> >>>>
> >>>> Remove such field addition and drop the implementation of the
> >>>> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
> >>>> value just inject the timer interrupt.
> >>>>
> >>>> Bump the Xen interface version, and keep the flags field and
> >>>> VCPU_SSHOTTMR_future available for guests using the old interface.
> >>>>
> >>>> Note the removal of the field from the vcpu_set_singleshot_timer
> >>>> struct allows removing the compat translation of the struct.
> >>>>
> >>>> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
> >>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>
> >>> While everything said is true, this isn't the reason to to get rid of
> >>> VCPU_SSHOTTMR_future
> >>>
> >>> It 505ef3ea8687 does appear to have been an ABI break, that's
> >>> incidental.  It dates from 2007 so whatever we have now is the de-facto
> >>> ABI, whether we like it or not.
> >>>
> >>> The reason to delete this is because it is a monumentality and entirely
> >>> stupid idea which should have been rejected outright at the time, and
> >>> the only guest we can find which uses it also BUG_ON()'s in response to
> >>> -ETIME.
> >>
> >> The instance in Linux (up to 4.6) that I could find was
> >>
> >> 	BUG_ON(ret != 0 && ret != -ETIME);
> >>
> >> i.e. not really dying when getting back -ETIME. (And if there really was
> >> a BUG_ON(ret) somewhere despite setting the flag, it would be a bug there,
> >> not something to "fix" in Xen.) I'm afraid I also disagree on "stupid
> >> idea" as well as ...
> > 
> > The logic in old Linux is indeed 'fine' in the sense that it doesn't
> > hit a BUG_ON.
> > 
> > The problem we are seeing is that when logdirty is enabled on a guest
> > with 32vCPUs (and without any kind of logdirty hardware assistance)
> > the contention on the p2m lock is so high that by the time
> > VCPUOP_set_singleshot_timer has copied the hypercall data from HVM
> > context the provided timeout has already expired, leading to:
> > 
> > [   65.543736] hrtimer: interrupt took 10817714 ns
> > [   65.514171] CE: xen increased min_delta_ns to 150000 nsec
> > [   65.514171] CE: xen increased min_delta_ns to 225000 nsec
> > [   65.514171] CE: xen increased min_delta_ns to 337500 nsec
> > [   65.566495] CE: xen increased min_delta_ns to 150000 nsec
> > [   65.514171] CE: xen increased min_delta_ns to 506250 nsec
> > [   65.573088] CE: xen increased min_delta_ns to 150000 nsec
> > [   65.572884] CE: xen increased min_delta_ns to 150000 nsec
> > [   65.514171] CE: xen increased min_delta_ns to 759375 nsec
> > [   65.638644] CE: xen increased min_delta_ns to 150000 nsec
> > [   65.566495] CE: xen increased min_delta_ns to 225000 nsec
> > [   65.514171] CE: xen increased min_delta_ns to 1000000 nsec
> > [   65.572884] CE: xen increased min_delta_ns to 225000 nsec
> > [   65.573088] CE: xen increased min_delta_ns to 225000 nsec
> > [   65.630224] CE: xen increased min_delta_ns to 150000 nsec
> > ...
> > 
> > xenrt1062821 login: [   82.752788] CE: Reprogramming failure. Giving up
> > [   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
> > [   82.793075] CE: Reprogramming failure. Giving up
> > [   82.779470] CE: Reprogramming failure. Giving up
> > [   82.821864] CE: xen increased min_delta_ns to 506250 nsec
> > [   82.821864] CE: xen increased min_delta_ns to 759375 nsec
> > [   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
> > [   82.821864] CE: Reprogramming failure. Giving up
> > [   82.856256] CE: Reprogramming failure. Giving up
> > [   84.566279] CE: Reprogramming failure. Giving up
> > [   84.649493] Freezing user space processes ... 
> > [  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
> > [  130.604032] Task dump for CPU 14:
> > [  130.604032] swapper/14      R  running task        0     0      1 0x00000000
> > [  130.604032] Call Trace:
> > [  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> > [  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> > [  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> > [  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> > [  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> > [  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > [  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
> > [  549.655463] Task dump for CPU 26:
> > [  549.655463] swapper/26      R  running task        0     0      1 0x00000000
> > [  549.655463] Call Trace:
> > [  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> > [  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> > [  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> > [  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> > [  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> > [  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > [  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
> > [  821.888596] Task dump for CPU 26:
> > [  821.888622] swapper/26      R  running task        0     0      1 0x00000000
> > [  821.888677] Call Trace:
> > [  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> > [  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> > [  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> > [  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> > [  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> > [  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > 
> > At some point Linux simply gives up trying to reprogram the timer, and
> > that obviously lead to CPU stalls.
> 
> And that's all with old enough Linux then, I suppose?

That's Linux 3.10.

> > Ignoring the VCPU_SSHOTTMR_future flag allows the guest to survive, by
> > not returning ETIME and just injecting the expired interrupt.
> > 
> > Overall I'm not sure how useful VCPU_SSHOTTMR_future is at least when
> > implemented as done currently in Linux.
> > 
> > Instead of trying to reprogram the timer Linux should do the
> > equivalent of self-inject a timer interrupt in order to cope with the
> > fact that the selected timeout has already expired.
> 
> Indeed - that's what I was expecting would be happening. But I didn't
> go check their code ... Yet them getting it wrong still isn't a reason
> to ignore the request, at least not unconditionally. OSes could be
> getting it right, and they could then benefit from the avoided event.

Well, the reason to ignore would be because the introduction of the
flags field and the VCPU_SSHOTTMR_future option did break the ABI.

If we care about that behavior we should introduce a new hypercall,
either that behaves in such way, or that has a flags field in order to
implement it.

> As to "unconditionally": Introducing a per-guest control is likely too
> much overhead for something that, aiui, isn't commonly used (anymore).

No, I don't think any guest I've looked at (Linux, NetBSD, FreeBSD)
use the VCPU_SSHOTTMR_future flag.

> But tying this to a command line option might make sense - engaging it
> shouldn't (hopefully) lead to misbehavior in guests properly using the
> flag, so ought to be okay to enable in a system-wide manner.

I personally don't think we should go to those lengths in order to
keep this behavior, because ignoring VCPU_SSHOTTMR_future (and thus
never returning -ENOTIME) is compatible with the current
implementation.  The Linux implementation shows that even
it's current/past user didn't know how the flag should be used anyway.

As said above, if there's a willingness to have this behavior (which
based on the current public implementations it seems it's not) it can
always be implemented as a separate hypercall.

Thanks, Roger.

