Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD847D6C4C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 14:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622859.970067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdKg-0007eV-In; Wed, 25 Oct 2023 12:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622859.970067; Wed, 25 Oct 2023 12:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdKg-0007bj-F9; Wed, 25 Oct 2023 12:49:58 +0000
Received: by outflank-mailman (input) for mailman id 622859;
 Wed, 25 Oct 2023 12:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ/a=GH=citrix.com=prvs=655ba0516=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvdKe-0007bZ-Hr
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 12:49:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf37129-7334-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 14:49:52 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2023 08:49:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Wed, 25 Oct
 2023 12:49:48 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 12:49:48 +0000
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
X-Inumbo-ID: fcf37129-7334-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698238192;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y5Abu/7SMZS61eoM4wvGG6suI6eDSaoUscTRau6O5+o=;
  b=F2/hdZNrXO18NFL3gfYN5Ok4ShLeR0dOBK3hCCvyagzeHw0cOO7tBQMV
   NWw/QlXl4UJxmZf+ZYwQRHIbGN/MBi7CZF+2kri3ne/LdtsWp+xTfa8Q2
   jAzGoPc3Jn85YIjVgzsnCHA9Q923Srr0Udf5Q/H9ssj0XJAYtNU8eAR8t
   4=;
X-CSE-ConnectionGUID: h5wQRG9QQYecYqbH9KLVMw==
X-CSE-MsgGUID: 5vnxr8v4TNOAutI4ikzrwg==
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 127042156
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:FESKwKi/tKlrZsuSgsY0lO2mX161RhEKZh0ujC45NGQN5FlHY01je
 htvWzvTPfqLZ2T8LowiOom18EpS7J/Ry9BrHAQ++Hs8Hi0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyp0N8klgZmP6sS5AWDzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQYdS80VD/SvtuHzbmKU+NM1+cHEuz0adZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGzYbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhB9pOTuTlqJaGhnXO2GoDEk0ICWedhtCklm/iWtFNM
 VMbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A79y9pog210jLVow6Tv/zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:yCidda2vdy9NLRrR8d0VFQqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-Talos-CUID: =?us-ascii?q?9a23=3A0cbCCGm+41Tk9k9rg9BQ0A1ZVCnXOX2A007qDB6?=
 =?us-ascii?q?BMFdkQ4yMQ3/B24dattU7zg=3D=3D?=
X-Talos-MUID: 9a23:mgT3/QlzAxBhsUUDtY8/dno/KsF4+fSwVHwrtrwbp+jYNC9iISiS2WE=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="127042156"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBxCxXaMX8gn9GjyKXsET+toLXIZqcSBRYc/P2BADBjaE5aJbZE954pcfYBRW/uvMzZU0J83EWVx5mGUp7Tf+p9EbKyGt1pfmVnJZyFh41G5DdQ4oMGJ7QjrPGVxPnjowfgD4WfXYXnYEZoUBQ1IhTIhW3w3ukUCFCuhmBmUDZ8iKjk/QDuMZRc/IoAMut1YH9D4FWkzsTtqCG8ATv/YJTRV5ToGlqi+WQCXgTseX/7oCnQJTEcvhD7q8o+suxHHTOQWPDBYFGb0Dp2A6SD9VNM79tYNZAPFHyFIEKZxWuYLxzmZF8C2UkGn1SwlqJWnqynt5DXPl0hjMtzPaUktzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx2xwEGyJsIQoToCUDP8k777pGJN135hsODubDyMVwU=;
 b=O2lLwVcA5guiNS2Vl4iL+XlSLx0RrcObrU2/zYS1ptyiRkODQKCpMiCXlJXXgx8J+TwmqSKNIT2C8/6n+ZyWqRxlW2Zbk3hyVidTUFIHdun5+TndWqdMcYOENrMHkwaFIXF7KuPISG+ft26Z12xSXqTwmsjGpk6eA+EWkTMXVlRiGMzUwFfDrNE3YBIsQmK8vaMIwMqIRI5y5fd/t9mYkptMF3MqIhPw1Bd3Lx4z9NaSOJX2t9/YUqfpS/zMjJP2o1GWEYsut1Rww9a/hr5yhDAOtw4K9OutRKlJuQBFgYLy18l84ORCLa7oWP36TWcRS+rpk5SdlPm4KMcZQ3y1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx2xwEGyJsIQoToCUDP8k777pGJN135hsODubDyMVwU=;
 b=Gtzh0h9B5dvEuXA9mGTJe9pyQN0ByBJwMxU338WyyMs4u+KGx4qPKC8buUgLtyM0BqMaSPkdY7uwdZ//Wm+FLHh8EfVLF4tUDNj9wlrPzqgd3g4Dm1Ar1VxuLVoHMYgsBtmRdfHYhuadIxBVTNp1kaXrCQDTn7qPG3+Qbs7aTdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Oct 2023 14:49:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/7] x86: don't allow Dom0 access to port 92
Message-ID: <ZTkO6FZBlUDDKJKU@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <ba1de950-185e-8d8e-e313-aef54b18a097@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba1de950-185e-8d8e-e313-aef54b18a097@suse.com>
X-ClientProxiedBy: MR2P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b108a7-d2c9-4259-db67-08dbd558deed
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x8U8qMZQDP2nv9h0LzHJLHsnrcSu4fOsqCZWrUrZyOsYagwxDURO5sRs6XBpaINq1g13B7iaXyB5RlZyWvkkv0b4v9NpV0Gg5GtfEqfC7+PIB2s/6x+RqxG4SA/ZULcNfAo8NZfA6c8Q53fUZ5RMmHsNnoK8MsTSBTHllSJlpQhAzORxaSPrg7Ks9S/eklVa6uOw8LO7EGKtWAuAV1dswTcc1vR0rfOZ/Jw4ezDPPB5qBs3R8YfQoMw2wv1YVUOWJuTYktvY+1lcqHVWxeMOGSStH9kjqayGCnbpkKuZcGLVva+KnvPGDPJyBEeacIO1skcUgfHKW23B/EUJLlfSI+eHMwUvh9PH9vJuowwNiqN16bgk5YdR5zoLv1GG+q69k2GmDAxXkKrwyhcQmbaXYAdeu+xWOlXUovuIPY6q9ZxPhyMUr2KfIsTo2CMTfHUX/eu2HuTFqWk60O0eVHNniQ42D8gBKe9fVUYuGdKdHosq1EEvzoYZfTLoB06g6YNItRq03FhRsNolJnQtRk7totF8pgxtvOX8xyTG0efem90hghcqLYvO09nw/JjTW5uN0zZ9WORIG8ICmZgw3ZKSRutCMydDMPM4t/Vhw0PP9c8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(33716001)(38100700002)(2906002)(41300700001)(86362001)(5660300002)(85182001)(8936002)(8676002)(4326008)(6916009)(54906003)(6506007)(478600001)(82960400001)(66946007)(66556008)(316002)(66476007)(6486002)(83380400001)(6512007)(9686003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0RIcW9UUHduRWQ4SE5sOFlxU0h6UVUxa1JvcU4yS08wamhUS0dzRmlwb3NV?=
 =?utf-8?B?N3hNR2MxOU9Qa0RFQXRldTl5a0J2d2RCNGlUMThoM3l2RGhqOHpoTW1PZzk4?=
 =?utf-8?B?QjcvR1NJNGQya0NVbW5PMGxhUndZQXBCMkFaRXV5ckdVbTZjWHFBZHBVTUVs?=
 =?utf-8?B?bGM3S1lpUThvRk9nTzVBVXFIUFQ2N0lXbW0xcXNVS245TENITERSRzkvKzlQ?=
 =?utf-8?B?K0txb2pvT01zTit1dHB0QzQzbTFRSEhLUS81dkx2RkVIU3YvSTJxc3huN1lX?=
 =?utf-8?B?RlM0aEs3cHFPZzRpMHBWUEhaUXE0VmxXa3Y3N040ZHpqTWd5TkxBd3BsQUZV?=
 =?utf-8?B?V0VXcWJ5eXVoSU4vMWNpcG5JemNMV1hjZVdWTWxhbWRrRzJVQ2ZLcXU3MmV0?=
 =?utf-8?B?OGZRY1BySjV3UVVjN2xPYUd5UjJYNVJBbVZTT1VBUDJheHo3NUluRmUxYlVv?=
 =?utf-8?B?RW40QW5MMTh4TWxPUElyY09aRWtjL09oZEYrN0JKQ0YybHErRzI0dVNpTzJC?=
 =?utf-8?B?U2o3c2dhYlFDbnpQcmtzNTVHZHZIcmthZlgyR3VyOTR1QnZzUVBFSGNUVWp6?=
 =?utf-8?B?eWVWTGFYb1hEMjk4VUdWdXo4M05kMXFGZnVyRU44eUJTc0sxeThIS0RhbFBE?=
 =?utf-8?B?cjczdWxXeDRna1VBbW1scjB6Q0QxNFFoVUREMlZiZEhwcitnYnRQMDFYVEVW?=
 =?utf-8?B?ZjU5MFVteE5ITHRHcXdDNFBCS3pScGoxNE5rZ0lyVUJsSmpnbGJwdTRNVWRB?=
 =?utf-8?B?cVUzdlY1eWdXdTh0N0YwdVRYMDhEWlVuUjQ5dklFK1Q2MHNFR0RLOHAvVUw5?=
 =?utf-8?B?NGtITFpKQnNsdm9pNU9SOTN4RjRPVnNxVmdQbWZCUFhCY3lJbW9STGdmQXV5?=
 =?utf-8?B?SnRtVVFsbGpCeFUvdnlMS3ZwSkQybWVqYjEwMDd4ZHE4ZUUzSDkvUWdjeXdi?=
 =?utf-8?B?ZVJFd3RwUnV3WjJSY3V0QzJGdnR0ZWVvWUNRdXNyQnpzVmpkSXAyZ2tTcFVM?=
 =?utf-8?B?a29XWkVCWUE4bSsvWlkvcVFNWmdFR1A1SmJETUdUL0dUMjNWSjk4WTZ0VXJT?=
 =?utf-8?B?eFRzNTAwMFdnaFNrODVud2dyK25kOGtxMU1jQTdOaEJWWnRuQ05vT2d0OE15?=
 =?utf-8?B?bU1zSm1VQkF5d3NaNWExalRweFJ6OFR5OHo2c1pEcHRXWnVDUjB1N1RvUW9Q?=
 =?utf-8?B?MFNGWi8waExjUEN1N1BDREtvZmhiWEZxTDJEb2pvekpORElrRjB5WlF5czBU?=
 =?utf-8?B?RTFxZEt5WWZES3VWUGs2eWZacFBtSVBTUWJhczc5SHpSMSs3azVVZmZ3NENL?=
 =?utf-8?B?TFVqZW5WUG1nSFhDQXdtVE14Uk44ekdVTWZjQkZFTmxhc0VKdjJtMDRaQS8w?=
 =?utf-8?B?MVdmd2M1Qk9OalVlTkIwMmo1MDZoeEJiK00rT2RHRkZiT040Tjl2UWo0cHho?=
 =?utf-8?B?Q1h2THpZb3h2WVNmcWFEWmZJZ3lXNHFzR0ZHSmw1U3J5RnZsQTRUbjRKWHI5?=
 =?utf-8?B?SjdacG5NNDhqNk1ueW9qdjdLdjI4ZlhVMXdoT0toSVlvaU93V2xMSVp5dG1W?=
 =?utf-8?B?RjVhM2w0ejJuT1ZyekE2V3RQQ0NyVlpFbklhQzQ3UjRUVGI3K1h0M2RZTk9O?=
 =?utf-8?B?Y0NQT21odTZGOUpJK0dPeG14M2NUMzUvL2xlTEszNnRLZG1tVjFvemFwMXZt?=
 =?utf-8?B?ZlFBKzhCcXBiQjJBaGs2TVkycjdCUS9aRkpXdWZ1YXNrSEJkTFl4NkNjVzdr?=
 =?utf-8?B?U0s1YS9QUmFZcWZrOEM4STNwcjdHQlczUVJXYTNWTnVJMTZLR3ZNcHZ2R3BC?=
 =?utf-8?B?UnZkeGFWRUlaQlZhYmlIV1pWQ2xhWkFTN1U2NGoxOTZhSGNwczYvQ2VuZVFr?=
 =?utf-8?B?UTZvVklUT1VHWWNBVjlIS2tYL0x5cTFqSHNxUSsxUndsU2NCd1VKUzN4UWI3?=
 =?utf-8?B?OWdmVlFOTGtFblZNajg1NkFPaEl0VHVRbzFsR294UjZaN05WaHd4RHNFdTho?=
 =?utf-8?B?VDNzQmtlUDlxKzRqN2YzNXYrTForMUNvRGlCNVhvTW51TENyallLYnBOTlZC?=
 =?utf-8?B?clRNbGN4R3l3dTRMMTNIZDlPbzhWQVhRQXNtYU10T1BCNHhYQ0Y0N2JTdE85?=
 =?utf-8?B?UFpQRFFpODlPd2s5TTVCM0Y0TWgyeHFCRS81UHBGcG9BanhXZXF0MkkrdVpv?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rgnK9WbgKqctPbKY1FXQZhkjeGpnvyovojehF6rMxbSa8rTdOUPbkvdwPBb+FCNHoRedwEQcX0NWG7s8QFGGeBTTp3wvKcxvBeA37adTJb/p6ffNocROJ6X5jCdH7bMX+Nm1qYbQLao2+3iACw/Vfqy3RYVvrguGu9IoWhwLt6hKoRaLkVDMqHEhB++Yut9iZRXSJbuYG16txLSlNPb0bXFEmAWKji2DsUCTwRI9Qkyet3BJ6NOE4U5Z021vvcp7K17dCLviMuM9LU0cg+ts7HJcMfsOGtt+kcVvBiPbTnft1bvb2Rx3vIbEpsPmRBZQuRuDpn/SSow7FFA4sYlccHLtxmYpMxrGyGOzGp6LMLYqNKPKuWvhaWwJd/+cnBsvcP4eoOJR2nKhRlUStn4Xf3hXlLWZXK+B7k9qn2R0fEjEtAfEIe2KcjOlbnZlzAMxIEGlnGMv0m14S8Lb54xFCJk60vGcOQPJjfn7iABJVji14pmS26OY8ZGRvpBYcxTn1RgvqtDZTZRFiQxT4ayf4o3tzwBLPsmOe2n9qpRlbM9z6iRLQ419nFlIPcdhGB7MKkq56aKLCZT/d+cX2yajjjJbXtA3/eTbIYamt8Y6hh0KuctogGUXeAU6RJlhkGhnA8NMr33ashrQlD8lBXlUWFPdO3geCKiuj4ssZnxzBMrtC3+FqN7B+OiUaBGbITu88NNn3dxFGMFf6qqOLlZRU3uV4yw6Z2sNu38k58N+K/H/M80qTdsLKCiS2Gw2yYYuw9SfKkzKTiS90rnDOkpGnV7cE6wK9NJOKE7UAEVG+Qkh4IrPrzoT/SqFkSldc3fBZJmfO0Svn2FBEQu0tFQI2w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b108a7-d2c9-4259-db67-08dbd558deed
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 12:49:47.9049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCiLOil1I6FlJeuRLkPGRUbjW/ZTayaQ5RRpyIT2SwuSVDq1ksa/+ZFxTM8eINBudUreAUTczyxwUC+/ubHsNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944

On Thu, May 11, 2023 at 02:05:45PM +0200, Jan Beulich wrote:
> Somewhat like port CF9 this may have a bit controlling the CPU's INIT#
> signal, and it also may have a bit involved in the driving of A20M#.
> Neither of these - just like CF9 - we want to allow Dom0 to drive.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I'm kind of concerned that such ports might be used for other stuff
not described in the specifications I'm looking at, I guess we will
find out.

> 
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -500,6 +500,10 @@ int __init dom0_setup_permissions(struct
>      rc |= ioports_deny_access(d, 0x40, 0x43);
>      /* PIT Channel 2 / PC Speaker Control. */
>      rc |= ioports_deny_access(d, 0x61, 0x61);
> +
> +    /* INIT# and alternative A20M# control. */
> +    rc |= ioports_deny_access(d, 0x92, 0x92);

I do wonder whether it would make sense to create an array of [start,
end] IO ports to deny access to, so that we could loop over them and
code a single call to ioports_deny_access().  Maybe that's over
engineering it.

Thanks, Roger.

