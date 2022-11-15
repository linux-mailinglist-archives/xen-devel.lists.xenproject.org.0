Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8762946B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 10:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443835.698595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ousKV-0002RM-DI; Tue, 15 Nov 2022 09:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443835.698595; Tue, 15 Nov 2022 09:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ousKV-0002OP-A5; Tue, 15 Nov 2022 09:34:07 +0000
Received: by outflank-mailman (input) for mailman id 443835;
 Tue, 15 Nov 2022 09:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ousKS-0002OJ-RK
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 09:34:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1f070c7-64c8-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 10:34:02 +0100 (CET)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 04:33:53 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 09:33:48 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 09:33:48 +0000
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
X-Inumbo-ID: a1f070c7-64c8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668504842;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rba44OBv8le1XCLBmxa2PD5LR5wm6cl7dGMv8w1NbhE=;
  b=b4YzIZVytgR25kUxhngV592p051btc1R9EMGTfdup4Kfu/CmcgLo0p1L
   7w+t0ZoYHuU/9wo/q+dDb760bOZ5eAQwpJFZ9N5wM/02eNxbz0gMJSQlv
   Q4RjqpVX0br6/1uLvC6UBNMZFRpMWcjXkDAHqMW2N9uU+W2Ra61988sFs
   I=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 87373752
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W8RYkK4PRC33weGQfw7L8AxRtOPGchMFZxGqfqrLsTDasY5as4F+v
 jQbUGuEMv7ZY2PxL9p1PNngoxgBvMfcn9VhQFE+/HxjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS4QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 6AfGB8sUEy/2uPq+LK7csRmg9ghFZy+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOCF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwnikA91PTtVU8NZGnHiq5kE9NicPdl6Sj+GbgxGddM92f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8aIv7YYWtsADf9awZdN7fSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB0B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:sjmEP6+4on1IaiBuChRuk+G4dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBvT8LZyrnPDsqZpWAgjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.96,165,1665460800"; 
   d="scan'208";a="87373752"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmlJ0hjNJSipsC28jErdgmlv3WUSw+v7fgzxJ57E5iT3+FrBT4bT1vDB7at9rqVpnSvePZ6s8atQEzkNFftqwhhLu4Xtf1piiY4JLuOqYAudv7uiNKqwRn8oHTQQEZliU4nAXd0+6QVaOoOFNN8TZnXhNGuQ+f7fIf0yd98B1TL0tPFnc6SlFsPaKFc1mW4MwkfE3yMx4vXOdjgQYp3JiAAEDgvCzJvaL1r4ch0mMCyThRYMwJMPoWSXzudmHBNGXI9VJTMCmyoHL3roPB/0lG6jdUBQeXjxKVJL/FBF8qMn/2Mi80MffEiGX+dPmrUhe8hEZB4g28vyXTpDoOrtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4KnyjQJsRd5YmQNLDBBEZ5PEaDR0ErchjihpQI52bQ=;
 b=airLqyd3n9FHFe37qVmYR7vSSelTXd+i5Q9elNKf0KcZ9h+QyTPaxY1M4vC1pIbinBhFXjBpjfyxnoZ2ZBAe2E7YprZ3cQV7qnngSgdPFYhasbeP0+b8674Xpt/nosfvuLXLWl1s1aOYN1Qh5/Z33da7W0ElZ2F+LS4Vaj3Rnb0/auZ6l1gIBmg9v/gDD4I1LYQNYHKxfmsltd9I9/ua4XgCtuiwN4wDEGa/K6LbpKJR/1EcDePU+hZMvfbtPNHfxK0uLeoU0cEJhrxHH2ZAmJMlcVhSMRDlxV2VjpBc0Lrjj3qJeCue0gnJtXs0/ih8ZYxoxrmkO0WV0xsfl4N30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4KnyjQJsRd5YmQNLDBBEZ5PEaDR0ErchjihpQI52bQ=;
 b=M5lZbOYFPMJUvIP2HpkTEInET4ODel8VmbCVY8PHtCt3WY93sgRr37sYovaxeVHjgCJbrTFXRw6ydo4/IV9FHdiV2cS0pe6z+SWw+qd+EWznVgayyPTrX1EIYEo2seV/FluKqnCqu4fhcdr7N1d4yHWrOKphIPx9Tspzw/+Vvkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 15 Nov 2022 10:33:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Message-ID: <Y3Nc9MqE6hY2dwIM@Air-de-Roger>
References: <20221103170244.29270-1-roger.pau@citrix.com>
 <20221103170244.29270-2-roger.pau@citrix.com>
 <544896d4-f9af-a4f9-cdcb-217d27ee94c3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <544896d4-f9af-a4f9-cdcb-217d27ee94c3@citrix.com>
X-ClientProxiedBy: LO2P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 47668fb2-5272-410f-31e7-08dac6ec7e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pDcLARQ2XFBS4UicI9gKjzS3TUu7rS5aEJNF7ewz6nUDHTxMAp/Mcz81Tt9L/le5io1ED7cJEGtTQwHVWo0VRjviCYmAALeGwLEhZR2PH6cSN1Wd8GT97di1XKvB4FClsmxK6YAZpaQ1AnjKNmELuPS1dQPgdKks8vFyybgSSmcSNK7Y1QCSULIItHO6QRMTk2y0qiDIaRlrDB8IZlVbYjjMdKhlQXgxRzFPWpQZ7FobuQuePQ3HozBTljLWGWcVKRuDx5o4TqVYD+5NsbNY7aIcQOOrTU2jG3xWV3ZaZ4Uni/PnQTJEN2QMcS4pJ/6mdLmWfmgy7O0FTMYyIg7+s1r5M1VHBuUwjn2sihEOCWhUJUDevHlKNvAafAaTsye541zzeV3rx7tKD85TFFVAuCHbhZXSoyXzp5sQj7LK4xu91dsleLfYg/zqmX3LADNMWKyyxxBHX+CCXtFXnPb3lPsVRkiIjHTfDknf7cGXrBQTeJnRIvXevt7PGY/ptd4c7XA5RstC7hpWzr2+57CTFsxkvMzt9TVgaPTw0bRyiYnokKQ5ag01GBPpHpBN5hCrLe8IZtCl4kmDAmwO7+ZhtT2PXbB0nj9/C0mHDdXi9xZ5/yEPfhGu/kZydByg4dLlKBT0h5nloiJLMHHYCj8arHHNalQm9idXQS0a8sXPShohQqT1XyCtnk80MS0vv3dBvRQaRfKiZB+EMkHfCPu+gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(6486002)(66476007)(6636002)(316002)(66946007)(66556008)(33716001)(85182001)(86362001)(82960400001)(38100700002)(8676002)(6666004)(53546011)(6512007)(478600001)(186003)(9686003)(6506007)(26005)(41300700001)(2906002)(54906003)(83380400001)(4326008)(5660300002)(6862004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlBKSmY0VVRiL2Z1YnJsQk5FUkM0M3hLZCtzQjYxR3NLYS8wRDJINTlYQTgy?=
 =?utf-8?B?RFU0YkQ4U1ZUTmRxQTJiNUs3cHVkSUZjNnFtSVFhWk5Ob1I0UThsM052eWky?=
 =?utf-8?B?M3NMMk9zUDlBblpnL05lQ0ZhN1N5L1p5MGJUQWtmTTZ6S1drTGVLUXRrQ2xt?=
 =?utf-8?B?b09YMHdLUS9Qdjc5RVhLNVkxZ3NraGM3NCtUWk9hbjl6ZXJrQ2ZYTTAra1Ni?=
 =?utf-8?B?WkpCeXBMTVRTaXM2RGNiRzRES2szSFdpcldvM3huZlhpc3dBY2tIUDdEQUdy?=
 =?utf-8?B?Q1RoU1hWbjllYVpqMmxtNG9xRUZ1V0ZidkYrQmR0L1RlSEVmOHl3ZVpLdk9Z?=
 =?utf-8?B?U25aZlNWVFpWc3RkYmd1c0FmcEJYSzNCMDdPRng5YUVTWm82T3o1YlhZd3NH?=
 =?utf-8?B?bGFMNlpRd2M0OFJTaDFIU2t4eEFnVUVnMDc4S3FFK0l4elBSNXFhR0g3MlNl?=
 =?utf-8?B?WDdwS3VnQWxKZmcvTHBzQ0dIRkwrT0p0S2t6QjZHOWY2a1UyUVhNWi93OUNy?=
 =?utf-8?B?M0tUTWNKVzA2ODBzcFdaeGV0NGYwWmU1Q0ZZcDZUZHdMeFBMT1h1eWZjdFBN?=
 =?utf-8?B?VmtoaE5tYVQ2QzJ6VmtMS1oxd3lyMWhDWklzdzk2Z1pFcWxvd2tpNjU0Q3d4?=
 =?utf-8?B?M05STHZzZnRNWEYyYVZ3MU9XUUw2VGo3VE96djZBK1pLekhaMy9kTENVTGVH?=
 =?utf-8?B?MEhmV0pteGZNcHRDT2IwME5xVXByNXpWZTAxSlc5cjhidVpRT1ZNdWhidTJh?=
 =?utf-8?B?OWFXNFR4UTNHKzdmMGxXMEU1aWo1WFRqOEJSZUFJbzBwMExPeEVLSDhWRXRP?=
 =?utf-8?B?KzA0YUdjN2hQOU5RU3c3TzlmUFlMdTdKQlRYU04vblJxRlhrVXVTWm5adWJD?=
 =?utf-8?B?ck90WXJlSFAwNGJwTFd1TUFmdVJ2ck1kNG1JTUFoUCs1OWEvbHl1RnZzSVhV?=
 =?utf-8?B?ZUdRZW51bm1JM0ZoV1B2WXUrSEJSOFA0TGpGd3ZVNkkybzVaYTVKN3I3cUNP?=
 =?utf-8?B?Z3RvMjVQd0wybXlDTkdEbTlsc3E3aTQyM0pHTnZzekFqZXUwTm03aGJLT04x?=
 =?utf-8?B?RHBjUTdqTFB1ZE0rbmVnYWx0blJia0JWeXZZaHBQQmRrMUdqVXkzZy9tNWFX?=
 =?utf-8?B?azNXRnBwenVuYVp4cWtrYXhFVlc2eWwwam92QnhJNGRTdDJVVWN4TzBzbG94?=
 =?utf-8?B?eUFBb3VSbWI1UTJWTG5abWZYRG5nZEg1MTc5WWJCY3BxUWZkZGVYVjRsaXJC?=
 =?utf-8?B?R3V4d2JuWTQ5SFZqTGs0dkNnaHpxcUF1eGZLczUzZjEwQkxhQU9wcEVEdm9W?=
 =?utf-8?B?eXo1TDJjZjhwUytsM3lHZWFzRDBaMjdNTE4xWWZVWHV2aWVkdEF3U1gwTnJt?=
 =?utf-8?B?YjE1bllJdGtxRU5MRWVuZFFwQnZsTDlTRG1OcjZDVWp6SUFvN2lQWmNrTmVR?=
 =?utf-8?B?bFA5azIrTVNHaHNvTXhGcEN6bFlYMytpUGpTMFNnMnVxS3VNU2FYZmx0cFZk?=
 =?utf-8?B?Y3JUSVhNUjNKNFJDWC82TEJiVkpPQjRRYVdGM04zMVJTZGRsM21tdWlWcGRC?=
 =?utf-8?B?SGZ2K2kxaXZFd2hnUEJzdHBVNU5xcUdBTE5DQm81ZmR4NksxeFlMaE1uckNB?=
 =?utf-8?B?VU5sOGY0dm5uVmlZZElLdm1IdGYrbzNMcVhVK3NFM1hvNVBYbjJWWG1KcmVM?=
 =?utf-8?B?cmFLSVo2RlJpQ0JnOTJRVVpvazFrbGRQMUNwR1JoZGoxZmJnaGR2UU53VjVt?=
 =?utf-8?B?SU0xdEdkaU5jcnpFdjYzeUp2em1YUXBOYUNxNnNlTjBNaEIrK2xSaTlvbUhm?=
 =?utf-8?B?czJvOXRsMHZMeXdvelh4aldidklpT3FQRWhpYTUrMVMxTVFMbWY3NjVXNWo4?=
 =?utf-8?B?Q2JZRTNDcFF4cm5hRUFBUVNDNW0zTTV5TWJSOEhqdDdwZHhKcWxiRmVrT3h6?=
 =?utf-8?B?MCtNcTBqa0xRVnl0WDA2b0NmYWxmN3BZUExXb2pJT2ZNRVlCRnRKaGw5OWlt?=
 =?utf-8?B?bjh3cjJDSmI4NDM3bjcyNUF3Q3dZTURhN2MrMldBUHlVRm0vcHh6dGdqQ2hw?=
 =?utf-8?B?d0dyL3BmcitsNnZOS080eUlBVU14TEFyYUd4YlFZc0pYblRvbCtoT3NJZ3Ja?=
 =?utf-8?Q?hrfFUN1w6Lm/R1ghz1bkw7hDt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x0Yx/6asVjf4LnD7rYa++JBAEVcZolajKODZm1P1eTS8z8MNz6meXpb0VgmJIUrjHAXuj7BRnElu2V8cRj5JxF3ci6m9Cq9f5b6gLwh/NRaSZPHfeQ8H4n/A87LCuagn4mSWkVV/FCdgGop06g6ad0rHdGWyx/MuuCHkBVPJ8DGzoobe8ISIyDTl6JUigagiTqrdjjNNyyWITSjtmBn+HVIj84JNXcHjhgQhaPHRq86CQ/YvwRPnRjEw+hXQSJjIQvK8u61626xzDJ7iXLuCprLx53gQ/atD/laqt3vBnYsGtbSluXq1Pc92ATDHa9//Af8ZfFxJn0jOvkoSN6cE/TGtlxv8TNjDg7W9q2NCX/aTJAcHxsrVO+oKIQAM3TAP9ad4kZHVKbnC53is2XWgS7oMjWToGfuw2pciDo/ha7n9jmM1bcmcHXQtNKQGyetZUlZQPLPR6cpaqp7SThQLQXijFo9Xp8Ai4azDlXc4R28vu9VOsB2uFtF+4c3Z84XTYrZFQaVOAPnYtQ5bV9e4FFI5xLe9k1Y2swHVtfC5ndaeygVRji7/3O8QrOui+lPwCf04ShSpqN+ptXwQzdu/8Wf8HdEdDuAlNLE6OIHJC65mFUK2PgJlcmeUxVrwAlfkqTPBJZgN7dI9dYbnejdKzJ15i9A3KHaIO4G7DyyumLj42B6UU8kodPr/OsXuz/SUemEpW9dM2f4wEuS0jYIIjHw32FyNMUwDQZWtC1/Ry5dVYHv/IVp1iolgW6DwrV2A1daQbrlFyunyriZ5Kb4EtjGlbG+BNTk7Y7VcQ3wN/3aBCFMml640NItlsVAWeL8/uKxHd/GDcheP63CWJyG8ndAAlaGEsN5Ca1huNqZlJWPRWsMWvTjgra9fXyr8gKeCTexY+szoyEkNneB3JglgaQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47668fb2-5272-410f-31e7-08dac6ec7e60
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 09:33:48.1797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6jMCplQyzANz2aqUuFhOstEJdrVQTigQvkI87LC1DOwLKTNcJQrw78wO/WlGzt9k3+0O9dnzdb1QTypPAld0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

On Mon, Nov 14, 2022 at 09:39:50PM +0000, Andrew Cooper wrote:
> On 03/11/2022 17:02, Roger Pau Monne wrote:
> > The current logic for AMD SSBD context switches it on every
> > vm{entry,exit} if the Xen and guest selections don't match.  This is
> > expensive when not using SPEC_CTRL, and hence should be avoided as
> > much as possible.
> >
> > When SSBD is not being set from SPEC_CTRL on AMD don't context switch
> > at vm{entry,exit} and instead only context switch SSBD when switching
> > vCPUs.  This has the side effect of running Xen code with the guest
> > selection of SSBD, the documentation is updated to note this behavior.
> > Also note that then when `ssbd` is selected on the command line guest
> > SSBD selection will not have an effect, and the hypervisor will run
> > with SSBD unconditionally enabled when not using SPEC_CTRL itself.
> >
> > This fixes an issue with running C code in a GIF=0 region, that's
> > problematic when using UBSAN or other instrumentation techniques.
> 
> This paragraph needs to be at the top, because it's the reason why this
> is a blocker bug for 4.17.  Everything else is discussing why we take
> the approach we take.

Done.

> (and to be clear, it's slow even with MSR_SPEC_CTRL.  It's just that its
> a whole lot less slow than with the LS_CFG MSR.)
> 
> >
> > As a result of no longer running the code to set SSBD in a GIF=0
> > region the locking of amd_set_legacy_ssbd() can be done using normal
> > spinlocks, and some more checks can be added to assure it works as
> > intended.
> >
> > Finally it's also worth noticing that since the guest SSBD selection
> > is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
> > propagate the value to the hardware as part of handling the wrmsr.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - Fix calling set_reg unconditionally.
> >  - Fix comment.
> >  - Call amd_set_ssbd() from guest_wrmsr().
> >
> > Changes since v1:
> >  - Just check virt_spec_ctrl value != 0 on context switch.
> >  - Remove stray asm newline.
> >  - Use val in svm_set_reg().
> >  - Fix style in amd.c.
> >  - Do not clear ssbd
> > ---
> >  docs/misc/xen-command-line.pandoc | 10 +++---
> >  xen/arch/x86/cpu/amd.c            | 55 +++++++++++++++++--------------
> >  xen/arch/x86/hvm/svm/entry.S      |  6 ----
> >  xen/arch/x86/hvm/svm/svm.c        | 45 ++++++++++---------------
> >  xen/arch/x86/include/asm/amd.h    |  2 +-
> >  xen/arch/x86/msr.c                |  9 +++++
> 
> Need to patch msr.h now that the semantics of virt_spec_ctrl have changed.

Sure, will adjust the comment there.

> 
> > diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> > index 98c52d0686..05d72c6501 100644
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > <snip>
> > +void amd_set_ssbd(bool enable)
> > +{
> > +	if (opt_ssbd)
> > +		/*
> > +		 * Ignore attempts to turn off SSBD, it's hardcoded on the
> > +		 * command line.
> > +		 */
> > +		return;
> > +
> > +	if (cpu_has_virt_ssbd)
> > +		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
> > +	else if (amd_legacy_ssbd)
> > +		core_set_legacy_ssbd(enable);
> > +	else
> > +		ASSERT_UNREACHABLE();
> 
> This assert is reachable on Fam14 and older, I think.

Hm, I'm unsure how.  Calls to this function are gated on the vCPU
having virt_ssbd set in the CPUID policy, and that can only happen if
there's a way to set SSBD.

Can you elaborate on the path that you think can trigger this?

As I would think that's the path that needs fixing, rather than
removing the assert here.

> > diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> > index 1aeaabcb13..8b101d4f27 100644
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
> >  
> >      /* Resume use of ISTs now that the host TR is reinstated. */
> >      enable_each_ist(idt_tables[cpu]);
> > +
> > +    /*
> > +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> > +     * is already cleared by svm_vmexit_spec_ctrl.
> > +     */
> > +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> > +    {
> > +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> > +        amd_set_ssbd(false);
> > +    }
> >  }
> >  
> >  static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> > @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> >  
> >      if ( cpu_has_msr_tsc_aux )
> >          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> > +
> > +    /* Load SSBD if set by the guest. */
> > +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> > +    {
> > +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> > +        amd_set_ssbd(true);
> > +    }
> 
> While this functions, it's still a perf problem.  You now flip the bit
> twice when switching between vcpus with legacy SSBD.
> 
> This wouldn't be so bad if you'd also fixed the inner function to not do
> a read/modify/write on the very slow MSR, because then we'd only be
> touching it twice, not 4 times.
> 
> This isn't critical to fix for 4.17, but will need addressing in due course.

Indeed.  I know about this, but didn't consider it critical enough to
fix in the current release status.

> However, as the patch does need a respin, amd_set_ssbd() is too
> generic.  It's previous name, amd_set_legacy_ssbd(), was more
> appropriate, as it clearly highlights the fact that it's the
> non-MSR_SPEC_CTRL path.

Can adjust the function name, not a problem.

Thanks, Roger.

