Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3869C4F62B5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299978.511386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7P3-00082s-AS; Wed, 06 Apr 2022 15:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299978.511386; Wed, 06 Apr 2022 15:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7P3-00080u-7F; Wed, 06 Apr 2022 15:17:01 +0000
Received: by outflank-mailman (input) for mailman id 299978;
 Wed, 06 Apr 2022 15:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc7P2-00080m-5X
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:17:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9916c42e-b5bc-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 17:16:58 +0200 (CEST)
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
X-Inumbo-ID: 9916c42e-b5bc-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649258218;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=vZdFDCTxII6DTjdZMNTIMRG//1iiEGY1pLgIJzqp3Xg=;
  b=AzVeFguxEOo0HG0wnVmPldqvtLkCKmOgffFlXc7Xyhxn0RPc68dGb/eV
   Q0xrNfHaqnzfn5dufOFkMd9Udp6y8hO4te1SKQ7DZiOPMQYoMiunAQxO8
   TCl3H623IuNaqn8X8KkNHySeNMZ91/MQAryCJ3YkJRcXk7zuVfyZMVJ23
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68183416
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PSGRp6ny86D2n+aMyauiL0Po5gy+JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeD2iFPamOYTH9c9gjYYW/8kJUucDRn9Y1HAtlryFkESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW13V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYCj4FL7XNuL0ncBhIOhFjbbFfx6/cLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6aHN
 5FFMGQHgBLoPhJhIAsTVbgCgua13HauIxNYimzIuv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9Ckux56+VjWqIGikFBF8fNTMdchse7Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGCE6bKMN8N4n9hIx5JFVdoOiN2ZDB00WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMosXMsQhJF/Xo3oGiausM4bFyhZEfUYXY
 8nzTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zb6Sp
 CziAxMGkzISRxTvcG23V5yqU5u2Nb5XpnMnJy08e1Gu3nkoe4G066kDMZAweNEaGCZLlpaYk
 9Ftlx28P8ly
IronPort-HdrOrdr: A9a23:EU/p1KApqAqRQLDlHehasceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MAnhHP9OkPIs1NKZMjUO11HYSr2KgbGSoQEIeBeOidK1t5
 0QCpSWYeeYZTMR7beY3ODRKadd/DDtytHOuQ6x9QYJcek8AJsQkjuRRzzrZHFedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0gU/LYr9PGuZr6aVpebiRXoDWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jc6r+4u/+25xfA3yv47ohQmvHm1txfbfb8w/Q9G3HJsEKFdY5hU7qNsHQcp/yu0k8jlJ
 32rxIpL61ImgbsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGppnYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuIoO5lbZvs3+9La1wUh4TsOscYa
 hT5YDnlb1rmGqhHjzkVjIF+q3tYpwxdi32MHTq9PblkAS+p0oJvnfw9PZv4Evoy6hNO6Wsn9
 60SpiAtIs+OvP+PpgNc9vof6OMex/wqFT3QSCvHWg=
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="68183416"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npDGWDdM/ei2QOzVQyKeGnte6XyTaKw4fBFNlfkDEwL4ba+LRrgQMpogk1Ayc88NuV24HMH5AKhbSemhQ7/lYeAVX6CDN0hmKpRCQXnOw4Wl2iWKewJMi7fM9vN7uqf736KQDcG2kiY9PJ3mmH7JTifYHjq84lx3T1y4FC6HDkY4CtfybhFyZoA343NdIs9bUVddqvupXL+o+/GHr5UL4Mq7+JRL1Yo3lrB7SkSgWGLXFD/REi57gtLp+IVwbwLd++WnHtL1MszL5zMuiaw9qJ1Vin+KvbEGKf6RHQs+7zbBVwr5HzTrDbTDfp8B3K6vbBdW+QEvJjBJ0CBzL48Zrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIQTgOVt3wf93/U8SGKRpU2zbTVt6Bq9lixp/soUrC0=;
 b=gPU4hVuXG5IaASDCHigNh8Tr7K2EQI1aVbKKgS+pYJcagGlYiueS0PG2EPk7EdqIiW3env8+SkAC59RnzR/0v/AsRCE/4oVmMmXF4aMHDbogxuT73KPsZadxZRrA14ieG1pxXDkTmbSDvy2qm+cCc10JvAIKnJd346XhR1HnTxz8Iqyo5Cag7Him7JNAo4OQoKyMUGEedfzp6BgEAStmvxrTEn+CmtsJa7cK8DjFyI/1ni2txez2OB9feVCCIm6eZH4ZxGb/Ca6OTO9PTOL6qEctY6yKhaBkPIvoHDEVjTAc12vmSBSBnaNFDtfOkutCSVnZnzK2HnNED9QqwqSAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIQTgOVt3wf93/U8SGKRpU2zbTVt6Bq9lixp/soUrC0=;
 b=vCPMy2aUmpSwKRGA/pJT5aiayQY2it03qFG1fxKHniFaXG+dB4Pxc4kYZfzoZW0IMy1Z1/6q2uRQoK1wtZaLGxnQjCwYZzhiBnlwyZE7ORpIl2GOyDWGmO7I49ksZO/4hczc+N2V5gyf50L73LsLxOpEJgLBkTjhSsnehmVUW3s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH] platform/cpufreq: add public defines for CPUFREQ_SHARED_TYPE_
Date: Wed,  6 Apr 2022 17:16:45 +0200
Message-ID: <20220406151645.32827-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e849da5-b895-40c7-b6e0-08da17e07ba7
X-MS-TrafficTypeDiagnostic: CH0PR03MB6082:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6082D1F12864288CBAEAC5308FE79@CH0PR03MB6082.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jS+hE9R8yoHTnw0daQsqPByYs6EhmfLL0Nu1NyfvxVeN8Iwa7Per1D4mw4oJ2B3T+bueYix1sPRxfO047MK8OFKYGLPfh+GZ02cqNH7WZy604w+/nfmTs/ZkGOznwk066yH+QSj3dPTZbUL7fht0RPqx68ObK50/InIu/vDWwY0FcUt1oAQpkWuB2W/3VbodwFiKwJ59VZ09Dl7fl/UoWD7e7UMZ09iUozoN4uMPbwfpiSYD2ffVxI88A5CtecTgOCPKpWOrctgFiFT8vfTXNOtIRWbmfILjBXjprgRqlYnDncKzF14b/qyCkuaz/C0VbTWGF1OOPGLvKsxQDlREw9EJlgpSOdBMLXZ840AVkJSz5zSoHJvpvAigtWyImbH4FmKCVLJilS79hQCkVrxwxbr1RcYrLW9PCsa8s5bBNGJmiMCd26HtP4xU/NREYKWG6bMhIRS3QxPOVo7ryDCpsk660jJdBdqwIFoa5GF1tLf5dFSjGMG8NvzhXWzh2WgleMGTHifibt8MRHPECFMqAQhbrxCkErh8YfOR6c+qGDDlVzwN408Cfmyeo3wHfXJ5+IxoIJl9w5vRxxoxc+MjZNcGFNO5nDQnVS1t8yw6U2WgKBlNJe1v39TwanQ7fO5XZ1u41CYK9nCaY66E9NVdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(2906002)(66946007)(83380400001)(6486002)(4326008)(26005)(66476007)(66556008)(6506007)(2616005)(8676002)(186003)(8936002)(86362001)(5660300002)(6666004)(508600001)(1076003)(54906003)(316002)(38100700002)(36756003)(6916009)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzh6dllhbU9vNFFCckNFaDdYbFhFejE5d0hIMEpnTC9YVDdYWVA1Qk5Kbktt?=
 =?utf-8?B?b2luQjhOSDdMaHR6SmdwZ1pnRUYvdUcrckJ0NHVKVnp1UkUyckJhRXF1SlFz?=
 =?utf-8?B?TzhhQkJveWpDVDNSang5ZmFOL0pGOVlBYkRmUC96OW8xN2pyTHZnbjlLKzc2?=
 =?utf-8?B?QlZMZnR3Y1BSRG5FdXlOd1N0ZjQ5WmpiTXNybHFCbGluSC96czFZUFhlZ3I0?=
 =?utf-8?B?VllKN1lkaWVWQWlRcGFhVDZjWEROV1F4SVZYMStWVE5qUWhLN0cxSk56WExu?=
 =?utf-8?B?OVhNV0ZtdVVvbUxSVDk3TGhoMEhuUnZNSmxVNXlmL3hvNnVOZDhDQWhuTisz?=
 =?utf-8?B?L083VitHb2dYaDZEeFFYV3F2OWhKL1pBb3VLaXdJVFd0QW41Y0FJbUdBNFhU?=
 =?utf-8?B?T2o3R0xqMWZncWlWaDhVa2NaRWNZZE1sdXZFR2l6aTNGa1JZSlVscnd5eTdD?=
 =?utf-8?B?NmNrWDU1QThMTmE1VnEwcGRMeEJNelZmTE1rOEdjTlQveDJvUG9XbzR5eEZ0?=
 =?utf-8?B?eHdydDhvRVhKRFpKSTV6YzlkMGEzZFhYK29JcTllcXVIazhJejhUQ29oVXV5?=
 =?utf-8?B?OSt0U3lBMXYvQTRxa1RsVWNyTG9nT2tTL21oQU9KdkdENjBFSXhkd1RxYzJC?=
 =?utf-8?B?L3Y0ZUFmakpsNWtyRjIwbEJXMytpbC9LZ3ZuOXozaU9BRTNoUFJWT1JFTHY4?=
 =?utf-8?B?M1RTdVN2QTg4TFFWYXZNMVR4M0l5dkZ0RVVtQ2x2akNNSDhUUVVqaklUQk1Y?=
 =?utf-8?B?TGFIQXhJL01xZmtkbXFtaVFUK1ovWks4dUFldVptd3IzMGg5MkxibUEvVDBK?=
 =?utf-8?B?VGY1N3k0cm5mckZETkZGcVV2VWRNYzMrQVNlTDBybTdiT3hUa3Jxc0JHZjVn?=
 =?utf-8?B?VE5pZ25EbFFJTG5NMTh2TzQxMUFtRXdJQjVjam1vUlVCdjlTR0hnWUlraVNh?=
 =?utf-8?B?RDR5ZkdHbGE5b2YvT1AyU1Z0WjVud0VOS1VvbFlpZmtnTTc0MHlyS3preTBU?=
 =?utf-8?B?SWNMVzAvSHovcHZkNXhqZy9yNHNzOTE1MS9XdzYycTBSSmd3TlpqOFNZbXNU?=
 =?utf-8?B?OXNqY1U4dHdaVzJ5ZmwyVjVvdVhxTVdhNjhKc0RPYi9WdDY5MVdLSDMxZmVv?=
 =?utf-8?B?STNBL09xSkZvZkVEdEFCSEw5ZHo2Q2xYQWhwb0QzZVJaYUVwQTNrU2dUeWRk?=
 =?utf-8?B?U3ROZzYvUmpEaHltaDlRYjR5UnBoeGRKaFNPd3ZzMTMreFQwZ1BDK09oNk1U?=
 =?utf-8?B?dnlqei94MG1qSVpsemhYNWpYL3ZaVng3STR4WFN6TndhS1F4UW9LbVVIQ1VB?=
 =?utf-8?B?ak55N09NZk9RVTV4NXZHMXNtL29rbFAxQmY2MWN0REhhSStDbjFGMGZsM0dF?=
 =?utf-8?B?NndWVHVoL0tqZzdvVHlmNTRuSDJkUW1leDVNRnVXUkI4YmJpYWJlcEVTK203?=
 =?utf-8?B?ai9HemtkZkgrSGtKZm5GLzRyZXlPLzFMUDJkSmlBMC9adVk0d0tjd0NjSDFD?=
 =?utf-8?B?YlN3S3lreWxVRjB1R250b0lQL2pndkw0MWsvblZ0RjkzVDhOdVV0N1kxalNj?=
 =?utf-8?B?dmNMa1pEdytwRjN4cXYwS0pYWGNkc05zTkVGUFl5Ky9qdSs2YW1jMlRESUhj?=
 =?utf-8?B?MUxZUmo3TnFOT25vdDYySG4raXNsRG5lREhkdk5xQmVXY0YyV1N1RGNlWEt2?=
 =?utf-8?B?Uy9Rb2QzZWQzZGY2R2tmcEJEcERhY1h2R2ZpeDlLWHZOWmhDdnpFYjBDYnor?=
 =?utf-8?B?OXZmRlZmUEVqTTNaaTRucWFHeHlpcEs2U2xhdUZ4YTM5U3R5MzNRdmNYWXBk?=
 =?utf-8?B?eWxpSldsamtCMHg2U01kWUh1TCtkZGxLVWZkWjZtWERjY2hhWm1PR3hJTFdP?=
 =?utf-8?B?UHlKV0M0Y29mZXE3cnJ3cWxQclUva0RDM3gzRVU4OFpCUENpb2xkS2JKUmxU?=
 =?utf-8?B?czBsT1V2R041VjhQM01ndWxMMThwSnc1dmFHRk5YbDRUVEZNdVhLOWNNZmMz?=
 =?utf-8?B?ejd5Wi9pbS8zT2tjREZlRTVJa2kxRHhyb0s1SmtYYjg1YjBaaHBVeWV1MGZq?=
 =?utf-8?B?N1RhMnBSYzd2SU1JMFJ3TEN5MmRicGlHT3JISkJtcFRSbnE2SGR0VlJLUTM4?=
 =?utf-8?B?TUFoYXg5Sk5CbnN2QU4rclA5Ynl5OWwwc0Y4QVVldFh0S1lsS2d3QkRiYzFs?=
 =?utf-8?B?Vko1OWZFVTBCVmlVR05laWRGbExkeFhJcUlwZmh3U2xMYU9KR0tQeWZIaEdD?=
 =?utf-8?B?ZHYxbnBtMXdrbmhLNHE3VENoRkZlU3lValV0a1VFL0pDdzY0OXFLRG1sS2NO?=
 =?utf-8?B?cC8rRzM3YjBwblVLNUpxT01GelhxVnNzU3BaYXI2RzRyTGN3Z2pMbVdUUUlh?=
 =?utf-8?Q?PK90VtqyAXKxN91Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e849da5-b895-40c7-b6e0-08da17e07ba7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:16:54.2142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNh+/CxvOxQ+Wa5A8Tp5Ltycy71FLV5s39SP5S3fI+DM8+R7Az+XgDPALDMAxSFOhngVXyGufMlEJOQAghWTsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6082
X-OriginatorOrg: citrix.com

The values set in the shared_type field of xen_processor_performance
have so far relied on Xen and Linux having the same
CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
public interface.

Formalize by adding the defines for the allowed values in the public
header, while renaming them to use the XEN_PERF_SHARED_TYPE_ prefix
for clarity.

Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I wonder if we want to keep the CPUFREQ_SHARED_TYPE_ defines for
internal usage (and define them based on XEN_PERF_SHARED_TYPE_) in
case we need to pick up changes from Linux.
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c    |  2 +-
 xen/arch/x86/acpi/cpufreq/powernow.c   |  8 ++++----
 xen/drivers/cpufreq/cpufreq.c          | 10 +++++-----
 xen/drivers/cpufreq/cpufreq_ondemand.c |  2 +-
 xen/include/acpi/cpufreq/cpufreq.h     |  5 -----
 xen/include/public/platform.h          |  6 +++++-
 6 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index c27cbb2304..200c6ac851 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -426,7 +426,7 @@ static int cf_check acpi_cpufreq_target(
         return -ENODEV;
     }
 
-    if (policy->shared_type != CPUFREQ_SHARED_TYPE_ANY)
+    if (policy->shared_type != XEN_PERF_SHARED_TYPE_ANY)
         cmd.mask = &online_policy_cpus;
     else
         cmd.mask = cpumask_of(policy->cpu);
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index d4c7dcd5d9..e03a079ecb 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -109,7 +109,7 @@ static int cf_check powernow_cpufreq_target(
             return 0;
     }
 
-    if (policy->shared_type == CPUFREQ_SHARED_TYPE_HW &&
+    if (policy->shared_type == XEN_PERF_SHARED_TYPE_HW &&
         likely(policy->cpu == smp_processor_id())) {
         transition_pstate(&next_perf_state);
         cpufreq_statistic_update(policy->cpu, perf->state, next_perf_state);
@@ -119,7 +119,7 @@ static int cf_check powernow_cpufreq_target(
 
         cpumask_and(&online_policy_cpus, policy->cpus, &cpu_online_map);
 
-        if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
+        if (policy->shared_type == XEN_PERF_SHARED_TYPE_ALL ||
             unlikely(policy->cpu != smp_processor_id()))
             on_selected_cpus(&online_policy_cpus, transition_pstate,
                              &next_perf_state, 1);
@@ -220,8 +220,8 @@ static int cf_check powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
     info.perf = perf = data->acpi_data;
     policy->shared_type = perf->shared_type;
 
-    if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
-        policy->shared_type == CPUFREQ_SHARED_TYPE_ANY) {
+    if (policy->shared_type == XEN_PERF_SHARED_TYPE_ALL ||
+        policy->shared_type == XEN_PERF_SHARED_TYPE_ANY) {
         cpumask_set_cpu(cpu, policy->cpus);
         if (cpumask_weight(policy->cpus) != 1) {
             printk(XENLOG_WARNING "Unsupported sharing type %d (%u CPUs)\n",
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index a94520ee57..64ed8ab1d3 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -179,7 +179,7 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    if (perf->shared_type == XEN_PERF_SHARED_TYPE_HW)
         hw_all = 1;
 
     dom = perf->domain_info.domain;
@@ -334,7 +334,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     if (!per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    if (perf->shared_type == XEN_PERF_SHARED_TYPE_HW)
         hw_all = 1;
 
     dom = perf->domain_info.domain;
@@ -504,9 +504,9 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
     if ( dom0_px_info->flags & XEN_PX_PSD )
     {
         /* check domain coordination */
-        if (dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
-            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
-            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_HW)
+        if (dom0_px_info->shared_type != XEN_PERF_SHARED_TYPE_ALL &&
+            dom0_px_info->shared_type != XEN_PERF_SHARED_TYPE_ANY &&
+            dom0_px_info->shared_type != XEN_PERF_SHARED_TYPE_HW)
         {
             ret = -EINVAL;
             goto out;
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index fbcd14d6c3..ece90cb45c 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -195,7 +195,7 @@ static void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
     set_timer(&per_cpu(dbs_timer, dbs_info->cpu), NOW()+dbs_tuners_ins.sampling_rate);
 
     if ( processor_pminfo[dbs_info->cpu]->perf.shared_type
-            == CPUFREQ_SHARED_TYPE_HW )
+            == XEN_PERF_SHARED_TYPE_HW )
     {
         dbs_info->stoppable = 1;
     }
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index e5e58c6c30..6e4dcc99c5 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -78,11 +78,6 @@ DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 extern int __cpufreq_set_policy(struct cpufreq_policy *data,
                                 struct cpufreq_policy *policy);
 
-#define CPUFREQ_SHARED_TYPE_NONE (0) /* None */
-#define CPUFREQ_SHARED_TYPE_HW   (1) /* HW does needed coordination */
-#define CPUFREQ_SHARED_TYPE_ALL  (2) /* All dependent CPUs should set freq */
-#define CPUFREQ_SHARED_TYPE_ANY  (3) /* Freq can be set from any dependent CPU*/
-
 /******************** cpufreq transition notifiers *******************/
 
 struct cpufreq_freqs {
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index a4c0eb6224..0198d249ef 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -465,7 +465,11 @@ struct xen_processor_performance {
     uint32_t state_count;     /* total available performance states */
     XEN_GUEST_HANDLE(xen_processor_px_t) states;
     struct xen_psd_package domain_info;
-    uint32_t shared_type;     /* coordination type of this processor */
+    /* Coordination type of this processor */
+#define XEN_PERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
+#define XEN_PERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
+#define XEN_PERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
+    uint32_t shared_type;
 };
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
-- 
2.35.1


