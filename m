Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8877BBBBC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 17:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613732.954479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomkA-000405-3j; Fri, 06 Oct 2023 15:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613732.954479; Fri, 06 Oct 2023 15:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomkA-0003xv-0n; Fri, 06 Oct 2023 15:27:58 +0000
Received: by outflank-mailman (input) for mailman id 613732;
 Fri, 06 Oct 2023 15:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qomk8-0003xn-KR
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 15:27:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea2f2db0-645c-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 17:27:53 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 11:27:34 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Fri, 6 Oct
 2023 15:27:32 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 15:27:32 +0000
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
X-Inumbo-ID: ea2f2db0-645c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696606073;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dG4Kxn7tnkmoBemxWUdLkfPy0GZaMaEBXnUKlRm+aJc=;
  b=SIPgKZyBUiwTsKVFjwvyUSEcNDIe6kT6NbjHFXO4Fr+3v6vwoesjh+Ao
   q9V23rlvgL0hRgaK/V53pRwA/rKKklyw2iv67hfMB5ocZconbww4iOvfd
   EWwKQnGjGRFSx1h8KB6ickgwFmZL3H9TdEx76u2wS2LeMCfnxNhwr94FB
   Q=;
X-CSE-ConnectionGUID: 4CGPXR9HTA+07bqoChkJ/Q==
X-CSE-MsgGUID: uzsKziJNSl+3r5V9DbjTng==
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 124096767
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:tuVneq76ahFghd6h8gamdwxRtHDHchMFZxGqfqrLsTDasY5as4F+v
 mMWWzuEPaveZ2rxetokbtvgoBgOu8LdzdE2SgFrrSk3Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgT4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mq
 dc3EAA3PzC/rqHun7iiTcJsheZkFZy+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOeF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx3+jCdxNSuLQGvhCnU+I5X4SKjstURjgu6SH22K0We5ZJ
 BlBksYphe1onKCxdfH/Qhm5rXisrhMaHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRmtLCXQHSR7LDSszq2PSUXKkcJYSgZQU0O5NyLiIM8lBvLSv5qFaeniduzEjb1q
 xiRpS43nKkals8M/7+y5UzAmT+qqZnPQwMv5wPYGGmi62tRY4qoZJep6B7Y8OxHJ4aaSXGOu
 XEFn46V6+VmJbGAkjacBtoEGr6B7uyAdjbbhDZHPbMs6jCs8H6LZp1L7Xd1I0IBGt0fZTbjb
 UvXuAVQzJxeJn2naelweY3ZI9su5bjtE5LiTP+8UzZVSp14dQvC8CQwY0eVhjjpiBJ1yf55P
 oqHe8GxC3pcEb5g0De9W+Ya1/ks2zw6wmTQA5v8ynxLzIajWZJccp9dWHPmUwzzxPrsTNn9m
 zqHC/a39g==
IronPort-HdrOrdr: A9a23:+6om66vfqGl01dOG3khIM71o7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: 9a23:THOrcG9qefgea0DdT1mVvxI/NfgVSCz98F6TexCyEGFCSL63DmbFrQ==
X-Talos-MUID: 9a23:JAtiqwWV9lp5nSrq/CL+nxJwNeVO2KDtU1pQr8Qqscu4MyMlbg==
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124096767"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJs4dVXfGNOFSwSdxAMbo+XND9IuA9hVB/rmy5GXkCuZJjk31JXJuA9RoU769zPbmIpB/Jq/xwc80FACHr3kCpJnQq+r6i7K/pgiyMmuT2dK5ohNTY5RXtI0+dKhJ2eVuolRBq0rIoCw5kDECmqLXu+xgPDVH75Tu1Ih+E0vTqK3l+Xx5f3ua9bz5CmUNxs5cUQsO4SWwd9H/wzKanZcZ28AhQbqrVdkebXNc4kaSrRcWmrEjHEoYl27oTgjKdMVz6/+bI2yrUOjCyfKVh7QVaMuc11An+YoV09194EPWOqOk+Si5ipz4PJaFmBlpl/HMazpi2WECAAJIqz8Tk7hDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhtiX/bDtVEhk3fOYwNRjd7Ao4M2PcFhsPYgkWH5CeE=;
 b=RP09ycyrX5BXmDUXfLbk5bqvcesTFzvzYYmdmdR5267njx87454caPSe6S8BSv7k2EFzxWCXRB6ymeAkI1+G/qFyKHHJWcyjerhuvL/bfQrq8zeznV37SIUjCpRyXaIkjDkrRNLnhnFWVrGZvOQ+fcCkWeJmTkI8fVYISA209B/O53oZJ+xQ1c0BLtag3oNUFBRZa5m+xZ6s8pdvhft7C+McQSyNYdaSh7aQLlO+nIIuLApcB0DIEqGhPe86cUasTccZDcGaSflAqb0JxiQhMTlhfiTJfi6QTT/eU8zT53l3WJOg11pXDi0KKOWCigWi9qR7T7FdOUjIDZofXi+Dhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhtiX/bDtVEhk3fOYwNRjd7Ao4M2PcFhsPYgkWH5CeE=;
 b=P6BAaUGeDTBA1+5gVnbCFmvWdCBc38dtlVNSeYCzH90kioXLylzIXOdZePZ3V3eMxa7/z1wDoBTZy3oagACAuUu+Qo2Hc2W5CN+gSqAnYLTVZh2TGsTNGTSLp+etRXmTQ3soHQxrP9DyRgIAzaPmMw7Tm22F1vAtXb9XsDRTZqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 17:27:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Julien Grall <jgrall@amazon.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a
 common Kconfig option
Message-ID: <ZSAnX3xjM91-tYbE@MacBookPdeRoger>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
X-ClientProxiedBy: LNXP265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::36) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: e951a15e-1f69-4d2f-b0af-08dbc680c25e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g3AyqFV+RD59b0tmfUTFV72Rd9T+xojLN36eczkc8yqwD49UUa7vVhCkqFJbKyqHhqqriGvaZMS5D3H+wJ3yYk5W1pVaSw9bws8OMvvzM7XNFH52uKe5G+OT9nZa4dKO5M9t1mwVgPBEQ3mahDeWz5pzTh4QrBUSqzqEoPbJS8pDkIrec0qkzwPdwzbh17vqbUsfBCN8dC6nV/H7dim2DZy5BZuwsNEz8AEd5Xxd/GakHnEICmvN7wS3TOAzXkIsDH1O0UbV2gBAnpQUs4GKtMu8t9BD8eurpdgYrcNm34yen5eeirEg3kokwES3arQBv03ffuEaYCax7Tlb3DEbOCLQ64QjhkpqRcxbBMwvNINK3t7SRZ9so4vdXJqy/12dwjVS7QyGgc5pmu30FXH9PFt1JrxAP8i8aLqiMW6JJ+G7TU4Y6LQQ8e5eeuBGNTyCx5qDuyVI8+vIEsxIEcXFafT+zXN4JvPS7ROCQpybXV5OcVj7pGT4FhXWV4MWhUX7+SEE9HQ1JZPY7kJa0BDVohkmJz7aERPllxlSYbsEMrOF5tONxW/sWfxsMjdC1vyx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6666004)(86362001)(9686003)(53546011)(41300700001)(82960400001)(6512007)(5660300002)(2906002)(4326008)(38100700002)(478600001)(6506007)(7416002)(8936002)(8676002)(54906003)(66476007)(26005)(66556008)(66946007)(316002)(6486002)(85182001)(6916009)(83380400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW01bDZSMEQ2OUROb1NUdngwZHV3MFNyQlo1NWJhSjJva3hYUDZVNkZWVEtM?=
 =?utf-8?B?eiswalY3RTU3VE1kamFGelRrK01iKzVlVzlxRFJBby9LZkVRSHN4UTFaWXl0?=
 =?utf-8?B?U2t5MGlhaDIrcW5nUWVYR1JCZUlqSXN2ZDBqK1BPdXAzc01BYnlpenBGc2Jx?=
 =?utf-8?B?aWNCaEROSCtaK0cwWlhBRU9hQW1tT2JvR09sTmRzVkN2NmVUSkIzZHg5SWRC?=
 =?utf-8?B?Nm1TMDNoeGRHcDUrZ1BDWmwrTHhOQVZ1WXlnaE5RZStCK1pDd2twYUlnRVM2?=
 =?utf-8?B?SGZ2djRGMGE4ZTBnNnl2enB0OXJlZk43b2dBbHFJd04wYThTQ3M4TFdIRDZz?=
 =?utf-8?B?NjJ4UUVRWjcvWVZTZmhKVWgzUGI1ajlCOWNEcTVscmhwSkRXc1dnaDhDUExn?=
 =?utf-8?B?bXhjRCszYWxoakxUOHlBNmlKVGRBVWllT2NqRXYvRkhsV2RqRGdZdmIweCtH?=
 =?utf-8?B?UlE2Q2dKait1L3laZWM4NkFzSkJmYzFHdGU1ajFzRjNkRmQrTFl6ZVkvbzhR?=
 =?utf-8?B?b2ZrOXdLaUFKcFRJeUxFVWFQTGlyRGtreStBR0RHNzFBSldobGRUbkhiNGR1?=
 =?utf-8?B?bkJ1ZGJ5bkt3N3RmSWpqTzBqTTEvcVRxanVNdlVER3hyUXdqU0xBMjZEZ1No?=
 =?utf-8?B?czlwd0tIcUVnVDB4WVVkOWM1S2Y2TjNoOExvMXFNLzlud1M1ZXluUHpOS3lj?=
 =?utf-8?B?M1IwcDZ6dUp1eFdMc0g4Wk83V3p0K0xuTm5vRHVick9NQVpNK2Jlc01zZVBY?=
 =?utf-8?B?Q1NaOXF1d3lTc2RDWm9hZWx6R1hVcHAxNHJYQUJDSXM3M1NtdnQ1ckxXZmdM?=
 =?utf-8?B?NUNBS3Z0ZGx6RklLYlZOMTdMUkdESTQ3ME9rRTY1NmxXU0FxVTUrL0tFZVRS?=
 =?utf-8?B?VWFoM2sxZVNwdXcxcXF2Zk1rWk5CUThNRk40cEx3UERLZW9UUHk2RFFCRzZz?=
 =?utf-8?B?RlVUMjZ3RitTY29MQUxvMExQMllISW03NFVjS1BzQWtBZFgwOVpXdXg5TlJ5?=
 =?utf-8?B?dVFWVXpPRFViSElZVWxkaFQxaFFPYkFKVVgxSkpuckhCbVQxMGZoVXlpcWR5?=
 =?utf-8?B?MENSRGhIbEowWlZjcjdwTzZFTU9VdkhLa1dTVytLSUlxVlU4NGR2RWpLbGxV?=
 =?utf-8?B?SkJaS2NwbUJQUzBUWFV0Y2dQQzNGdWdPbG05TC9FT1lhV0NJajFMNUd0MGdY?=
 =?utf-8?B?TEFyWGM2L1U0MCtWbEUxMzh2K2REMnEveUYwOHlyZWxma1Y2QTl5U3p3ZFd5?=
 =?utf-8?B?cUhjSGNhdzYzeVBuWjZmVyt1MjdWRE5tQ1VWazZSSkNycEYwL09wb2VHZ0Ri?=
 =?utf-8?B?ZFU0VmlEUERmU0NUWTVmV2J2Y0JZcGhjdUZRSDhjbmx3S1pkQndGM014ZHBt?=
 =?utf-8?B?dXFWVC9vYU1UN0swQjd5aXR4WDNtNnNJdEpOUmliN2kybnRQS2NYT1dVa1c1?=
 =?utf-8?B?eUd4V2l1Z0ExQlRGbGtrUFZhQ3BiWHo2R3FxVnFkVHRHbHZTWXF0dWdYLzl5?=
 =?utf-8?B?TXgxdTgvQXQ5aFhqVCtka3JlRkxNcWdxcDI4S1ErM0k0eVg4bmE3K0NtbFBX?=
 =?utf-8?B?WTErTG9zUWV5WWJpYmM1VkxteStEaVdEYlZBT0ZwcUxqOUNRODhpZ0tVdVIy?=
 =?utf-8?B?TlVoWTA2bnRIODVPVG1Kd1Yxb1g4d2lITlFBUURvQkI2N3lrN2RRa3lmOVg2?=
 =?utf-8?B?VG1MWHJ0SEFBL20rSzhXVVZDUytXS053SWNCNGozT3A5Tnp0VWtzQXFmb0xE?=
 =?utf-8?B?RE5SNjlSLzJrSnRUeTV4enpQUXJNYjJCYUZIRzhBYlZJSGE4d3NiUGoyaG5N?=
 =?utf-8?B?R1dlSUJwTWJCUHJMZVJ6SGI5WDlZUXRIeEVGcU8wRWpxWkdPUUtISk1lemxZ?=
 =?utf-8?B?ZWJmLzBYcUtLZHl0NzNLZ1JhY1RjRTV0NzllVHFzbnMxR0h6YitjVjRQVGxt?=
 =?utf-8?B?aURhQ2FQaTdiOVBtWVRJMDhTSEQrYmVDaEpRdVpuamRJVCszWHhmNWFib2pE?=
 =?utf-8?B?N0RGNTB0OG9Lbmp4N1BHUWRQOUxXUVhIS2MwSVU2NG0wcnlIWUNxOUlnRmk2?=
 =?utf-8?B?SEtaa0FlcEtnUTNLSzhjb1lSWTdGM21POFVybUJ1Nk1UdFhFamVwVVNjR0hU?=
 =?utf-8?B?ZUE3OXdvVlhmS0d0b2lFU1JWZ1EvSFVGYmErM3BNZ2Rsb2Z4Ni9SWjF1T3hj?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?OVE4U1JqTkNvZWxmZDhvY1J0RHJRTmxLMFRVTFZZc3lXcTZHNGJBczY5Qk1a?=
 =?utf-8?B?Um9pR0lVaHJXaHY5Z1UrbDJpdlY4SGJHa0RYSG1ZdTcvN0NTN3drNXA0cmhu?=
 =?utf-8?B?ZEEwOVBRNmFGOXNLTWxubkNmdFVQa2Z3NEVHejN5d2UrMEVxS2N2blo0VkVU?=
 =?utf-8?B?SHdwN0tVRnA5K0x6ZUtUdHVreUtzelpJWnJ4UkV3KytBcVJwNjFTUGRWQXpN?=
 =?utf-8?B?NnlmNFl6OGxpcTB0OUl5b0FGKzhobWt3TUVadHJmNWtiYWVBNHF6Y0dtWjdu?=
 =?utf-8?B?TU9WZWp2dytNYm81MXkxSVJyM2hDZk1QZlVDMURHMnNjOUZnM1NQWkZ6NHdW?=
 =?utf-8?B?ZjBpTnRpYTJUMkdURkxUWGYzNmJYbFREOEVubUZzOUZlQmpQNHUrSmI2cjQz?=
 =?utf-8?B?ZVYydmc2UVRHZWJZREhobThlbjNCeEZBZ0tEOWFnZGJoV0EzZHR3K0hMUFl4?=
 =?utf-8?B?QTM4NDhwR0dlbHg0MzJLK2hZTVpmZDViSXc4TzgwTERRTkJqNDZCRnVkNUxB?=
 =?utf-8?B?VWMwbk5PNnIySGExRmZGb2xKdTI5M2M1WUhXenBrNU02T1cyMlMwZ1dsd1dP?=
 =?utf-8?B?V21EKzRCV1Z3aUx0L1p4cFUzbnZsUXNOQ0dDVFVEMFk5Q2dVN2l6SDNXSzdi?=
 =?utf-8?B?V214cldYVHM2bGJpRE95RjJJV3FxYloyOVJNZ0hyNXhxNzhpT1FORmVqZ2Nv?=
 =?utf-8?B?QUhhYm1acXprRGZ1UlhqZ3BEb3Ircjk3dlZEM1MyZHJ6cG04TGlOcTNqL3o3?=
 =?utf-8?B?QTFHb3hpMUg2a2RQcnZUTnVuUU5hN1VBVUMrRWNWTkpZbm5yRkl2VEhjSlh1?=
 =?utf-8?B?M0tjNjZDc3hFWWd0OEpOOWdIMXdFbEw3ZzNGTlRDcWlsdVhHWUZCbmE5aW1l?=
 =?utf-8?B?bjhTZXZBYXJTRmE5V094WUMyZ3JYSnpQTTlrOUhjYVhicUZ6RTVxWVdDWVJy?=
 =?utf-8?B?MkpoREoreTF4bFp3cklHSEFrYUM2YUNMZ1N6QjJ6WDhHK3Vrc0lDWStyNDFM?=
 =?utf-8?B?bVRMcVRTRk5wMkFPYnJHZE94STVoM2VCZ0xIRWljK1RncHdpeDZ3VHM3QnNE?=
 =?utf-8?B?bnVQN2Z6ZU9oZkRtbFUxMHdBeW8rS3kxT3JJSDJtL2xMVXBtaWZnaTVjUHhq?=
 =?utf-8?B?b0VkQ21JbkRxK0k4RnBzSXRhNWIveUVNY0ZqZ28xNCs0SjFtd2hLeWhZTDBr?=
 =?utf-8?B?REdpdDZ5czZJVklGYXlkdkJCeGJ3ZXBrZmp6NzBZcXZjMC94c0dJbHdhcjJU?=
 =?utf-8?B?NkJXang2UFRwbGpENHJ0MW55L1lCYk9yYmlMYktZakYrWGVPTmtNVUJ6VHJm?=
 =?utf-8?B?NDVndy9rU3lYcml0OXZIT0NuYXlSQUR3OUw1M1kyN003QWwzeG1YRDNKeTlk?=
 =?utf-8?B?VGhELzVuWE0vMFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e951a15e-1f69-4d2f-b0af-08dbc680c25e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 15:27:32.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 024AZqLxJc1OVqH1qAZva/haEye4FML3SvAMHNzD3pSCJwUvuo/IANZlZ22Pmy00GvG810cKKzg8hCZqyqVHTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312

On Fri, Oct 06, 2023 at 04:09:19PM +0100, Julien Grall wrote:
> 
> 
> On 06/10/2023 15:44, Andrew Cooper wrote:
> > From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > 
> > Adds a new compile-time flag to allow disabling PDX compression and
> > compiles out compression-related code/data. It also shorts the pdx<->pfn
> > conversion macros and creates stubs for masking functions.
> > 
> > While at it, removes the old arch-defined CONFIG_HAS_PDX flag.  Despite the
> > illusion of choice, it was not optional.
> > 
> > There are ARM and PPC platforms with sparse RAM banks - leave compression
> > active by default there.  OTOH, there are no known production x86 systems with
> > sparse RAM banks, so disable compression.  This decision can be revisited if
> > such a platform comes along.
> 
> (Process remarks rather than the code itself)
> 
> Jan is away this week so I want to make sure this doesn't go in without him
> having a say.
> 
> While I don't particularly care about the approach taken for x86, Jan voiced
> concerned with this approach and so far I didn't see any conclusion. If
> there is any, then please point me to them.
> 
> For the record, the objections from Jan are in [1]. If we want to ignore
> them, then I think we need a vote. Possibly only from the x86 folks (?).

I would be fine in leaving the option to be selected if we knew that
such x86 systems might be feasible, but so far we have seen 0 x86
systems with sparse RAM.  That said, I don't have a strong opinion, but
the hiding on x86 seems fine to me.  Interested parties can always
forcefully select the option, and a case can be made to make it
available again on Kconfig.

I'm fine with waiting for Jan, in case he has more to add.

Thanks, Roger.

