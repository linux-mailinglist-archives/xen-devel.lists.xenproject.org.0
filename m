Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A26CBFD8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515781.798944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8pF-0000u4-0z; Tue, 28 Mar 2023 12:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515781.798944; Tue, 28 Mar 2023 12:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8pE-0000qf-Tt; Tue, 28 Mar 2023 12:53:20 +0000
Received: by outflank-mailman (input) for mailman id 515781;
 Tue, 28 Mar 2023 12:53:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ph8pD-0000Kr-FB
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:53:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8118cc51-cd67-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 14:53:16 +0200 (CEST)
Received: from mail-mw2nam04lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 08:52:56 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 12:52:54 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 12:52:54 +0000
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
X-Inumbo-ID: 8118cc51-cd67-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680007997;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iSutf6mn2bGMxfawWt4vgnTDvLfNNECzwmQEEOTyoNU=;
  b=OyCM7oK4A+wnCQY030RUyltgBXnaSiLGxTnlU62kQH6gB199RxuM9Adq
   FhsEpcz+K1Bxgc2I51ZNckMathbjyEAqhSSNVRoSkWIbB/Du3xdPXh3Nn
   9aaULx/eyxRxbpQxavAq/peFjxFJYhCVxbSKeQWbbWkJZkTixf6n8Erpl
   g=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 102137738
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WYxKZKy0tajuoM7ulQt6t+fqxyrEfRIJ4+MujC+fZmUNrF6WrkUDz
 GcXCjuHa/eJZDDwe9twYImy9BsB7MOEzodrTVNvqiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6AT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXNT3
 NNbdW8UVR283/zu76CKbLRilu12eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eVxHikB9lCfFG+3tdMrAbU7DM+NEQ5bn+Bq6OEslPves0Kf
 iT4/QJr98De7neDS9DnWhSirX2svxgCWsFRGek39AGMzKXP5w+TQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAXJGkOfz4ZTiMK5tDipMc4iRenZtRpHbOxj9b1MSrt2
 D3Mpy87750MieYb2qP9+krI6w9AvbDMRw8xowDIBGSs61slYJb/PtP2r1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb5FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:Lcvdoqs8xag8A6tc6AtE0YFl7skDsdV00zEX/kB9WHVpmszxrb
 HJoB1773/JYVMqM03I9urgBEDtewK4yXcX2/hpAV7BZnifhILAFugLguXfKlXbalbDH4VmpM
 NdmsZFebrNJGk/oPzWpC+fOL8brOVv9prDuc7ui01Ad0VBTYZOzylEMS6nMmtQADNrOPMCZf
 mhz/sCqDqkdW4Wfcigb0NpY8HIu8fXkpbrej4qbiRXijWzsQ==
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="102137738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7Q/4DgHneU/O+WZnRAebAjxWkn+yUO9Cn9/LrKFyuaTDAQuAm9VJXw4QwpeEtCWYiY4JIzj2bRtUHDgvDiJQSgjpy1ny+vhpPOVtSewgqkHn7oDUmMBZng5fz3Nq9KDWgtKvwwTvNCDcaZgyZc/2qTegknIWvRIMPuGnOi1zxr4NI03wABmaRcIqBzxURZs6gVspNWPy3/4kx1sDa3Eo2ezcSmaFReiVyxMiSeNndPuvTeHmt0ScruXJhM92rCPVXWxvm8x4HUEgXaqnJNuGHkbPXFl/gZaDZzmY2m1clcXoxiQ5AqvYXzzf1w3ylkoosXxw+VPuCcRXzHlO7Mtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXuaqZu+wMTtK+tt2wvlsx1Z1QNSMamgJcJfv5Wg9M4=;
 b=OHLj3kayBgcmms6hMGUS92Sfxs94en7RZhWyseHotpRSTMf0pXXnB8OtnzIMzcZ5d+5yeXPUGdE/BXzVZBlsnJ6YUqA++phf13GuOl3bfc6IQJRGa+4/AxUE8YJ9N7yzDjeDmYTelZX8UJOeQZyJF4w46gbnm0moumU+i5h5sxy7b/MShcsNM/HeKiuTFqjLAn8IUXyvHsFx9wawRRix4NWKJGpNL4l6XQ2LpHFgKhSGod6YM4EZp3sE9zCPWKmZQFavB8ySE8YPvmZCGecfI6jDAEUMb/Xp9pLCLOCJ93qasOgyD452B/F44vfOXuhYKs9iFy+fXUKCQNT94pktvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXuaqZu+wMTtK+tt2wvlsx1Z1QNSMamgJcJfv5Wg9M4=;
 b=Myu5gN568ZSLW7vFjLmM9kueAjYVYCX7AvTUe2SFtGENBK61INKorX1Q/smInkXDZVYyrxba5yCz22lfM7NqYX/qxGn4jHEPNJyCMijT5E3nBkBw+yfvviTPNLLLn2k8lMUTfsiFHZX9zT934GOX40jnu40Pw65yBJ8xfwykRB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 14:52:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Message-ID: <ZCLjH5bK9Ue9xrzu@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger>
 <ZCLX1qD/FmbF5ulu@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCLX1qD/FmbF5ulu@mail-itl>
X-ClientProxiedBy: LO4P123CA0144.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 400f5824-c28b-44f0-f42f-08db2f8b58df
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vbmKp/DhEMBa6qPRs/gIea5KTsZQQ4i2/I2NlRMmwscQoaR1g+nDYGGR1fnopMR9Mm/Wt42KoAnrIOonvybG/7HDxaphxtFJJNyuDPuW+4Tl4qq6QjxftY5yLhpIbanQhQUKYW+eAWV1kvRkgwJoQFiwogRcnDFC6IPNqeacCFs2yieuWuZVppbW9cWTh2aRexlUH5JBDoVdn6Q+gy8kDU9bOqX+vBprIB9CUrb8P4aLpCiQK0PKPOqM2MMZaEYW1irScjctO3DoykFPaTIkHgqa9clzd4f8yRP7ejdjIWKfGzubUgh+vV790imsRDYjtUdf9IZQRyHAPzcWFY38A7sjRUJCts+kcjNAwgG938nlH6isN59xKKd+swa2FK/jFb+didtEUOM0QbNYAGyU8oBnbhPfRogJJCGI3NboXQ+GO2Y9CXBnrsjeyCA618++UGyHfos8PTR2qliGdR7ZzIBMvz0rj1H+a4OzRoUlAiwsGYjzscoJsxGb9jx6RBfnuu7yIla26BRjxFKgvO88Lswa9zl54rLOZ9fvJIXRtcFprRQaeQGGpt7zC02ZM6Xp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(6486002)(4326008)(66476007)(6916009)(8676002)(66946007)(66556008)(41300700001)(82960400001)(85182001)(2906002)(33716001)(86362001)(5660300002)(8936002)(38100700002)(478600001)(316002)(54906003)(6506007)(6512007)(26005)(9686003)(186003)(6666004)(83380400001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE9qOHpWUmdRdmJhOWNSV1VvRy9xcWZQdnBOZnhuRE9HRFZrbTdqazNkVFZl?=
 =?utf-8?B?UzVDODBFN283U2ZJMkpxNVVyM3ROdngwR1d6dDB4WjJuaWhQLzM1YVJWR0pH?=
 =?utf-8?B?R1NVSHEyd3IrRElYOFEvSUQ5T2ZJdmRZa0V5ZjE0VU9JRmYvZURMUVZySDZ3?=
 =?utf-8?B?VjVHekNVTkdTSUpJN1g2eG5RYXcwODJVVGZvTWUwQkdZVEd3ckhBWWpSWHJK?=
 =?utf-8?B?SElzclRGaGVmNjY2VnNDSVZtZFJGNitkTTFJYUY0MTVnTkR2T2x4L00yNDZF?=
 =?utf-8?B?WTFBd3h2RDR5eHUzTEk1TmFuRUdHd0tPOFpuUTBWSzJoY3VBSzhSdnFsSjF3?=
 =?utf-8?B?b3pWNjF3QnpnZW9JMVM5K0lXUU9nb1NobHlxMXNrM21CcjllNDljOVR2T1BL?=
 =?utf-8?B?Zk9BV0tXMUxXZHpYa0NWdkV5TFZSOUNHTVVhN0JrZXBlbzJEbTRrU1VZeHZt?=
 =?utf-8?B?c1FvblQrcjNjME9VZHZjeEI1Wk9OSDVuQUcxZkNyVXZOMThFZEcvWVl0Wlpv?=
 =?utf-8?B?YkEyaGs4Z0QwWlh6bEdWaHZ1dG13aDdKdWJBdGQ5VWpBYVJwcmxHZW1PRVI5?=
 =?utf-8?B?aklJNlZ2T2Y1QjdkRm9VaDJVSGd0SWNab00xWithVy9la2M4eGQzcGUwMFVa?=
 =?utf-8?B?bkJab3FWTmJIQ3VUejZ2M29makJXaDFGdmtGc1dheU9YS0tTU2VHaTVRakN2?=
 =?utf-8?B?c2wwY1RBRzkwbzVYeDRvd1dxM0VyemdxTkJzcktselhORDNPaG5Sd3ZqRUxp?=
 =?utf-8?B?TklHVXczVHRCaXg1RldRTFNVRjRTMENmRDBqM3NsZHJEcEZURy9iQlY4ajBC?=
 =?utf-8?B?TnBsT2VwdnFEbDM5YWZTd3E5ZE8ySmRsMnVnTCtLSDZrald4YVVxbnZ0VWxo?=
 =?utf-8?B?NVgvaEw5L0w2OVRUaUwrUkpSang4dXFjcUliTklyQmhJTWVtRUxhWWhMYUZo?=
 =?utf-8?B?U1R4T2wzU2JvR1YzY09DZHE4YWFGZ1dxTEo5T0dENENackozZncweUEzbTdZ?=
 =?utf-8?B?dnprUjRrZW1YZEkrUEVETmZRY3BnTkhDeWtRaWhrZHJSa0QzM3Y0azljanZm?=
 =?utf-8?B?ZERTeHNpL1JTNjZGOUlCNkxOMGtST0VQNlJxZFR6NmZZVFlkTGZaZFRSR0lm?=
 =?utf-8?B?Vk1Id0hCblRtWXZseEVybThiVHRGMklKeHAwTHJzZE4xeUQ1V0xoS1Z4ZUhE?=
 =?utf-8?B?cnBmcll1V3ZuRXVjTHlZYTJmcnhYZWFIMTFqbFBYSDlIeEZOQkF3OVZBQ3FZ?=
 =?utf-8?B?VGtkZkNzRDNSVEJwYTlmVWxuRUFIUlgrOGhoSkt0VE1UZTdYakVXbkdPbCtq?=
 =?utf-8?B?L0c2WVBqUStFYnVFTEl6VkNmQzJUd09uaHhIZEhlMzVhaUJvWm1UWjBOL0w3?=
 =?utf-8?B?dWdXeVFnQnpCTDhOb29DeWYvdkxpTWloenV2L3JJYlh4eHovQXpmOHphT0Vi?=
 =?utf-8?B?Q1cvSEpyWjl0T0x3U1gyOS9qMkllK25kNm5MRkRNZ25UZDBXTHpSUFd4eXE0?=
 =?utf-8?B?WVVvenQ5M3hLRngxZVdsNzBXL3JNdXVvK2lhdHM5R1Bxb2FpNTBNTVZpYjAx?=
 =?utf-8?B?SVBUd0JUOHdnQ3NKK2JMYWE0OGZ5RmhNSzMzRDVyY3NGb2M4eTVWb29FWFlG?=
 =?utf-8?B?QnExNjZFbzh5VmVhYVZERlF1Y1hTU0xkK09GQU0vRXJKSWlBSXk2dGhEQmhK?=
 =?utf-8?B?MmJkNUxpVjZVWWpBOUNPbHI5WWVCby92eGxFcUxCZGU0UkxMVmlqVFE5VS95?=
 =?utf-8?B?aUQ4NytRRUNPaVlCM053bDI3ZitQRmNZVytCOVpZOWc4aGoxZzRHNlhzYVpt?=
 =?utf-8?B?U2RzRG1sSU10TmxQU2orZmp3Mi9oakhpYWt3K1dicFBVWFFVbDB6VFEwMG1Z?=
 =?utf-8?B?eEtaK1p5amtONkJWZFhuWFVFR2ptZmJiSWhkNkgrZFhYdHdyd0c3UlIvMFZ5?=
 =?utf-8?B?RjR0MG9WMlBidHdReWtzdHR4MDBEdmR0d0ZRbXZHZlFoeEI1bjcrcDJXNFlG?=
 =?utf-8?B?anV1QnY1TC9EOEN6TlRDekhLSnpMRTJSUlFJMXE1TUcxbW8vUzRPbU1Uakoy?=
 =?utf-8?B?ZnhMVG5QWVVyOG1XQWJMbmZPYkdEMmYvWWlqLzNGeUtWZ0dxM3NZSkUrUDJq?=
 =?utf-8?Q?6/RtiWW7PjK0R+hNvnZSNhFrc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ficKLVNcNQnByRF8a0G1vNIknKr1bMrCtrC7sqMAcMfgptN/DXhgVPS9gh8RVCKkgOO4jeQqJy9GVQFXRXnCSui4huJIe8SSos99jpqalhRZi7nGHMbRhbz+A2D/ZhlV0EKb8pDOLzk0ICgforWTxoCM3m7IKsNDKwvQk1+60XoiRCvn/ylRf4X9Sr52GrcDRlfyFeHp6Yma7EDG/mA24nmqObseUrgvvqQe0V8DNtOtyRt7dT9lpGj1nQ8sHPThMd8q2S6OfxERqn1yWrZQrdCSJzo8UNfrkpI9gfa8JB3/5obT+wMWMuCcuc+DFBSeTyGL4tk8QFx113x9iiq+Uhg4nQJodOoF5o7plA5AP/F881owBSsO2B5eHegYvjYCYxPBxlEPQ0jXCesdKvPnitk6Vdd8a6BPQGSuDJpD3oT6Ptq7eGWkNes+imLP+toijFj20hPBsmO8EEwRg6Yw7hhR+5iX/xv7k8YTr2Aexx0+pY0G7Xd2IMGqFOMRc0n/wBnZIvkssbQ3YFjeWqX5u35YT0BkNQ6tFTi0aDgmj+U8s7qDKwlcFR2datdi1tb/vywUoKnis0677n3oUQ1iyUrLGGY/fLKc+bA/UHj7/mJpRH5H4GSUZNuc/f7kYm9DPKFsoBmwOt+mZ7Emj9fX+qTjbqSAEE4W0bLHFQCv3Q9MarRNRSRWgZiGls0tUweMh0PfogI+Fri+DT8RlVZxDFjevyRofIHkgeuQGYPAaulqrBlFTlVP6q62arc6744XHR1B6lNnJMD+4QUOJebGyVDhluWYuArKwhzluNGxdWNmdgEk9SRq7CgXMTUAOGbyUbzAK+HbFMyhVzBYUtGsaHXVjTS/zQ+k1+bipPfxhSKewpiFJPSSrroKGhkQohN+CXO0krLX5WAiFoP990qdC9eISS8OiR/54caDd9qQVlk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400f5824-c28b-44f0-f42f-08db2f8b58df
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 12:52:54.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axJ0sP9XezayJM2MYHlZQ9IokHIITtEaRZrdvkk6td/nquI2JOtGlQezhYHPu3LTutmK+opt0zWWbd6aQQSEpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6351

On Tue, Mar 28, 2023 at 02:05:14PM +0200, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 28, 2023 at 01:28:44PM +0200, Roger Pau Monné wrote:
> > On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-Górecki wrote:
> > > +             address >= entry->gtable + entry->table_len )
> > > +        {
> > > +            adj_type = ADJ_IDX_LAST;
> > > +            pdev = entry->pdev;
> > > +            break;
> > > +        }
> > > +    }
> > > +    rcu_read_unlock(&msixtbl_rcu_lock);
> > > +
> > > +    if ( !pdev )
> > > +        return NULL;
> > > +
> > > +    ASSERT(pdev->msix);
> > > +
> > > +    if ( !pdev->msix->adj_access_table_idx[adj_type] )
> > > +    {
> > > +        gdprintk(XENLOG_WARNING,
> > > +                 "Page for adjacent MSI-X table access not initialized for %pp\n",
> > > +                 pdev);
> > > +
> > > +        return NULL;
> > > +    }
> > > +
> > > +    /* If PBA lives on the same page too, forbid writes. */
> > > +    if ( write && (
> > > +        (adj_type == ADJ_IDX_LAST &&
> > > +         pdev->msix->table.last == pdev->msix->pba.first) ||
> > > +        (adj_type == ADJ_IDX_FIRST &&
> > > +         pdev->msix->table.first == pdev->msix->pba.last)) )
> > > +    {
> > > +        gdprintk(XENLOG_WARNING,
> > > +                 "MSI-X table and PBA of %pp live on the same page, "
> > > +                 "writing to other registers there is not implemented\n",
> > > +                 pdev);
> > 
> > Don't you actually need to check that the passed address falls into the
> > PBA array?  PBA can be sharing the same page as the MSI-X table, but
> > that doesn't imply there aren't holes also not used by either the PBA
> > or the MSI-X table in such page.
> 
> I don't know exact location of PBA, so I'm rejecting writes just in case
> they do hit PBA (see commit message).

Hm, maybe we should cache the address and size of the PBA in
msix_capability_init().

> > > +
> > > +}
> > > +
> > > +static bool cf_check msixtbl_page_accept(
> > > +        const struct hvm_io_handler *handler, const ioreq_t *r)
> > > +{
> > > +    ASSERT(r->type == IOREQ_TYPE_COPY);
> > > +
> > > +    return msixtbl_page_handler_get_hwaddr(
> > > +            current->domain, r->addr, r->dir == IOREQ_WRITE);
> > 
> > I think you want to accept it also if it's a write to the PBA, and
> > just drop it.  You should always pass write=false and then drop it in
> > msixtbl_page_write() if it falls in the PBA region (but still return
> > X86EMUL_OKAY).
> 
> I don't want to interfere with msixtbl_mmio_page_ops, this handler is
> only about accesses not hitting actual MSI-X structures.

But msixtbl_mmio_page_ops doesn't handle PBA array accesses at all, so
you won't interfere by accepting PBA writes here and dropping them in
msixtbl_page_write()?

Maybe there's some piece I'm missing.

> > > +}
> > > +
> > > +static int cf_check msixtbl_page_read(
> > > +        const struct hvm_io_handler *handler,
> > > +        uint64_t address, uint32_t len, uint64_t *pval)
> > 
> > Why use hvm_io_ops and not hvm_mmio_ops?  You only care about MMIO
> > accesses here.
> 
> I followed how msixtbl_mmio_ops are registered. Should that also be
> changed to hvm_mmio_ops?

Maybe, but let's leave that for another series I think.  Using
hvm_mmio_ops and register_mmio_handler() together with the slightly
simplified handlers will allow you to drop some of the code.

> > > +
> > > +    if ( address & (len - 1) )
> > > +        return X86EMUL_UNHANDLEABLE;
> > 
> > You can use IS_ALIGNED for clarity.  In my fix for this for vPCI Jan
> > asked to split unaligned accesses into 1byte ones, but I think for
> > guests it's better to just drop them unless there's a specific case
> > that we need to handle.
> > 
> > Also you should return X86EMUL_OKAY here, as the address is handled
> > here, but the current way to handle it is to drop the access.
> > 
> > Printing a debug message can be helpful in case unaligned accesses
> > need to be implemented in order to support some device.
> > 
> > > +
> > > +    hwaddr = msixtbl_page_handler_get_hwaddr(
> > > +            current->domain, address, false);
> > > +
> > > +    if ( !hwaddr )
> > > +        return X86EMUL_UNHANDLEABLE;
> > 
> > Maybe X86EMUL_RETRY, since the page was there in the accept handler.
> 
> How does X86EMUL_RETRY work? Is it trying to find the handler again?

Hm, I'm not sure it works as I thought it does, so maybe not a good
suggestion after all.

> > > @@ -1090,6 +1118,16 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
> > >              WARN();
> > >          msix->table.first = 0;
> > >          msix->table.last = 0;
> > > +        if ( msix->adj_access_table_idx[ADJ_IDX_FIRST] )
> > > +        {
> > > +            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_FIRST]);
> > > +            msix->adj_access_table_idx[ADJ_IDX_FIRST] = 0;
> > > +        }
> > > +        if ( msix->adj_access_table_idx[ADJ_IDX_LAST] )
> > > +        {
> > > +            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_LAST]);
> > > +            msix->adj_access_table_idx[ADJ_IDX_LAST] = 0;
> > 
> > Isn't 0 a valid idx?  You should check for >= 0 and also set
> > to -1 once the fixmap entry has been put.
> 
> I rely here on msix using specific range of fixmap indexes
> (FIX_MSIX_TO_RESERV_BASE - FIX_MSIX_TO_RESERV_END), which isn't starting
> at 0. For this reason also, I keep unused entries at 0 (no need explicit
> initialization).

Hm, OK, then you should also check that the return of
msix_get_fixmap() is strictly > 0, as right now it's using >= (and
thus would think 0 is a valid fixmap entry).

Thanks, Roger.

