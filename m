Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B548437790
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 14:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215062.374013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdu4H-0000B0-8y; Fri, 22 Oct 2021 12:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215062.374013; Fri, 22 Oct 2021 12:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdu4H-00008s-5q; Fri, 22 Oct 2021 12:54:41 +0000
Received: by outflank-mailman (input) for mailman id 215062;
 Fri, 22 Oct 2021 12:54:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBiv=PK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mdu4F-00008g-K4
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 12:54:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c93a3fe3-d3f0-4088-89b8-8ca7af186956;
 Fri, 22 Oct 2021 12:54:38 +0000 (UTC)
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
X-Inumbo-ID: c93a3fe3-d3f0-4088-89b8-8ca7af186956
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634907278;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PqgJfZ0r7c2j1QceRM/TNlaCm4F8iFzUs9Gbyswhd80=;
  b=FcMhs/Dqqa9Z5pffxDEAejBzg9OlMUoMA59ezyjyBGOrQaAtEqRn+QNp
   hCQUcOOMNpq1z6M1Vj6I9XwNn6W8u14IuOVZ4BG4NSXczlFU14eZHhwZ7
   K0g7eOSZh+dZ8VdeyrUGYFW6Bhd+NjphaHZIJu/Moesmo5EfF54363VVt
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9CtR5RCnAM17l2i5BLOm3FqJi/X0dCJCNMbTWik1nd6JXaNBnE30oVt02L/qBeLbfhZ9LvhyWQ
 0bMbmxai/n4xNT2pVUMJ/oMObRBjpWCYthUPDFAEzmiCXe1gm3HTPd14SBFGWfgsq7qpzeQaS9
 SWE6IwSOjN/lIbYVwesRtb71g4Wp3xQmEz6Q5t+C0xyrpoaQ+hOl+FwIr7q40xaphQ8bz3CgJA
 Kun32UMr4zbdPFOIKRj+1q7fpiK84FrVfM6VagbI+jYPmcN8CPHuSCLDAO8CjkHfK6HopEiQTN
 cDpZ44XAiADJNzpFzZHFsWFG
X-SBRS: 5.1
X-MesageID: 55814691
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wMed+arquVsT3Db+MGOSE9JV9R1eBmKzYhIvgKrLsJaIsI4StFCzt
 garIBmEbv+ONGOjfIh0OtyxpksF6sTcm983GlNq+y9nFCtE8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLjW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCndu6FgM7Bo/uorpeA0hgKwx/ZIBKwIaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 pdJMGYxPU2ojxtnYFU6CqAc28CR3GDzejhRjXe+gfIm2j2GpOB2+Oe0a4eEEjCQfu1UgUSwt
 m/A537+ABwRKJqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQu2KJsBcaXJxLD+Qw5QWJy6zVyxaYAmkCXnhKb9lOnNAybSwn0
 BmOhdyBLTdmqrGSRFqW/62Yqj70Mi8QRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPWyE2700
 QiojhJgxOVCtfYm1vyW8Wj+1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEQHf5
 Clsd9y2qblUV8nUxXPlrPAlRenxv5643CvgbUmD9nXL3w+m/GK/Zshu6TV6KVYB3i0sKGKxP
 hG7Ve+84vZu0JqWgU1fP93Z5ycCl/GI+THZuhb8NIYmjn9ZL1fvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOFwmnBinDyDHcumnnxLNIZyglbPFd/p13PVNogEAF6s+l2Jo
 76zyePao/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2reWJb9JUaI6aJm9sJItU994wMz7ug1
 iztCydwlQuk7VWaeFriV5yWQO62NXqJhSlgZnJE0JfB8yVLXLtDG49GJsJpJ+F+qbQ/pRO2J
 tFcE/i97j10Ym2v0xwWbIXnrZwkcxKuhAmUODGibiR5dJllLzElMPe+Fuc23CVRXCexq+Ukp
 LisilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLpFeMwjHyxuby
 x2SXUUSq97SrtJn69LOn62F8dukSrMsAkpAEmDHxr+qLi2GrHG7yIpNXb/QLzDQXW/54ou4Y
 uBRw62uOfELhg8S4YF9D6xq3eQ14N62/+1WyQFtHXPqaVW3C+w/finajJcX7qAUn+1Xowq7X
 E6L6+J2A7TRNZO3CkMVKSokcv+HiaMelA7N4KlnO079/iJ2ouaKCB0AIxmWhSVBB7JpK4d5k
 /w5scsb5gHj2BonNtGK0nJd+2iWdyFSVqwmstcRAZPxixptwVZHOMSOBijz6ZCJStNNLkh1f
 WPE2Puc3+xRlhjYbn4+NXnRxu4M150BtSdDwEIGO1nUyMHOgeU63UEJ/Dk6JuiPIs6rDw6n1
 rBXCnBI
IronPort-HdrOrdr: A9a23:DlhDvqiLRxea5JaUkYCW/tmJiXBQX0p13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkZNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGJ2IrT0JbTpzencGNTWubqBJdq
 Z0iPA3wgZINU5nFfhSURI+Lpb+TpDw5d/bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Dh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj/sV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MQTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K4upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizyhSKeSXLzYO9yq9Mw0/UpT/6UkToJk59TpX+CUnpAZCyHpnIKM0oN
 gtMcxT5fhzp4EtHORA7dw6ML6K41r2MGTx2VKpUCba/Z48SgbwQr7Mkf4IDbKRCdY1JKVbou
 W3bLofjx9qR37T
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55814691"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXZtQGTO3nkedZcB89eahcY0mlZgPo7gICrunGX4A5FRzY+T5I2zv82SIKhanYv8MAnuy2x+lEOKIdXW2w7+D9t/pwVNY0bIDfhYMjcjw3x7cGi/qW31K+rJv6Eww71w90BWhLtLLZsUkm3pOM7Pw6yAwUXganbxSxdHLFw8HWDaDfqCXklwpv7WrSckonUzaO3gX12tRwHXngEhA5MVxY+Ajv3tVJaWyBlrVJnCK6PKhxlB+8+Aqqv4cVVDXulaWESNTss/limGKu66PkJGPHiIhJ6qVh4QCxc4WlE62OnpCP6II+tSTjcaRiqI0QSLU6KSrxbGW+KBgk3y6S3Rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I++Rk0i8FU+aqtuOc8ns0kzzA/v5gBYYAPW/mgxsYOA=;
 b=UkJfp/qDGONNKbIuGk9j/GgJ2Vmrq8F2wbPX7BNxLjWYR2ddirF8yXBUysTZHhu4u/CXj000uLpxbyNsnTJL3VZOIsJRZoY4AXvtZBNfLUKkP+Fn+/bE7sPmx2FfTBtS3fkYBEV8Mjn43WDSJpXo/clSHjMS6w/kTCOHdn4daBBYkIv63JdkafRMYqvO41MiR4BU76La9u0k66pcx8O/Nyetg2NgQ49nlnRxb/geKP4cikQ5D8TdPgyzo+Zb/ppwy0QNzwhBwb2+tOWZ3+mn1IJ5801Pu2Uu0ll4WBb4ok4/kndgdX2XoQ+q6N3nA6+nnNcJVBt/RjEw4ETDQMTwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I++Rk0i8FU+aqtuOc8ns0kzzA/v5gBYYAPW/mgxsYOA=;
 b=i7S+c9E6APS+lbtrx53D8Ez8kbncuhETJNHmr60aAEEisbY+/TugSc3YMCPnZyXJ68fHX3dMBaEwakDxsK/DVRHmfhekLQdX3S61XFv4YLNX3s8JMZsDqpXKPjLqOzje9vubODZENyZuriFAbrlHy0ziScd1Uchm1QFhfk3GShY=
Subject: Re: [PATCH 1/3] automation: add x86_64 alpine 3.12 test-artifact
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <cardoe@cardoe.com>, <wl@xen.org>,
	<anthony.perard@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-1-sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <41a3622e-395f-096c-da7b-db3aa58c004d@citrix.com>
Date: Fri, 22 Oct 2021 13:54:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211021230839.10794-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0409.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6559042d-ab46-43a4-b55e-08d9955b18f0
X-MS-TrafficTypeDiagnostic: BYAPR03MB3941:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3941DE6606E5BEE0565099BABA809@BYAPR03MB3941.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B6qNUQX4IqXaMMcaDSo19fgdWXRuUagrdmFT7/n1n7Xtlxy0K0bu0yU28xN5IK85p1L0OH1QIP6tAvc40DpTbvN4e7F4YCCl/uzU6EhJqqh4E49p33eMv4CvDoES9rszkPgYe1QsQ/ssz8A69lhKSEfeNA+Jn/v/yZ50uuFFU5gAGsy8SqZZOZeRdoV4C/bYHK3aJMoL4LVgfmB77o1vhF1owq8ueQpi4NT75jbuPHyRmASHymVqDZ0GE7GGAGjz8qYo5neViGfpZTNnYgiSRdQHHvgsnHFYDg31wTw9RJ/gX8ipZmKokNMsLwXnC9EiImhZ8+inbCqd2s3uD/1RQxjIeqfRIpt/YSJrbus3eMOyxwgzw9f/R6VoP3oDHmmsP3bvplP6k7V5aXa7tsJNucjXPuvKYvCsvOPZuBs3EJGry3LOBk2fyYks79rP1/eYxkLob2Vc6lquLgU8ju/vK06yVg+/RMJL5fmo6x2wMbkeiLyvSCAYks03lf/idxNih6R7OC0STUDmBvvdcbUoQnhq7GpZbm097PLs6AqA486nH4ojNrFu/BqMCXRyRY4Uh71Ptsm7PcKxsD8vTxTZcOIXbzBXXrmY42vql51Mt0UeeApNXYYMCxhrb5GpQz0RmRrCKEiQ/HPvxPltq+hbu4EEyHcuQTSnBF08FdSbd7NJ6cLmJaDjwCGnLaVgJTa+Xiwh0ELAsJbBcOV/LPkahBoJ1c1AKHFCARjCTxth/ho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(4326008)(2906002)(16576012)(8936002)(86362001)(316002)(83380400001)(38100700002)(26005)(36756003)(6666004)(31696002)(31686004)(5660300002)(956004)(53546011)(82960400001)(4744005)(2616005)(186003)(508600001)(8676002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUN3WDQxVkRXQlZlSUJGbDlmOVZoUHdTcXZ4SE9JYU1GM3E0aHNrMzBIWkFu?=
 =?utf-8?B?L1ZoUTJBVmdSYTFJVU93ZDBObzdKS3FyZVBWOEJzekpLNUxQVTFpTk1ERk9y?=
 =?utf-8?B?KzZFOHNXZncvWEVPQkhWNlI5NXBkRXNkQy8zc1VtcnhBSmxUWmdTbkdDdGIw?=
 =?utf-8?B?MHVwVkZUYWdNaVJQaThDR29kV0NvSEFsUWdybkU0VDZJSExSM0psRmJNeVNa?=
 =?utf-8?B?QVRyaUZqWmN3U0hGVzdTVWxCWHpKN3VHbUJKbEp6eVAwekVCNzdPaGg1N25i?=
 =?utf-8?B?NFVyYm1BUDcwMXU5T3daN2gzSmRJaG9BZnR1N1E3K1JabkU4Lyt3dmhDNEtv?=
 =?utf-8?B?SmhVdDJhT2FpRlg0cUlldS9mbUhLNnJJa2VaZkpBekN2MmowMHAxdlpNQVVx?=
 =?utf-8?B?MVc2U1EvMkQyM3VKMnkzZUE5c3RKOWhmZWk3S0h4MjI1ZmR2TnBqUERXWkhJ?=
 =?utf-8?B?VlNoQWdwWVRKRHo5Z3dsZCtQYWtiWGZhdjFKZ04rUUN1SjBFWkIrdnlUK0Q0?=
 =?utf-8?B?YUVWREQybFpHM1JxUFRTalhXRyt1cDNIbHUrellVdzZOMlZleFVrVUphNWhw?=
 =?utf-8?B?WmFwZXJPdzc4cWNSNmFUWGlienZ5VGk4ZUdHWWIwaUo0SXZqcy82bFQ3aXpp?=
 =?utf-8?B?OTArM0hLdWUvbmVuYWFoTDhpMTc3TWtpZlVpdnJGU0tqOUE2dzd1ZWNobUlH?=
 =?utf-8?B?cS9HMnpENDlBbmRHM3U3bzRTV0s5TVN3Wm9FWm5TeGFxR212WEhudVlQbnBY?=
 =?utf-8?B?SzcvV2NRRjUzYVFXUEJhbndGbHZKQUQyZ3dyYUw3MS9ab3FSOGszUUw1L1RH?=
 =?utf-8?B?TDBNcGZVK1FHVjF5ODRWd3lkSk9JL0J0dmFXTVRCOVpvOTBpSE5oRHg1Q2pJ?=
 =?utf-8?B?SkQ1ZDRUWGQ0U3Y4Z3cwSWFGN0o5d0JJK0ZyOVpsNVdxVEMwTVlRWjd4cnM3?=
 =?utf-8?B?d3NablJLOVc1ZndPMWg4STVKdlhsWjdXZ0VNcFZPR01HQ0dqa3FYdUxJT21M?=
 =?utf-8?B?ZFZQY21qcWw0V1ozN0o5VmVpOXd6dXdRMkk2TjJTTXd4Zy96UmVZcDA0bTdu?=
 =?utf-8?B?bnpxT1RVV1lmOFNrMTNyUnQ1c3ZURURtczdhY0NBb0tQUmlHNkJVSU5aVnU2?=
 =?utf-8?B?WXFkN3VqM3Q3d3RmUE0wdmV4V3FWbnBaN2F2R1VQWlVDS29YdERJcmgwWGd6?=
 =?utf-8?B?MTNoN3FDYjZYa1ZIVkdFblczRGFGdFZuK29lMzIya1hxdjd5ZnBFK25Wc2xs?=
 =?utf-8?B?cXVvNEpIQmY3SndVdlEvbnVQZHVmUGcxQWhqc1B1c0VZL0tGVEtuREt6ZFNW?=
 =?utf-8?B?OTViT2VNc0F6dHFCQjlENU44WlZjYnUvSE9VZTBaNGxpSUx2eVY2SXJuL1Zp?=
 =?utf-8?B?dzI0Z080ZWxXMWdsaGFvSTA4K0JUcmt5bm5CSUowUEtBb3dSSEN2TWZBRVZy?=
 =?utf-8?B?N0pHcWgvVURqVHREcGpQOGpNYk0ybjFQSkgrSU5lbnQyVC9HL3JJSzV2d1Zl?=
 =?utf-8?B?QWMxaW5UVTNteDYvMzFqcmdqanEyK0dvUVdObUw4N0Q5OGQwRzcxTFNnakVC?=
 =?utf-8?B?RkMyZUdnY25nbWExc1owVnp5eHJKeUhSVXFpc3RWamVOZGlqcVM2RUFNRmdR?=
 =?utf-8?B?SGRnNXZKQXp3WjUrYkFXdUJodU96djVjNGZRN3dvZmprQWJlWktQcjRhM1Bx?=
 =?utf-8?B?dllzZTgvZ1MwdEtDeFNKSUFiS1o5bFhpT2U4Z0d5VWw0M1BFbkdSRUxxVGx5?=
 =?utf-8?B?QS9zZ2xmMG9NcWcvV2xpZ2J4S1BEOXpDdVpxbEdSMUNOb1lJWUtaVlc4ZG1X?=
 =?utf-8?B?LzJkcE92ZEhtKzNkVFRQelVwQXY3RmVtc1VpM1p2YlBrRGs2bTdkM0V6Zmls?=
 =?utf-8?B?Nk10Ky9KcDFqdFJMM2FFMXJXSWVEVlRIejJiN09HYkQrQXBOcVBTNThxdG5k?=
 =?utf-8?Q?C1A9tMkpxSp2cw5DbmOVEcsVDdVS3dAD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6559042d-ab46-43a4-b55e-08d9955b18f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 12:54:34.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrew.cooper3@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3941
X-OriginatorOrg: citrix.com

On 22/10/2021 00:08, Stefano Stabellini wrote:
> +RUN \
> +  # apk
> +  apk update && \
> +  \
> +  # xen runtime deps
> +  apk add musl && \
> +  apk add openrc && \
> +  apk add busybox && \
> +  apk add sudo && \
> +  apk add dbus && \
> +  apk add bash && \
> +  apk add python2 && \
> +  # gettext for Xen < 4.13
> +  apk add gettext && \

Unless we're planning on backporting this to staging-4.13, we can drop
gettext.  (That's the whole point of the comments highlighting version)

~Andrew

