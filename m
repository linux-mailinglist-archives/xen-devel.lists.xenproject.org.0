Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73244D4CA3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 16:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288430.489072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKS9-0006vS-VG; Thu, 10 Mar 2022 15:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288430.489072; Thu, 10 Mar 2022 15:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKS9-0006tb-RV; Thu, 10 Mar 2022 15:11:45 +0000
Received: by outflank-mailman (input) for mailman id 288430;
 Thu, 10 Mar 2022 15:11:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSKS8-0006dy-PJ
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 15:11:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d4ec551-a084-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 16:11:30 +0100 (CET)
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
X-Inumbo-ID: 5d4ec551-a084-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646925103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GbMTP6W7ZSddYtznbDAcAhdWrF1w25AtQwobW6NsGfM=;
  b=MKBQIvblvB9IlNnBA6Kx+zQZAaCHAvrxtcqgARJxzV7OcKB+dVefL30+
   EPolCaKqxUxpEsva5vrbt/sONIqIsoiyaxwO2qkyhikPdvLb4z3mHBX0h
   HiBKLBNXJatxlhbyC0eca34W3ZFlT9WoSlRKDDqq31X2OgH75D0Ur64Vq
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65923548
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6iso96Cd5V6QnBVW/zLjw5YqxClBgxIJ4kV8jS/XYbTApG501GAHy
 GJNXj2GPq3fN2L8ctp0bY/i8ktQ7ZPdzYAyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPht0
 /x8r6KxZT0zHaTIt/xEfQBBCAZxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWZq3Z0STZ4yY
 eIHU2VeSBrKQyZXI2wIMswGuf2yhSfGJmgwRFW9+vNsvjm7IBZK+LTqPdDYfvSDQMxHmUDeq
 m+u12f+BAsTOJqAyD6G2nW2j+TLkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS9Bqk+7Dq4iqjHEsNShFZMfI/rdQRSml/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEsoji6rnXyESwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpaKWKwO
 xSL51MPjHO2AJdMRfUnC25WI552pZUM6Py/DqyEBjawSsQZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dVKfA5QciRjW8yeRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:4yYXAag+BoAbK1oTbo9LNrH1+nBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhQYtKPTOWxVdASbsN0WKM+UyHJ8STzJ8+6U
 4kSdkENDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHtXgslbnnlE422gYypLrWd9dP8E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSLOMB20ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65923548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIg/p07TqaXhi2rotEG8q51luUv+aJqcI0NRkE9s4qB7suMjtO0jeUE1/p3F9fKHZiLDAx1U5VCt+TraQThbf8tuVTgujg97bXCPlF+4Ze/8BwKOn5q7uJff5hfYjNX5PqNeUO23PnTN/qI0e61t9bZe6yTqSfxygNwRqC7KTmDfUcY7ehasFtr9A0HVG59/U57N12sZou3dP8Fbc392eoAnbL7uFJ3keTeCPRLmdoo/2VxUogfU12tlZsWaVyTKLyrIdroPiZYvV6gE5TN95/zMxlpbUcCuK80u6LuwVAZMgnTtrLRH9/mUEoG03gjwYSbEWn5Ifh6tYiwrIZzZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPIrQ2uUJcoC3uPyB57aRxa3Wp1cquKb0s6A4/jRqUY=;
 b=NxmmD28ZgdFk2qdxSDGlXXzZE2AVaTxY0YOzbehPxsdl0NJM6ugm3nr0KsxNRe9J0+wP5y+11kAD55zGnhImn3tAUsn9PDY0Es52lHIqCvMjI/w2FGKyALaGcTqyMW+uXblWFRMn5sLvGWcWwJKb1cPemIzzKeVAb3YUT/rZYxWMaRwFFkrUXzLLwsprh/dkTRKroihr33LHgBLFlyPLxeEzPopWUAuurVlV3Mbhva/NuBoKJ3YtXGlDQ8Xou+8K++uBK8Cw61WgDG5d/HQteC5f9HLOuWVsxqg+DP7dxXeZUnmzeJo5nWeTYrfewvcj24qAlho1v+MYJVBxtD/xJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPIrQ2uUJcoC3uPyB57aRxa3Wp1cquKb0s6A4/jRqUY=;
 b=QGai4kAFlCO+1qSsnDHmBEwrqiZoN230hf/xbLPkBtAQFw2fW8qew5S3O0n+ybTdYYKZhvAWIC4Qvn6zvpIEYgnnY8zCyr4rpv8fj1a1Mzup9cKbdxM3yMCH4QOW9jACpIhibsF/p4CnadM/mbZk9E9ceK0vtJF3NzW39z4XQAg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <doebel@amazon.de>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 1/3] livepatch: use basename to perform object file matching
Date: Thu, 10 Mar 2022 16:08:32 +0100
Message-ID: <20220310150834.98815-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310150834.98815-1-roger.pau@citrix.com>
References: <20220310150834.98815-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e61a2442-5848-46eb-d87a-08da02a846fa
X-MS-TrafficTypeDiagnostic: BYAPR03MB3624:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3624E0DE77C14D5052B6414E8F0B9@BYAPR03MB3624.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/iuhW7NSgEXq6ixZHL7SLTuDBhtYdLTHUANRQjw5n4cBnJvTHO8CBtHJBwY2eqUIhQ66gUdlRWsHf7czj0h91LN6I8b0+xprDeGMchYnYlazS42LLVX0oiDoC1EC4loGExjkOxtEOAdP5gfojyZXi4hXG2vKOUyNz+dBiQFSZr61sAxR9RvIXmlUnuSftaAhznIINwtoTey88KEiFXm2a3Zj9qFoPPForBogDyI5sLpcKOO9Y5QjtJUBFUmyhXaU2D0dINmOtAP8fCYArlViO4dEh/xMqQBXp+ZvzfjIhXBWkN69tNMPGrp3ELIYjVWpZhAVYD7xfFrtqNzGzkhqcXjDiiUWNcbMnhquteTDo3hjeKypSgIuk8Cnt0N2bvr/TdLwJN15LbYK26wAGVNw56nSGpS+bHV77EkH3fXWwHyWTJREF0YqyIkh0U+zjBkms0Ee4n14tDC41swMCaHgaPUcU+v5Jfoi7npvfGUo//5C+eHXj/Bpe8PGwS9k7r6yPCLZ8WJcj5k6tsWZzJ6rUeu6LBA6S9uUTDiMGWyCR0OlwuCj5VetwU16HsLnwx9nIfl9TvtDVhnmh3rIwFOKhr2bhYfXQwJ41vAnGKb8nLuESV64uiYEinF+0vtf4PTYi0ZGaKQn8jZIOOVMV01cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(186003)(2616005)(26005)(1076003)(86362001)(38100700002)(107886003)(5660300002)(6506007)(2906002)(6666004)(66556008)(8676002)(4326008)(66946007)(66476007)(6486002)(36756003)(316002)(54906003)(6916009)(82960400001)(8936002)(508600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHNCcU80VUxOR0pHZmhISmZXZ1JDYWxKOVlGejIxelpXNTVqOU50QlEvQktr?=
 =?utf-8?B?Y0s3cGltRW9nSC9kZkx3NzZuMU10WkEzUmNzMVhLMEg5THVXK3pWaDNhNkpK?=
 =?utf-8?B?MjY4ZlFNblJBbGw4NXQxcHpLOVl6eEhPcjV3TFE0ODlaQm5pYVRCdXBWb0Ni?=
 =?utf-8?B?cHJ5cVhmeUJITkpjcm5RSXlIQnl6MjkwOXRCME9FbXEyQndLaHUzZjZhNVJl?=
 =?utf-8?B?VGtQeS8yTDgvRCtjUnhEYXdOQmZOWk94S25qSkFUU3JkZ05uNGYraWZMZUFY?=
 =?utf-8?B?TTNVWDNhblpYUURMS1I3UVVxMFRnZ05PTEdsOVI5WVR3MTJzM2gyaGNXNlhF?=
 =?utf-8?B?a1ZVcmdWbStnOUJ2UmNGY2l5K2tNZ2M2ZkxHSVRUQzQwOHB5amJoL1E0M2tT?=
 =?utf-8?B?TmEwR1VvN21FLytGQVdjQldhM09BVWhYUHIybVBrOGxyY1I5UVFkdWhYOVox?=
 =?utf-8?B?Q0hCVzBCRkhaUUpwNGFNRVFRRm1LbDRrNzhkT0ZKWmhRM08zbTM1NWV1bURV?=
 =?utf-8?B?djVPRnhqQ1JSbm9QTWdaclNuZUJkNndOS1JWUjR3cEIyd3RqanA5dW9IbFZm?=
 =?utf-8?B?WVp5em9Lcm4rVTlKQUdyRGxaR0JBWFJ1RnRSL25RWnZjaHlvZitidXVrcHlC?=
 =?utf-8?B?ZHBDek5KNHp1a2pXbWxab25hU0JwZGJHcEdRZkNob2oxU3p5N1dLRVlyYlZY?=
 =?utf-8?B?VzVsUk44NTJLUzJMR0hDd2ZUeDA3SnN4MHFwM3lxY0pwSGlwcElRREk1Y3VZ?=
 =?utf-8?B?Y1ZKUEZRSmhDdHAyMzdWclZOenUwZDFpYUtKK0JtQStwWE9nZmpaSXRRSENP?=
 =?utf-8?B?Sm1PZFJoaFRQbzdIaC8vS2R5MTdlSU0wb3ptOVh2WmZpZHpMTlVhK0pPNDJH?=
 =?utf-8?B?OG5WWmE0dEt4Mm5KKzVnV1JiOFhNTW5SeGpDdklNZWJ1NXhzT2EvLzFNSllC?=
 =?utf-8?B?aW1Eek9sNUhJaWJ4YUdxZm1Dd2xEYVcwRDErOUswVXVnNXlVOXptcFhmbG51?=
 =?utf-8?B?aXN4VVY3cGhDVXpCbVF0eERKTmpjdEY3V2wwWTlHUERlTkJ5Uk5nZ0ZZVlBX?=
 =?utf-8?B?WEpuM2JodG44dFAyMzFoVnk5QVdhQkhkTlZkcXhhb1kzeXJVVjJ6aElCNVpE?=
 =?utf-8?B?T21wTlZTQUQ5VUMvbkl2TzFYL1ZFZm1QSjFha24rOEtOT3dzVFk4ZEQ0TTQ4?=
 =?utf-8?B?ZXhGUSswWnBScnlYazNZUTl6WnQ2U0lSL0hBOG82Y2JiMmdERnhQNGxiNjcr?=
 =?utf-8?B?ZTVNN2NmZzF1RGJJOE43d09JZW16cW9DN2IwS0VNT0NYN3JaTjhENEMwejMx?=
 =?utf-8?B?dzlPR0pIL3JlQzUxd0lTd3huTzhoY0p1eEtza3l6SE0rb2pLa25kYVI1Q21w?=
 =?utf-8?B?UWMxVVNCVFBjZ0x2NHJSZW1vQloyTGZuUGQ4Z3BONHY4ZllaTElqVktYekZM?=
 =?utf-8?B?VUppVW8wcERFZnE1NCtWWVhoOVYremZJcXkvUVdMZTRvME1wSnlJYmRTT2h6?=
 =?utf-8?B?cnd0OVd6aHFrYUVJTTBMUm54WGxXdGc2ZlFJQjZpa082ZE9NRG5YVmtrQWs0?=
 =?utf-8?B?UTVlTHpIZE1NcURSTEF2VnUxUlYybXhyeGNoanRLSmtaMFFCaDFMRW82dWlj?=
 =?utf-8?B?SG5NbytGRGhUa1BmcFFnNVg2YTR0d2dLZVI0MXZRR3MyT2x5d3p6c1ZaekYw?=
 =?utf-8?B?WVpSMENDWmlESEVNU016ZjkwdTYrd0xkZHVCRGl0eXUwMGoxRC9CbEtWMHhS?=
 =?utf-8?B?V05palBJMW5HUStnbzFIR01yZ3hDYWx3NEVQSG1OcHBOdVJiYUdIZEF4a1ZU?=
 =?utf-8?B?UnlIeW41dEQ1cU1rTk94VlhKVTZrMUp0bSs4dklpdEVkVDhZNFE5eFdQZkYw?=
 =?utf-8?B?NUlBNml6N0h1YkJtWmljeXkyZS9SWjJnaG9YWTV0bnFVVlZwMk9SMitTNVZt?=
 =?utf-8?B?UnNNYVN2WXIxM0RLdG85ak9zUGsvTVQrQVk1WXZFUGR1dXVSM1QwcXhjVDNV?=
 =?utf-8?B?YTdPVE9jNTZ3Mk1pU1pHRWs5ZWdLWG4vUGJjUDNSK2UrVU9wam5xOCtlZzNa?=
 =?utf-8?B?WVFONjhhV1RFSTUrQk53ZVlDQ3JkdGdOd084Nk1JL2E5MDBWZmhQWTYzS3JY?=
 =?utf-8?B?ZzgvRVRXMWZNdU5pekZqWk81bUhXT3dlWW9zSjgxUUFuS2FTWENoSzhKZHVL?=
 =?utf-8?Q?0VhlCHEKQM53P0/4bKLjnAw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e61a2442-5848-46eb-d87a-08da02a846fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:11:39.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOV7jaF6TLwjlpO7RBw0EMBLWxs5v0aK/J+Xe8cZAsvSiGsnXW5dclJRqF8NCNs9dgJO5CF4Yhz4F3t7PBWHgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3624
X-OriginatorOrg: citrix.com

The changes in the Xen build logic has resulted in the compiler and
objcopy being called from xen/ instead of relative to each object
directory. This requires using basename so that the directory is not
taken into account when checking against the list of files to be
explicitly ignored.

Also adjust the paths used to store the differing object files, as
with the current logic the resulting path will be wrong when using
newer Xen versions, changed_objs would end containing entries like:

xen/arch/x86/hvm/vmx/arch/x86/hvm/vmx/vmx.o

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-gcc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/livepatch-gcc b/livepatch-gcc
index 91333d5..fe782e0 100755
--- a/livepatch-gcc
+++ b/livepatch-gcc
@@ -32,10 +32,10 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
         if [ "$1" = "-o" ]; then
             obj=$2
             [[ $2 = */.tmp_*.o ]] && obj=${2/.tmp_/}
-            case "$obj" in
+            case "$(basename $obj)" in
             version.o|\
             debug.o|\
-            efi/check.o|\
+            check.o|\
             *.xen-syms.*.o|\
             *.xen.efi.*.o|\
             built_in.o|\
@@ -46,6 +46,7 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
             *.o)
                 path="$(pwd)/$(dirname $obj)"
                 dir="${path#$LIVEPATCH_BUILD_DIR}"
+                obj=$(basename $obj)
                 if [ -n "$LIVEPATCH_CAPTURE_DIR" -a -d "$LIVEPATCH_CAPTURE_DIR" ]; then
                     echo "$dir/$obj" >> "${LIVEPATCH_CAPTURE_DIR}/changed_objs"
                     keep=yes
@@ -61,15 +62,16 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
 done
 elif [[ "$TOOLCHAINCMD" =~ $OBJCOPY_RE ]] ; then
     obj="${!#}"
-    case "$obj" in
+    case "$(basename $obj)" in
         version.o|\
         debug.o|\
-        efi/check.o|\
+        check.o|\
         .*.o)
             ;;
         *.o)
             path="$(pwd)/$(dirname $obj)"
             dir="${path#$LIVEPATCH_BUILD_DIR}"
+            obj=$(basename $obj)
             if [ -n "$LIVEPATCH_CAPTURE_DIR" -a -d "$LIVEPATCH_CAPTURE_DIR" ]; then
                 echo "$dir/$obj" >> "${LIVEPATCH_CAPTURE_DIR}/changed_objs"
                 keep=yes
@@ -85,7 +87,7 @@ ret="$?"
 
 if [[ "$keep" = "yes" ]] ; then
     mkdir -p "$(dirname $LIVEPATCH_CAPTURE_DIR/$dir/$obj)"
-    cp "$obj" "$LIVEPATCH_CAPTURE_DIR/$dir/$obj"
+    cp "$path/$obj" "$LIVEPATCH_CAPTURE_DIR/$dir/$obj"
 fi
 
 exit "$ret"
-- 
2.34.1


