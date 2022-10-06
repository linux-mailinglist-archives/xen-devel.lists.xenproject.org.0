Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED95F6317
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 10:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416751.661422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMdK-0005M8-Ic; Thu, 06 Oct 2022 08:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416751.661422; Thu, 06 Oct 2022 08:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMdK-0005KK-Fr; Thu, 06 Oct 2022 08:53:34 +0000
Received: by outflank-mailman (input) for mailman id 416751;
 Thu, 06 Oct 2022 08:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xibJ=2H=citrix.com=prvs=271cd1fce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ogMdJ-0005KE-Le
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 08:53:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a088bd5-4554-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 10:53:32 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2022 04:53:26 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6674.namprd03.prod.outlook.com (2603:10b6:a03:396::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 08:53:24 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 08:53:24 +0000
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
X-Inumbo-ID: 5a088bd5-4554-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665046412;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=w6yUruDbyoiQqSyi+h15/Gk2uluMuL54i0fQXnQNrzo=;
  b=VEZgYppLV/A26mJs2Vnecf3EnDszxcRx+/yVG6CP1mmJ3+Kx9KoaHkh5
   AvEbdvgDCh2WeVu+m5HC9SStMk5GKGb2b3ttNILTqtNtghsT5ppsy13O3
   cuPDVNalD1IRGWwNY20faLN69uAd1rVxLkoA4wsil35CYCjHYWo9HFzh7
   E=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 81218519
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UgR9Yqg7AmLZxBudx/1YhqiXX1619REKZh0ujC45NGQN5FlHY01je
 htvDzqFaKmLY2Pze9p1bNyxoE1X78OAyodhHVE/+HtjQngb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmPa4T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVlE5
 d8ndGgrUhC41svunoipFLJRlMt2eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1raVxHOmAdN6+LuQ6KVVmF+V7FMvBzYZRUeU+tyLhk+YRIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0AWmbIXisIa0rShylrOiTmsu5vhQxY840PcWWfNxgl0fpK/boqkr13S9+9dLZ2xR0OE+
 nMDnqC2zO0IF4DLqyWLT80EBrTv7PGAWAAwmnZqFpglsjiopXiqeNkJ5CkkfRgzdMEZZTXuf
 Unf/xtL44NeN2eraqkxZJ+tD8Mtzu7rEtGNuu3oU+eiq6NZLGevlByCr2bJt4wxuCDASZ0CB
 Ko=
IronPort-HdrOrdr: A9a23:wv4qH6zD6gVbSpGuYeBKKrPxTOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NToj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qn5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPQi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gmMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6UxR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r4NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx98R6vXM7zP4HR3yGGPfI3kNg6diP22pqIJ9oEUfYCbcBFqEzsV4o6dS/Z2OLyoZx
 /8AuMTPxbZFxqfJW945XyBZ3BsEwhubCQ0gKdOZ7vcmLO9FqTa8srmTd30GJ3BVR4ZZ0KXOA
 pxYNG0HrQM0nyW
X-IronPort-AV: E=Sophos;i="5.95,163,1661832000"; 
   d="scan'208";a="81218519"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ5XF0+kJNe1/HCBJFelN2tF8BjZgPOZocybNYD3AyV2L5FaN87/ADj8uEUHXV9UTUG8CDUtGDDGrP8e28we6QCZu1GkXF/6NHsI5C1igfBgYI5pE7+zC0ikoDJqYsE7ABYRA3waqcZDK044XuBxgssWNX4LC8zzCp98KVeIRMEhVU9mz7PoZtaskfYRu3k6W1hu7kyyQhr5rtqHPW3ePbsE14Io6z+wKy46Rgk8d7QXAiqBPd/kCtRN1NzSclBYNhxas7nB9kvwHtxFye6lw03OM/0iAGIMKbxg99pOLjYdeP9H4WdoYGp3/tS+NkE976kaBJ4aLrynMVIibMoNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCEX1HvU2Ga04RZAVyxcK1anltVFxueHrwIcEl/AZOw=;
 b=Rde8T69qpyEo0v5jRlxFalnY/I6A7LNY1667xrlIWQEUNmbarC/sVJTDPgDUihOHjFr9fbStavUWJ1/lS9uCM0vhmtAvr9I7rjefr8TUNpjxunv7nsC/YYeBYcF5FgHTw2eAf/f5SeWdcDoTeNV8PMm1zfv7w5LiN8aak+tPb56rZj3ycSzx3sm8MPzOcTR2AJJzM5w+79814eErKPivRyLZwDfOpTjz8WQ545M+p7eXLG2ACZoQDDXBazlNQ9zKc10tG8MK18+M061wbGyKptxo0cQUOmRWUhHE2qPjzQyvkHSjQQR2zWYD30SHqiqv2CKdtP25qZa8JHrW9QK6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCEX1HvU2Ga04RZAVyxcK1anltVFxueHrwIcEl/AZOw=;
 b=xI3SsdCFkbQ+PFzxP506nDvVNCz7yRhd91K8TNwYov3iqZIEUsB4qA+SCgV70707Eb76O/GWO6M0Avpx+oHoCH304zvp4AAJloQnnymb9LtQWAIsoRrCdzDaFhRYrE9FtkRngv82KsqjIEtc/teZD2JF3Dh+UwoUuO27ITBrTOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 6 Oct 2022 10:53:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v2][4.17] EFI: don't convert memory marked for runtime
 use to ordinary RAM
Message-ID: <Yz6XgVMd/a/XU7jr@Air-de-Roger>
References: <ca557de7-88e9-bf2b-0f5e-6a42dca3f9f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca557de7-88e9-bf2b-0f5e-6a42dca3f9f7@suse.com>
X-ClientProxiedBy: BN0PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:408:ea::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f47a92-a89d-48fd-8ab8-08daa7783a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eobTxmIZYhMxySdBLkf/PLY6Plle4AbX0ARjP99V37tgoHAFDGQZrCsLZ9aayKHfjYuTJ2X1rkq/0p3KnEu/bveB2zWdNRRuZdEzDOR5L6Y722iDmyNJ7LwU9CEH0ck67COXRIFdTuqoKnlZ057lgsAtulrA29ZgniuGGZBpTjLyn2UfDYSlgyV4oqBubeJ/o9cAXWRW+Tz5CaEin7m70lOdUPodRSsizLNoZIZKxNJXP+Ocs+rQarrzESLzCVZwVQdYrlwxEx1UGgjfj3M1bObF8Adqq6RwIsPp1K8tuR27X0FA1vEO1u31x8OR09d6dWqthfXo6lMPJygTedqfXoecgtrQRBRoHJYXmFLwlgK+hcc+koYEVcsn11R7KPJCyytDteAxZHxIWcuT7sBr5d+LvHNCzR913pSIx7UkmXfRUi/vFWPLXRbEU+FpFa8UODPqd2srHEAO4x7H9pJU5JxUZzy8k69w5u1qcotXMYXqjQA+JKq/hVMLDwLawAVCt+uzdZ5bD6SGOPPu10Qt+42HkjaIUcdz8FWlJBNTNIqgl+zTMau8BwuJ3k+dQZji3RcNqE++Go9viVyRCyfwnmyk1aDNcwapHkmcxA6+2+I7o7o7HKf1NauXC2I3xIzQo7bH1j9x7wUU1haz7FJQ1XJxT9Z7ySEK5digXGVmNImhezs2beDduwvHM9/Cdk00xKhe8a4/Puv/5PfXeYDnTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(4326008)(41300700001)(85182001)(478600001)(8676002)(66476007)(2906002)(66556008)(66946007)(316002)(6916009)(6486002)(38100700002)(83380400001)(86362001)(82960400001)(54906003)(26005)(6512007)(9686003)(33716001)(6666004)(6506007)(186003)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXdUZWZZME85QjY3N3FZSzd0ZjBUZWtmbWh2ZnY2RDBWTjNxUUdOeVY3QjBq?=
 =?utf-8?B?eXhTMGplZFN3S3ZuTjNaeXpYVy9RbFZPU1BtNnczNVBKRzFmTHdwbG5GNXpG?=
 =?utf-8?B?T2ZCdlhyYW9tOW9JYXZYOHhNU29RRFBsNmNzeTlUSFR3ZVlvaXhIQlI2NzRU?=
 =?utf-8?B?ZGZMZHp4NGowNnEzWHhDMmxQMmRxMlh6TUpyb3ppbVB5YU5TY1NUS1pFbkY2?=
 =?utf-8?B?OHo5MWNUNkRENHF0ejREYnpMaW05UGFYWFVqZVltb1hMUXFGTVJqNWtSVFBG?=
 =?utf-8?B?VkpsdmpCTnE5L3RqMVhhcEdpMElpVG1UYkV3dzBzR1JIS2w4K3hLRzRKQW5Y?=
 =?utf-8?B?ZW1mdUtvTUxCcE9UV0xWVU1Jc3JuNkxsZ0dBckdiRkM2UUNpWDlEamNOQUxZ?=
 =?utf-8?B?ejFxNkptM2NpV2ZGNEl5MkZQMlhDWExqLzBleUhpcWl0cTVQVUgvRDYwOFV1?=
 =?utf-8?B?UTVPbWFZRTk0OHRBbWNQeFR5QlhJT3REQUpNYWlWM2VXL0JPSm4rZ21adTBL?=
 =?utf-8?B?QjFRejVxM2FENDd4cEJPWWdNT2tkRUU0RGl5alpCV2g5ditqV1FrT0lIaE8r?=
 =?utf-8?B?TlpEZXNCKzMrTFA4SW93c0IvOTVTVWRQVStCVnRsTzNUbjdUaDd3aVRuMmdw?=
 =?utf-8?B?YlFoeWwrc2tRK1laOC9sY3VlN2tEbnFJOW14TkExUEdWY3grUkJhTVZWUTNV?=
 =?utf-8?B?ekU5RHo2SXJrWEgxQm95Mk0yRWxnNVBEQmJEMGZKVnZwdkZhbUNhMDRPSXFY?=
 =?utf-8?B?clNHbmdlRUg0c1VmellKL2p3bDFLejJURVVQeUF5VzQwU2VEQi9pdkMvME1w?=
 =?utf-8?B?ZFNQSzl1THZXVlhBQ2ZpTXZMSVJXdWNhYVRhNjlsYkVtWGhKcW9tT0l6dVp1?=
 =?utf-8?B?TTFQdzE3Q0RGOUh1LzVnaTNGcWsxYnNWeVhWSXBGMzV5bklaaHlma1pTdnFq?=
 =?utf-8?B?TVdwOUtCYjBlVkc0bmZkeXhXclJtSlJMUUFYaXZpVGQxc1ZjUitGdVVFRFlW?=
 =?utf-8?B?QmluKzhldkE2dWdtc2RaZTlBQ0x5Tmp6M1Fsbm5wUUhqNE5hSVlLbzl0UnZn?=
 =?utf-8?B?V0FjckpBcHl6MXNuQ2ZqRXQ5a1ZIODZLVGVjOGlNMXIwRGJ2ZW1PazcrTWQ0?=
 =?utf-8?B?QUdiN2tDbndKWTBGOGxzNm43UDhKSVA1SEJYNzlHOFc5YjFQN1V1cy9jYXJr?=
 =?utf-8?B?VjBaUllQcXFha2Y1bUhvVUxtMkhZTUxPR2hGNWlHeERXWENKcDBqd1BXTXMv?=
 =?utf-8?B?WlluUGR6MWRaRjhpM1l3TlltcEJWL1d3SnlJWmtWZmxVOVBrbEtsZDMrOUJQ?=
 =?utf-8?B?cXhSM3BuU1hzUkZFdEpUODhtTWw4a1BlU096MDhrRkdSQzh6cjR1NkJucXZt?=
 =?utf-8?B?QzYwb1cvbnR2RWFsM2ZicFZKK2pKVlg4ZGdYNjQ1OG54TVVhWWJDam42d1Uw?=
 =?utf-8?B?VkdLakhPUnNIemlkU0F2bGM0ZHVIRUQ4TS9tSXhkazZQVmY2UEVyNkVwWG94?=
 =?utf-8?B?VjlVL3hSclliM1hPRW8zNUwrdEUyYlFyeEhBV1VMWFQ1Z1dqdERUV3JOeFFi?=
 =?utf-8?B?SGE2L3JML0FVWFVoZzhPUlVJMmk1VVhoaUU2TFU5RnVNOGxuSGRWOUpHQnpp?=
 =?utf-8?B?L2kvMWwxRjRVajRQR21OVUQzQis0dTZxRzFodDRiNGhDN1FiQURpUlVxS0dm?=
 =?utf-8?B?ZDhMN1R1ODkrcXVvWm5QOWxhZ3JJRlB6RlhscXJGY25wZGFETlo5MHk2NzhR?=
 =?utf-8?B?Y3lEbHM3dWcxVlU1YitaZitZZk5RUldaZnhyOXkrb3NQS3lIZUlNcy9ZVk51?=
 =?utf-8?B?TGlZd1RKK3NOS0RPUUlEa3JtOUJZQzVvckVPMDNMWkVIVVhkNjNUUW9VWjA3?=
 =?utf-8?B?S0drUTFNejl5UFRyaEZUbDVFZU10M0Raa20vU1hqS0RlQ3FmMENCNGJJQWJH?=
 =?utf-8?B?Y2U1KzBmNkJVVUgxUlp0UkdYcHAvakI4TzRCL3RxRlJaWW4yeDFkQVMyb0Zs?=
 =?utf-8?B?dDQ2Nys3Z3JlUE4zc0hGSlpicU9Td0Qzd3pUNHRIZm1jcmYzcTk0dk9WUHFq?=
 =?utf-8?B?d0RLU0d0VnYwVisvc2dCUXZYcTZKaGlKSXNLUVo0cGFvbWVUNytOZmhaYU9a?=
 =?utf-8?B?eEVjOUo1RVlEM25uZGE0cFBzdjZzQ3JNZlRTTC95RDZ0TmFXSDh0WTRQU29v?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UW9WaXlrN09XdGpJdEZqOWt1Mk54bW1waCt1K0l0c3VPREhLYyt4RHIvMUhI?=
 =?utf-8?B?TndyZFdwNkFPYkhVQkpIL3RVQkhNV0c2NHNBQlNXQW9UeHhERE9uZ3FCeThI?=
 =?utf-8?B?U08yQ1Z1TlRqRkVzZFl6dmhCeUc3SGd3SS9XVk1PWlRjRGV4bEVaeVlPZzQz?=
 =?utf-8?B?WEUrQ0pOck9TcUwzNVVKd1phMTRNOW94MFVVaU42UDZDb0w4TEE3cW1RTk56?=
 =?utf-8?B?aVgvaDgzdjVWZGVZbU9mUWNUeUg5WWFPcTlEeUJLK1IvN1BDRkFVSzU1Y2tG?=
 =?utf-8?B?d3k4aWpmUGxHb1lMWU5HMk1rTUc3VnExNVpkSmpTNHFaY1ZuTzBlcG4reFRs?=
 =?utf-8?B?U2hyZUdHajB6Z256N2ZFaGdocjBGUXBnaXU5dGlqQTI0ZzdNaDFPbU1HNlBv?=
 =?utf-8?B?RitXWlBleHdFQVphbHA3Y0Zlalg1QldUZktKb0ZURzdMMnhiejlxMkRCRWV2?=
 =?utf-8?B?aUxEcHlhcmRNVFFqSURWQjN0ejJjbW1yS3BiZkVpTzRXUDdiQmg3OVQxV3VU?=
 =?utf-8?B?d2NQQzVHRDlsckdtMHlmRS9ZS1V5WEVRRXFhY1Y3SFQyM2pvNDdMSXpWZXBy?=
 =?utf-8?B?WEpMR1E2ZDF2emRoUkdmSDlOZFBqa2dVaVFBYUU5eXBYcEZSalp4TG00TTlQ?=
 =?utf-8?B?bUNrOURsL2xCMUhRcmVnbnR1TFhBOGUzV3psenlPcllyS2Y4THBhVnhhSHlX?=
 =?utf-8?B?ejZoRmtVNUZWZEtBbWFSTEFlR00zYlo5MDRORVEwYXMxayt1WUNkdlZER1hT?=
 =?utf-8?B?NUpOUGRZNTdmNGpqZnB2U0hqcDZuTkVnQUY0K2FXV2s2cFZHL1BXR3VVWnFC?=
 =?utf-8?B?U3lGTlpmWXVXTkVIWWJZMS9tR3NiY2liZ1RLbEpmK2VJSTFtK2xVSlpNSk4v?=
 =?utf-8?B?KzlmVGdTMlVPY3pMSlFxOFErMFVNdU9OelV4SnBrVzhiT2NKSGsxdDJNMTVH?=
 =?utf-8?B?K1Q2WlV2NHRBcVZnSjJtOGpUMW1mbUhzcVJNRnNWNXJBMFFPRHp6ZU9YbWps?=
 =?utf-8?B?c2dHMHE2dHE0WGQyQTk5MGcrUG1OR0I4SUxCZFVQdFVQbGwxWWxPcHM2L2J1?=
 =?utf-8?B?dlpzUXNWdFhHZ0h0YkVjK2dIS1AraU5OZ2tmdmlEYnpYd0Y3dTdSSXEzVVZy?=
 =?utf-8?B?c3ZlSlpXZThQMVRaeEpIeXMxL29wbGZ5L3JRck0rZzB1QUFSYTdKeHQ5NGlM?=
 =?utf-8?B?aWk2ZXNQVTVuTUl5SVVYcXFSZG1OZjFpcmo1ai9JMnh5WFdreXp2VkhwQ1Uy?=
 =?utf-8?Q?Xt45sgh7csJnRSj?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f47a92-a89d-48fd-8ab8-08daa7783a57
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 08:53:24.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wg1L9fCgz+tHKIPTgnBn2Ls9+5qzVk98LohliR4132rTuU0KeVn5F/ZGXQ5oamhepbQ5dg5ZY3CZ0dK/hOigIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6674

On Thu, Oct 06, 2022 at 10:40:56AM +0200, Jan Beulich wrote:
> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> higher priority than the type of the range. To avoid accessing memory at
> runtime which was re-used for other purposes, make
> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> E820_ACPI memory there (and it would be a bug if the Dom0 kernel tried
> to do so, bypassing Xen's memory management), hence that type's handling

Strictly speaking I don't think dom0 needs to bypass Xen's memory
management, just overwriting the page would be bad enough for runtime
services to not work correctly I would think.

> can be left alone.
> 
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Fixes: facac0af87ef ("x86-64: EFI runtime code")
> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> # Arm
> Tested-By: Luca Fancellu <luca.fancellu@arm.com> # Arm
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

