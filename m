Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0E49B236
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260053.449047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJLg-0003Ow-Ov; Tue, 25 Jan 2022 10:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260053.449047; Tue, 25 Jan 2022 10:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJLg-0003N6-Li; Tue, 25 Jan 2022 10:46:52 +0000
Received: by outflank-mailman (input) for mailman id 260053;
 Tue, 25 Jan 2022 10:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCJLe-0003LS-Ul
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:46:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 180d7da4-7dcc-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 11:46:48 +0100 (CET)
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
X-Inumbo-ID: 180d7da4-7dcc-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643107608;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=bjDn02oZerAz5O3zE4rQlmMK2+lbTuxXZKU/Dm9jV08=;
  b=Gn0YLK6tiAoSaa0fqMlzuphsxWQqFM6d9u5Jz6bcTK2E7ReRr9w/xFZ2
   CffO76/CLioG+Fa1I+wjsPAox06JLnJhqpirMqkclTv6rDDUQE7bKZzUU
   /pmrJrwatvuAHvNmXwJJO2iHgxH6mZ8ayhY/YTAKgmmaMfJgINZ2xjUPM
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rHB7a/G6CJlHny8pYs7iaWTl2qMhXu6yflWXejm/SkIPam9XVRQwfbEXgD/KcxZ4qsYHWxW4Tv
 R2zo45xUfWSe40REWtMTrrwaXSudt8lUxt9K/HG2NZw4URJEmGPX0MPEU0j10wosWYGSov69Vw
 OVKhlJ6mkPdn2zjNjy85JR6sukUCV/MV0owSfjNzZjvTscZTuko/vJ9fnJrjL79Y5JL2JaO008
 fZeycYfdN/R1UfC24pZ/Eu17OgW4oHxir+HJ0Ky4TLUKHJRT7zvX/ymu7VL/PRjVTpCS3Y3nOV
 xEOJqVgnZyjxsQE6bOZ80drZ
X-SBRS: 5.2
X-MesageID: 62618019
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ENwwSao4rPeryo1hGtIpbomcNB1eBmL+YhIvgKrLsJaIsI4StFCzt
 garIBnSMvmNZjGneIgkaozk8U8PsJCEzIM1GQBk+S41EHgap5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaS9Ewoiefecou8idjhCODhnFoRhqaCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UQ6+OP
 5NIAdZpRD/LRRceZwozM807ve2z10GuSAEGsl3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0Y9cKHuZ9slG3wZXxwhyyH3EvZxkQd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb4
 BDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0lfBs4bZlaKG6xC
 KM2he+3zMUPVJdNRfQvC79d9uxwlfSwfTgbfq68giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTfSFkXsin8pIOHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:JnpiSa1DDRMeHPvm43KXDwqjBV5yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFm7X5XI3SJzUO3VHHEGgM1/qF/9SNIVydygc/79
 YeT0EdMqyIMbESt6+Ti2PZYrUdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngOObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Li1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESlti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAx7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1TwKpsKuZPIMvG0vFnLA
 E3Z/uspMq+MGnqJUwxh1Mfj+BFBR8Ib1S7qktrgL3h79EZpgE686Ii/r1vop43zuNOd3B13Z
 W7Dk1WrsA/ciZvV9MEOA4ge7rBNoWfe2O7DIqtSW6XZ53vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62618019"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFlV03vXvfbiiQBZYQGoBd/9B99r+oZ8/fzYAOmjHcfkg9q5D0fELIy3SpyMMDs/ecg8P9IQgDIyLDHccjTLSjEu6fLQS3IypL3+gaL0qflPqRNdvcqadqA41/sKJ2sI/JmnOCghMQCRXhV+sEVRQ5PU6RwFLRXT9SHPG7HQeHhitCzxRkSx9ArS2dwrfaNdd8MgO+uY3RYiPADUnalCzITiXhFp0DlPzTBSspL77ACj1qx3170W92daJe09HVTTTOHLVBXn+o03IAuvJgOk2wpOoQ1wnebpgL8V0ePXtCJwV9JNAluaeXhWwtn3TSYOP1DVYmKm+1mq/wy04KGbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMoeKsbIiAatSd4jZPfgoanXYSXwyFFC+JM1TJuz2yc=;
 b=iDIgh4re61E4V1ajVssWfC3CACYbOYUIdJsbgi39ny4BPz0MdA3g+sop03r3tZIdFwM4ksRpcAMKNMFcS2WBIVBtPM4B+K6uPCwwAVzk5XkCzfHFssW3+IlVIb4BUXCD6VPzXpideNaS+QUc0J1dOIC44+CgOTuJK0jM8/VgsPFht7leAxyYJsh0QBtGQEtfYT1LR+3PpLW2e50UukeKGuCevkyxmoMMzvK/IP9sj6wjRpwpJ8WouPpH9+gvPvMTdzizhT7PypZN9T4lZaDNYHP8GQ/YpEHdELF/lHywuR0egxez4Q8xrozYBpwYRsk3gJbWxZ5XU389KT1BMKGGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMoeKsbIiAatSd4jZPfgoanXYSXwyFFC+JM1TJuz2yc=;
 b=EWh1uwmAG/+fP8SBfwQQh3TI1+2Y9fJXdeVL3goBxSTto3apNEwB2t25ZY9fns352OyCEB2pEqpgSvWxLBriVpgblHtwhsvN91ZnqCAH6VgV2bbWgBTg8mcpnpb9VytC0xdjbraY+ztCEKKbcRkBfZDWz4BSZHcYKO8Adxa7mKE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/pvh: print dom0 memory map
Date: Tue, 25 Jan 2022 11:46:36 +0100
Message-ID: <20220125104636.42080-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 402b5766-7bdb-4eae-882e-08d9dfeffa2b
X-MS-TrafficTypeDiagnostic: SN6PR03MB3806:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB38066B824A0BD34CCCE13A638F5F9@SN6PR03MB3806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3mWQcAgl3hm7dgGzNB6W9cf0BPT5m24PQ6g26c0m6hUUWsC/e1XfgYCuCW6aYtIHiDbHXXas00oyTC8Dsl9XV1i4cIYsPboCe3XQf7EfZHGaPWbgd+54rWWTlAMrFfUJ2eINUqXKnmGA79MeE2bj/rIItd3wO2gQESvOiJtUfrfH4a3CJ9DcOZKm5UDGI8yKGuAeqBh9VflAl3SPmz6IRrUewXqCjIor0agIacJT8jOqyhSS1W0CKXoDayeIZMgq+H5jSp+ZJ6RAA7UI77XLRX/dRDZ2YBfCqvf75UAubcTYSRKvg0y3rzOVbCXSHvcyeztQB5/oB1MnFO4AA3nUZhTrxfoXKOzyFBtIS3k0RMSv0b6HBLEKfXCeMRYsg9/m8GdysFwQIIRI/sXa5Hr5yE7CRXq9eUz0Ot9j0f+UJVzp9pSllk+IGGQfuhedxwXOp6YOpzCUk9J4fwUrk9fdrjCB7QXnRhb6+9+hlt5+zFBVFsNTuPTg67LupVnQB625RqBY8G8hSM5mO+sU5CslIVYscbqzLF0K+6Z0sKYFhNesZo6Bq6GaxfSOq+vkFgkQ+uufhWSCiFq9OChkcMupouJmo3dplBgqYPtVovVf87OCTjfeYvGdc293Touw4gQ2ZHBCD4bReAflB+UYy+eNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(2616005)(82960400001)(6916009)(83380400001)(8676002)(66946007)(6666004)(36756003)(8936002)(26005)(66556008)(186003)(508600001)(5660300002)(6512007)(316002)(6506007)(4326008)(54906003)(66476007)(38100700002)(1076003)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3JJSUU0eUgrR3pYMFV2UTR5LzZZdWZLVURrM2N3ZU1PRnlRUS9IZklhVUpK?=
 =?utf-8?B?cG84Q0VQTFltMENKREc3TzFNbUlUbzZscU1TRlUvamJEYTEzU0tucHdQdVhm?=
 =?utf-8?B?c3gwd1dNNWp6N2hCaXdSVXZ3QllMVlVUT2FhU2pveG5kdW5DRzJGT1dSbHJT?=
 =?utf-8?B?R0wrVzBZRnN2d243RTlLUDFaNzdzYzU1ZjJRVDhOR3Q5UVZVaXBmOVBMZ1Fr?=
 =?utf-8?B?WkJFS0VPZ0lsZ3B3ZVMreUJpZVV5Q3JmWSs1UktOOGxzYU94OGtDUHNnVUts?=
 =?utf-8?B?U1dnZzBBSElsWWU5QTJXQXRhVlNjcHJXMzJBMkw4ZUZuRlB6bjd1Nnd2R2x3?=
 =?utf-8?B?YStOOTBpREtrMnV5djVvNGMybUZiUDNzMmROT3d1ekVSY21GbG5LTCtYUVhx?=
 =?utf-8?B?RHdlNENNSG9idzJMdWt5Kzh2d1U2WEhDQzFncWltWFZpSGkrM0FCVlpFSVVU?=
 =?utf-8?B?NFhad2tLK3pCdFJpdFdiZmxZVkIwMy9aV0VaN1BHczNpRWl4MzBNb1lZRXJZ?=
 =?utf-8?B?QVFoRkFaTkRDTXhLdThIT210c3FPSzVrSVEwQk8wbGdTU2JnWUpUYTE1NzFD?=
 =?utf-8?B?Zngvcy9nYkduTW9QTjFtamI1cG8yS1QyU21oMEFlYURldzBuam9PYzFCUWor?=
 =?utf-8?B?WWQ0cjlUTWR1RDVGVTV2a1dnSTlXdFY5SmRPTWFPSys2Vy9iRVF1NFJSZkJE?=
 =?utf-8?B?UHFEbytVblNudmM4UDZaZUsxM2thZ1REUzVPQTVqYm41Y2RLUnhSVWZsd1pD?=
 =?utf-8?B?c01YWTZUWmR5WFltTHI4MWh2VnVZWFE2djc5aHYwU1ZVUmNhYmdDYVFIOFBj?=
 =?utf-8?B?RWRBa1hlcC9USkE5ODVLcTdtQjN4TFZwVk42ZjUvdXh1b1BzTzh6M3lIODNU?=
 =?utf-8?B?M3habDZmSzZUbXVQamh2dURtMEU3R0drQndkdzBKMGwrM0ZCcXN4bzVrWUdn?=
 =?utf-8?B?VGpSMVd1a2VlQnZnZGpodS82UlRrMyttQTVEYUxhcVJSK05sRURVdnc3UWtI?=
 =?utf-8?B?VVBIcytUclBxeHcrcVJSUWIrQ2luTmg2ZDc1ZmEyZVFKWUpxd24rNk1wSVZz?=
 =?utf-8?B?UGp5VzRGUGs1L081RmhHTnhQdTVJZFhXNFArN040R0xKM2l2dldCcGprNG9o?=
 =?utf-8?B?OVplZjBkemR6eVFyZ1RsQUlrbzN6dThWZUVvNlFEaTduYk5GZmFVTzBqakNp?=
 =?utf-8?B?cUc2SitFRXJnWjA0a2tUZFVhL3ZNaHQyc3hOZlFwR0ZOUmYyTXZGWVFYTnpD?=
 =?utf-8?B?T2NLVDlrenJLU052Y1B0a2c0UTJFTFFtbk04T2F0NXRBaTVDQWZLSmFudjNu?=
 =?utf-8?B?V3ZIQkNjaGtsaFdhZjhuUkJTd0xFTHh0dkVBL0JwZDNjZ0dhaCtHa3BxZVVD?=
 =?utf-8?B?NnhSMWlldTR1cmF5cnVCNGFpZjVMRkYzOURHMTVOUi9iUUlGeUY0a3puU3Vt?=
 =?utf-8?B?K3M0eGxaTGFNR0x1cFhmK1NhRTN5SmJTTkRiM2RzZDhLdW1nalZJRUlzdnlz?=
 =?utf-8?B?K1VJU2xjU2loUXI2UmZFL3JlbTQ5NnYwT2J3RmRFRzhyUzM3RHJuQ0dRNEtB?=
 =?utf-8?B?YmdkZE5yeXRvdU5oMHVOOVZxcE9iT3JaSE5jdU5vcDZudC92UU10WWtOVVRU?=
 =?utf-8?B?ZXM5b05mbk9NZXhyRFNnd1FuVjJWQ3l5bitpVm9KTkN0bTlWOVJhaE9wdmtF?=
 =?utf-8?B?RmRNd2V0N2pjelBxVmlkT2l5dmlXOFpaa2E4dHFlR2loM0NtY3dDQ0xsWUh5?=
 =?utf-8?B?WGNsdTFMekl6eEE2eVJNNXJMd2thNGR4bWFzMzk1cWJRV1IydFRuci9QUFpq?=
 =?utf-8?B?aUE0WWIwd3NPM3J2eWY2U1NBeWJ6cGVkVGdiRDczaTgzdW1wSG5SdGRxYzRq?=
 =?utf-8?B?SGp3VkZzdDVFODJRcm1yMHh5NEN5VW5VRG9lN1VYNm5iK212cE0yQkFRNE4z?=
 =?utf-8?B?cjZWTzBwTGRsd0FCVitHWlpJbmttU0l5eldCOWJzQ1BTeEZSeFlDVDU5TU1E?=
 =?utf-8?B?OGplRjdMQkJ3SjBPTkh5Z0xSVGlGRmZFS2VOYWlqWGRFWW1FU3hRNnZEMmJY?=
 =?utf-8?B?NGJ6SGFEeVpZdytQTTJsTnVlbE4rMXlqMlVDK0IxdmhFdlR4MWdHNWs5dFUw?=
 =?utf-8?B?aXFEY3pSK3pOZGxxZVNOdDBKVnZjTlNQUGZRV2VQTGVWdGpoR0ZoMWRNVk5C?=
 =?utf-8?Q?UpvhX0ODLTPtu95NDd1I+zk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 402b5766-7bdb-4eae-882e-08d9dfeffa2b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:46:43.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoDzvQ9CIy2BaZ9CPm1mwo38R4N71zUwszkv8VH3Z7N2PoNeJ3kh+xbpSWWGbkX8l/RFQx9u3juGNjrT632APg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3806
X-OriginatorOrg: citrix.com

I find it useful for debugging certain issues to have the memory map
dom0 is using, so print it when using `dom0=verbose` on the command
line.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Make parameter const.
---
 xen/arch/x86/e820.c             | 3 ++-
 xen/arch/x86/hvm/dom0_build.c   | 6 ++++++
 xen/arch/x86/include/asm/e820.h | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index aa602773bb..b653a19c93 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -88,7 +88,8 @@ static void __init add_memory_region(unsigned long long start,
     e820.nr_map++;
 }
 
-static void __init print_e820_memory_map(struct e820entry *map, unsigned int entries)
+void __init print_e820_memory_map(const struct e820entry *map,
+                                  unsigned int entries)
 {
     unsigned int i;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 63dceb2116..549ff8ec7c 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1270,6 +1270,12 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
+    if ( opt_dom0_verbose )
+    {
+        printk("Dom%u memory map:\n", d->domain_id);
+        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
+    }
+
     printk("WARNING: PVH is an experimental mode with limited functionality\n");
     return 0;
 }
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index 9d8f1ba960..92f5efa4f5 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -32,6 +32,8 @@ extern int e820_change_range_type(
 extern int e820_add_range(
     struct e820map *, uint64_t s, uint64_t e, uint32_t type);
 extern unsigned long init_e820(const char *, struct e820map *);
+extern void print_e820_memory_map(const struct e820entry *map,
+    unsigned int entries);
 extern struct e820map e820;
 extern struct e820map e820_raw;
 
-- 
2.34.1


