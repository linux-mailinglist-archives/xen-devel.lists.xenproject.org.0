Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9C3500F9B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 15:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304765.519507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezZa-0004UL-06; Thu, 14 Apr 2022 13:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304765.519507; Thu, 14 Apr 2022 13:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezZZ-0004Rl-Su; Thu, 14 Apr 2022 13:31:45 +0000
Received: by outflank-mailman (input) for mailman id 304765;
 Thu, 14 Apr 2022 13:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xO=UY=citrix.com=prvs=09619e58f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nezZZ-0004Rf-0E
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 13:31:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c69ede-bbf7-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 15:31:43 +0200 (CEST)
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
X-Inumbo-ID: 37c69ede-bbf7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649943102;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wFbRS81tc/ctaXUsSc6IwDd6maKUYxC/XjgjJbUtGdc=;
  b=M2ewaiiYIiLTtuTg3BDK6IR8QiQ1rx/xjDb1dDwGOltoOUhek8sV2Mkl
   BniUAyVtb34KD2eZGtN6CTZ8/xgObWe5F6dQrueDM+WmatAlk2YkDVmWB
   gEdxWgB32GE/4Ju+mRwPg7szqwtkHHRKrlbMdA+1UXXZ7pdR9VDkEe+QZ
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69362062
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S6WxnKAUU9HZwRVW/z7jw5YqxClBgxIJ4kV8jS/XYbTApDx2hTRWz
 WofCDzQb/qOajf0edh+bo2yo0gEv5SHxodiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhNi
 4QQnqG8QDsqZKHAkdxNczp3KyBhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjWxu3JgQR54yY
 eIzbSczTRjsPCFUP01NGbk4hfyxi3rGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiELH70M3ZtZZL+5g5A2E8vr0wCmhB3dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94afe51qXHb4
 hA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSLyLdoIuW8ifxw0WirhRdMPS
 BWC0e+2zMUNVEZGkIctO97hYyjU5fWI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5LTlU4OAbGkP3G/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:Iqzgaq3cN69pkUgWRohXDgqjBVZyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdLz2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P70rhJJGdZQ8qPSMexnwqDL3QSuvyAfcZek600ykke+C3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="69362062"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMVLdB7XeTsmkz5H0I6UxpmDUWDUUaEn1XwI3UG0mufFstPfuQkPqvB4s9Rwpr70P17FGsD9251XFEx+xONR5S2/jEL0s6Cz/H91B/pGrdOHL3BNzQd4A58C2eoM93r/4M5+nFHFDWd5spsPeaGofTrQQYuYuMksVTcd6bEcs0Bi0AuycW7ltu23ptaEASxk9Ifv5oFP+Rg/X5MfhLYXoyUJJnHNBgYmvBpgFcTHj6CuDd28ufTQ7AhXHeSOznk02P8xeKyH2xAe7uL1rztFd6jE5lCts9u3Tt3SGECIngnwY5bm2RMvk8S7qC0c/mNAFDh/ZUM3P/C7KWMDUe5+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwbesW5ci+kI4wB9TlzPPdzmxtvc5rCl/tLeAoijQ+4=;
 b=ilhd2DX9kQBZlpanm/WHNRrZUsP01XYKp0Kolewut7QxdgboMhcI/cFHmKRLgf7DVhR8aP6z1xDIhf8QOFsWKwBSdBx5VXi/UKFyU2YY4sE5qpMpuVfYCG6bEak7MRRzicstOpkQsNGx+7XHm/GNmW2g9xY5fGDdUVX1COIp5kVFdfyx3CLmKQVTEdqkLm6lX4yH+2QuJUjSjEbLDfYyo4YJfaFyzwLQ9fSlW+Go07Oc9D543IgRey1S89hXmycl/YhG0sxoDMT0Q/5v0afTTclwdwPQ8DKrQNFzD9RpiGl9gJYPa+TerFsDf0akc0yafodaNYJtHgo+ToEKQyQ4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwbesW5ci+kI4wB9TlzPPdzmxtvc5rCl/tLeAoijQ+4=;
 b=QuoE1ljBiUM+gcbhBk9E5ZWMmBceG6aA4mCuUZL3745YQY3Iq8TrHvxmd42wTix2jg+BeUNtlB2mkFnUIakGqYYQCmGLAHNziUq89X8xRRGF1BqwDG1zeJ/oLXJmAqgcPTPTcysHvt2R4JBxPJ+iQHkd8qFt/R4CnJLXKMO81Co=
Date: Thu, 14 Apr 2022 15:31:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Message-ID: <YlgiLhvsKVYKKvrr@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
 <YlgWKGmR+u41zSsw@Air-de-Roger>
 <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
X-ClientProxiedBy: LO4P123CA0478.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26a943a9-68e5-467e-1b8e-08da1e1b15bd
X-MS-TrafficTypeDiagnostic: BN7PR03MB4372:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB43722C11F10AF903C5F02DFB8FEF9@BN7PR03MB4372.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UnqXDrqsMzYwic+6N6IXjCWVdJR/pR6ZNrdWwPsWejrXOLP5J8ARPQJmT3BtaLLnQIbWGUdC73HnWr48TXBonQSPWswYtmlBDJ+R8E84t4kByPnmk3qTQtsjAY2S5VLMRUnDY7RqYW/b8EV+tVPTeA+WOxaDyOoiglMXTKOcnCmLCRQo1Ev3bH57BpnJhc+FrNY2xuqIN/KI0RBeNOJUK+iR+NlezzWmdFpCzOTdz4Q9QXmcg2W2tJfAamnJ1aWjkNsUhUT8X3XKfVxsP6Uiv+eufqxaPE4YQ6/NiF8Ol+LUt9KjI+3s1Be9sjkk2C7go1PspRCJJwSMiffPDj0ShjqAtKT9JJvUSam2L3QOEOcZW0EUp1WZwZ9kJV1CehWwd7jtTuq09dMfFtu78jdTWOlxIk9CDZigsdPhql1UgxsYEbjUhMvnwgqjUWvrNJKchF279+83Dm0wfcL9tN2IRzgvl5p8GcWQJCTZI11rShzTCHAcmGljOQVWsyvFV5bvHKsunxtkyZgTW5gdJBzR71ibIDpEJuo/GaiIizESDIBdjjoDcTjxac2S15n+k5tVFOaScQ30srrWRSqJkoCxvmjU7Nc9q75jTlWJdois4eUR2xe6ZWddThHO/EVeZKigF+74sCtRjwZanflNxQNV35d7dxWbjk1WoXa4L0bOTcPB6DDgVVLTqyL4/rpcN/TNg2h3WGxBlzUWuJnub9cvRL2PYQlJza8DpBu/WXOUrDCoNcDRKD8rxQziueShNrHs16Qy66XzaVL+kdna3iR875oQCGd5x2GP6XciPIKlQJdW04mFzC5LGd7RtkvT0H3TARQlBBzJfn4jfj+QcEXqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(66946007)(26005)(186003)(8936002)(33716001)(2906002)(82960400001)(83380400001)(38100700002)(66556008)(4326008)(6666004)(86362001)(508600001)(8676002)(6916009)(966005)(54906003)(66476007)(9686003)(53546011)(6512007)(316002)(5660300002)(6486002)(85182001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkNNbTV1dVdVVlc4Vnp2d3ZTS1B2RjFxdVFJWDQxYTY2L1Q5ME1QV3FwZjZT?=
 =?utf-8?B?dWFCTFhmUUY0OHVnbkIxVG5EcmVnWmpRVWJ4TWh5NkE2aUdlK09rcUsrUWk4?=
 =?utf-8?B?aDZiTlBPcGZocUhLZmNrdXI4VTBBR0o0WmhqeXJHL2NwdStaaUxKcmFQM0RP?=
 =?utf-8?B?VGpWSkdHLzhaY2F5QjJlYjZQbnByYTA2eXFFUmtWL0tENzJkWEJzYWN4YVlK?=
 =?utf-8?B?TkI1endHQ3lza2dsSG4zZnAyTGxqRUxOTzZ6amp0RUM0RVhUL3VHV29oRUNs?=
 =?utf-8?B?STJaWTUwMG40eDFkZkMxR1ArU0dVVjRmaXJRdG1ReUk0TlpTOFk3bVpoaGpQ?=
 =?utf-8?B?QmFSMlBlRzBSTldYM2tRdERtZmx5WnNnSUtNeW9hamJNcHlJdFQ3dGgxQ0o5?=
 =?utf-8?B?QTZLOUZZejlEd0RvYnVZandjOGpxUEE4WU8yeEphVmQvcXdGUjlHUzJTQlVD?=
 =?utf-8?B?VndwRWxrcGJHa3BVU0h6eE9DNXVoMjYvcFptMVhISmcrZkhDQjk4a3JZVC9y?=
 =?utf-8?B?SjJjZVY4dEJDVjJUN2U1eWoveU1qMVJDU3JkTDM2Mzd0TWtxcGpjNHl6R2Qy?=
 =?utf-8?B?OFByQldET1FCbUhiUWIzVUxZdDBzZ2k5TmUzSUVhU1FFQktxSnRaZFlrS20z?=
 =?utf-8?B?T1VjeDRVUmMvcldod1IxKzJubWZreGFxcjZlUVlEZFdjVXdrMXFodVkzR0No?=
 =?utf-8?B?MkVIOG0vMjVWZHg2ZW9hKytjSkFySktNS0crZTg2TkM1b1FpSzhVZjFwT1hj?=
 =?utf-8?B?T1R3VDJFcjJabTlzKzBEUXJUMDR5S1BDakRLQSt5TnR2WWFNSkprVUVmQ3U4?=
 =?utf-8?B?dmJIcG9kTWRYcUZwU0UyNjBQVjZQeDR0NjVwRTNhZ0Z0QnhiT0NrWUF0bk1k?=
 =?utf-8?B?OTBoNkIrTzBORWFVT2JTeFZ2SHdwSVorY0FDbFR4cUFEMk9HRWZFRlZmSWNN?=
 =?utf-8?B?UjI3b3RJUDc4L0VzZWp5SGUrdEFjMHczZjlMTXNBcWVxdER0MGd5UXMyRFVD?=
 =?utf-8?B?ajV4c3pmd0RPemtvR2p1QXNxdlpXMHkyd215UkZWcUIvWitEZlVWT1poeWp2?=
 =?utf-8?B?SkNmMmJNWW1WeHBwNlhGaE0xY1B5NGI0WmlDd2JPSzdRalNXWnZiTTkrUUtY?=
 =?utf-8?B?c0ZKQTlUc0s0SW1Gb29CNlNtOUQ2VTBYalZJQ2RFRWpyOThzV2dMOFdhSVUy?=
 =?utf-8?B?ODNIeTUwNWdnc3d0ZEJLZWJ6aFBPM0lybGNqbStIcHVGWldCeGRGZHl6WnZu?=
 =?utf-8?B?YXhWRWVaVEcxZHJGdVN0TWtGNzh3TGc0Q2hDNi93c0VDdWVLc2dDeXJmSVkv?=
 =?utf-8?B?Q0tLVmJGZEhHMm1QeFVzdCt2emx5andxMkJRTTRaTVRMZjRzU0FZRWN0bnhH?=
 =?utf-8?B?UWVIK1cyNVJkcjlsOUpLNWs0aUhNQTQ0cm9QS1FJdjdVOFlzeGl4YkxmUjR3?=
 =?utf-8?B?RkNSVURNWi9xM2JPRGhabXJQaDdreHA3N3JBckpqMndxbml1cElORHJuS212?=
 =?utf-8?B?M1l2NmJFSG1KZlZwSmZhTVhIdjZabkh5UFliSDNvM2VHZURkSHI5RmVPb1k1?=
 =?utf-8?B?ZjVRQTlZVnM4MU5mR250ZWRTd2hUNGFxWGZDcm5kTWhDcWo3b2I5d3hDZVEz?=
 =?utf-8?B?Z3h6R3Frb1pvWWZieHJ1RWg0ckJNTW5CVWQ3VTltLzNUekVNZUxxY1ozOVQ3?=
 =?utf-8?B?WjJsWHl2SXIxaW1LUEVGaVJTd3BkNGt6UXFHc3NjTGU3T0dUMjlYT2VXTmh1?=
 =?utf-8?B?K0NlVlg5R2JMaWNTb08wUFJjR1dFSGtBb05FOWhYQkxpblphL2F5SXRETlJN?=
 =?utf-8?B?MXAxbVBIZ1dPWno1SmQ1ZXNyaUY0RTlrK0lyMFZlMWdkenZNdk1NZnZGQXRN?=
 =?utf-8?B?Tjl0cWhEd2luS2lubkxJczZ6RTFkY1FzK2svZUtjZml0UXJOS2ViZmdqUFBq?=
 =?utf-8?B?Nm9QWVN1NFN1a0lpT2trM0o4TTJrWkN3YlI5QjhlakVIZDFLcCtPdGpOMFUr?=
 =?utf-8?B?TzR2SVRPUDZnS2V5QUV0YXBNL1F4dGw4ZGZZNWJzZmxleXJjem5pNzFaK1cz?=
 =?utf-8?B?RlRHdk85anl1UkladUd0SG1qWkx1L3JuOVJUbVRFS0NqV1Z1eTdLNmY1UVAr?=
 =?utf-8?B?aHUvSkJaaklwTXRFa1FJaGtleXRpZmwyMS84OUlNaDJ1SzZTb2x2clpCSS9i?=
 =?utf-8?B?VGlhVVJhRlIzUm5HcGpGV3R0RHBGaVVsbnVVQzM3czJRQnZ1Z3RaZk1udmtQ?=
 =?utf-8?B?bXprVjNDYVZxUkIzcnFZZGl0WVhreFljcXZJQnQvZ0l1ZUp3QXg3em1Fd3pM?=
 =?utf-8?B?VGRtN3k0M3psNWIwaTIyaWtqZUxkNm9IaW5FODYxNU9seWF5WEFPZy83M2JT?=
 =?utf-8?Q?nW+EGWLbT0vr9PFo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a943a9-68e5-467e-1b8e-08da1e1b15bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:31:30.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtZg8BjoXHsIaURzxhWdMkRpHu57MDb7xZakk2L21oJYmZjXKpAZJfFDId61nSL4gra+w2FV+clNcDO73riGWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4372
X-OriginatorOrg: citrix.com

On Thu, Apr 14, 2022 at 02:52:47PM +0200, Jan Beulich wrote:
> On 14.04.2022 14:40, Roger Pau Monné wrote:
> > On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
> >> While future gas versions will allow line number information to be
> >> generated for all instances of .irp and alike [1][2], the same isn't
> >> true (nor immediately intended) for .macro [3]. Hence macros, when they
> >> do more than just invoke another macro or issue an individual insn, want
> >> to have .line directives (in header files also .file ones) in place.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=7992631e8c0b0e711fbaba991348ef6f6e583725
> >> [2] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=2ee1792bec225ea19c71095cee5a3a9ae6df7c59
> >> [3] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=6d1ace6861e999361b30d1bc27459ab8094e0d4a
> >> ---
> >> Using .file has the perhaps undesirable side effect of generating a fair
> >> amount of (all identical) STT_FILE entries in the symbol table. We also
> >> can't use the supposedly assembler-internal (and hence undocumented)
> >> .appfile anymore, as it was removed [4]. Note that .linefile (also
> >> internal/undocumented) as well as the "# <line> <file>" constructs the
> >> compiler emits, leading to .linefile insertion by the assembler, aren't
> >> of use anyway as these are processed and purged when processing .macro
> >> [3].
> >>
> >> [4] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=c39e89c3aaa3a6790f85e80f2da5022bc4bce38b
> >>
> >> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> >> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> >> @@ -24,6 +24,8 @@
> >>  #include <asm/msr-index.h>
> >>  #include <asm/spec_ctrl.h>
> >>  
> >> +#define FILE_AND_LINE .file __FILE__; .line __LINE__
> > 
> > Seeing as this seems to get added to all macros below, I guess you did
> > consider (and discarded) introducing a preprocessor macro do to the
> > asm macro definitons:
> > 
> > #define DECLARE_MACRO(n, ...) \
> > .macro n __VA_ARGS__ \
> >     .file __FILE__; .line __LINE__
> 
> No, I didn't even consider that. I view such as too obfuscating - there's
> then e.g. no visual match with the .endm. Furthermore, as outlined in the
> description, I don't think this wants applying uniformly. There are
> macros which better don't have this added. Yet I also would prefer to not
> end up with a mix of .macro and DECLARE_MACRO().

I think it's a dummy question, but why would we want to add this to
some macros?

Isn't it better to always have the file and line reference where the
macro gets used?

Thanks, Roger.

