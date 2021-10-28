Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6FD43DE8E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 12:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217803.377985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2TG-0004u2-RC; Thu, 28 Oct 2021 10:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217803.377985; Thu, 28 Oct 2021 10:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2TG-0004rE-Nx; Thu, 28 Oct 2021 10:17:18 +0000
Received: by outflank-mailman (input) for mailman id 217803;
 Thu, 28 Oct 2021 10:17:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mg2TF-0004r8-Gx
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 10:17:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 392c3aee-37d8-11ec-849d-12813bfff9fa;
 Thu, 28 Oct 2021 10:17:16 +0000 (UTC)
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
X-Inumbo-ID: 392c3aee-37d8-11ec-849d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635416236;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J7CX4NDYbpG+cUyO3uFKAvNC07glfsw82SVZwEnYpEw=;
  b=TY6xkrnxSUl+xlOs4nb9Wu8Sm1J8yN5A5Vn00L0wfmgY1o3TXPSHfSrP
   ORtLLMlpEE4Z+3edXKjt1cYOcMrr1wQwfiORTuk+P9OFEzu7VOv++Q5Vf
   2Poczda6LR4yaplaydptp1iunRDOD5G3DHkuAkmCWq1I8Dz6Lx/YOJXRA
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UmGIX/SdaBhY25QhGWEtlOpFIf8F0DyDVt+Jf7VoKUj9l331FN5v9JAxnq34KfmSSQJ6CVUXmf
 Qh2WfuNnY0zzUhLWkVxQOFqJlXApK/AaXJJkpWh9zujZQhqIQpP4d6Fje2JeKttzdM0AfdDTxm
 Fq+4cSVHOqqNVNW7QMNB/dpQGPzBtYu+Suw2SHuYPYTDfAtpTWUtlbxJEcl/nccKvVFyFKxtTc
 SaxlTb6sbVbUNiUc6AR9m4LoKbjAgYCIaNLywIp4N3/dZZSLuLQe1EfGPyBiU/5rlFlo/MKNjs
 uy1Um9uZqhlAjSnWZEoXfnWF
X-SBRS: 5.1
X-MesageID: 56534845
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HUl+EavliSf+u0kwhjGii4hIc+fnVLFZMUV32f8akzHdYApBsoF/q
 tZmKWrUb6uPZjH8c9pxOY23oExQ78PdnIVqSwRkrCk2HikQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24jhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npls8G2dSE2ebfwmeU5FAtGFhx+Oupp9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY254TRqqOO
 5dxhTxHQjLDIBRMPE8rJbERweCS10PDS35IgQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntQT/VYEJHbu07MlDhlGJ23cTAx0bU1i8ifShg0v4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJWTusGzh7K0JbV4iLeFHYBcz5GL/Mp4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZOndaFVptD83L5dhp1EqWH4kL/Lud14WtQVnNL
 ya2QD/Sbln5pfUA0Lmn5hj5ijaoq4mhouUdt1iPADzNAu+UYueYi22UBbrzsakowGWxFADpU
 J04dy62t7lm4Xalz3XlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfJGS3O
 BWI51IBuPe/2UdGi4csOupd7OxxlMDd+SnNDKiIPrKinLAoLGdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dgFXcyJjX8mq+6S6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMtsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:p21tFqHxgRjzhmd0pLqE1MeALOsnbusQ8zAXPidKOHhom62j5q
 WTdZsgpHzJYVoqOU3I+urvBEDjewK6yXcd2+B4V9qftWHdyQ2VxepZnOnfKlPbexEW39QtrJ
 uJLMNFY+EYd2IUsS9R2njBLz9a+rW6zJw=
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="56534845"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2D6vA0nNcGLC3MC8yiv68NBDrw0QKUxjix+2PO9H6kyjIyx9MMXFlIN3MA0B3NCXMeuk4pRTB2K3JX/nZlcPutibj4Kbya8vYKzJ6bPdbUjp3qkWxqyCfenSOz51YdCZwF9+q5BkIcGXfCD2/Qd4oVUrOjRzHvFsBSGLaGicHXWtWiwFekF7V4Bt4hyIC2bWo63q0T/94X5qYgm69YtWdlRipUlCNoqozQNt8EchrO8zjshx365c1f4sm5qZgLL7U/vUkDN+Xn7Mm/lj1Qkks3PHKdfgrS5cJfMLAiYcSceDTuDaPeY9bLNKCwN+Ys2QMAN7TC28dV1y90wrZsGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0esejLYCgZOnikz06LoxTp7WD4zGjIBFKxEULQIsOSM=;
 b=OZDQhAmZDnyYOheDkeKhVT5YzvuMH6EeK2y+9GyiX7W391GSRB3XJsTP10oYR001ZlGAXNYEmMA74alGYzc4rDRL0DCRzF05UyJHn00O7NtnyVanrJlRgrz/L2o68OiHgvnsP3U9R8B377Nmq1J2rCr8mhA84EbmA4FFVirnmy3hofWaW4VQ0bIBms7xAeACskBKBZcB4RTb6fqEwj7xEZ2daNgDRW76rrKGQVwvwjabfDL8Qb/fuDwFyOU876om7xIAJG91/bY7b3bIkPOhIDYdbz7tnsm5nV1dq8zOR9S1Aei669UNrh+TIXVGbdhayKpzgSsF3OTPm9tya4oSuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0esejLYCgZOnikz06LoxTp7WD4zGjIBFKxEULQIsOSM=;
 b=ty5KU9nR9y4gBTCT1Ie2S233lGQWjvE1xUpJ9z3q3GYlbbGneVHps2SoXeYX7kW3YEFTvgX2OiayCKkEF1LD9NGXJddnj8u3Ub6gtE7KkyMAbvgVXW+m+xjQfjUtc/ggfu9y2aHk8lM9b93+9ctsiydbuWPwx+QbCSMQ42I/m3I=
Date: Thu, 28 Oct 2021 12:17:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: vpci: Need for vpci_cancel_pending
Message-ID: <YXp4ovmIsHKTGiw0@Air-de-Roger>
References: <fd1328da-5ad3-62cc-28d6-0ec60e9ea582@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd1328da-5ad3-62cc-28d6-0ec60e9ea582@epam.com>
X-ClientProxiedBy: MR1P264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b327ac00-95a1-4f30-45fb-08d999fc1b2f
X-MS-TrafficTypeDiagnostic: DM4PR03MB5999:
X-Microsoft-Antispam-PRVS: <DM4PR03MB5999ED66CB7D4D9A058273EF8F869@DM4PR03MB5999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VnTErMV+0qBrAT7EE7IqVFPALvZR7fmk1G9Y4BLb58pLZNWCMhyGXMmVBh0x/MpyxU/uEbFgTVF2loctvjY65R4B/StpOWXppl/lKPDjFwz9kbAj7gPlprpJ0t19GC9YrWVC18xI1xftGwePXEEv2/sUjFUNuLwTcptA+LDr4kcVtc24Pnw7A82rHZLXXLAm0XccNCZLhQj9DxbyjD5hHqf5hINXutt96EnU5UzxVE5PypWymmaKYZPTqIfbBkv+nT04t79xBWNAsI2L2l/E/lywIHb3mLHR2BatCUPvtI+rCVyLJLePeN6LZLMH1iEr44Ll+P1JwAyHEmGCbMUtfidDVXNhP00TOGWuyjhttJ97Hn+tyo2q3FyiVv9rmhIeSQ+ImwCGYcwUD+wdktkbN3dXwLI/3czvdfbxJ0u46iCOUrpIgj5+EF+gR6swLlWgDXFmCSyB35JSRO168A4KohPQBLmI1DViDASXqW4WLd6YTulPA4ALBzt4gvFmG8DFd1+ZjnXnruSRDjlDBjZGPsraUt3qQbDMgz7IYciiEQn4MZJbOAvjEMRK5knAP+/Kgz5hQUdFgFpWuMZ44HTyURGxmSO+99JkD4VfRe0CqQ4PJcqhCKjxjxxVLHT/jeOtyXRdsmbthKTup1c2Zx9cnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66946007)(66476007)(6496006)(6916009)(316002)(66556008)(83380400001)(5660300002)(82960400001)(33716001)(2906002)(6486002)(85182001)(8936002)(26005)(86362001)(9686003)(38100700002)(956004)(508600001)(4326008)(186003)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTJSWjFKeGVnYzRqa081S2IwemZ2VzYxT1RtU0F4NTllY05XREJqbHlRc3U3?=
 =?utf-8?B?ZnlRT1VFTE96R1ppNlNKbGJxcEhRblA1Q3FHWmlQbUZEUXFzVkR0TERVL2NN?=
 =?utf-8?B?UHRxTUVrOGxESlZKOXhWQzRxS1BSTFFISlVCektiR0FSNVhqVjgzbzU3cG5F?=
 =?utf-8?B?RENsVUR6QkFLbDNVUHIxdlhDWWxlcG1PWlIvQ1hBK1hjN1Y1WkJsMGl4cGdm?=
 =?utf-8?B?WFI2eFJSend0QktMMlVmUnpCV3VBU2xDVUFjaldxdUtWbDVMTnR3VGZ3MmpC?=
 =?utf-8?B?ZGJZMnN4ZlZCQmZvQWRqNjRjUzk3VHkwVDdzbjI1eUZBK2c3czlsbHBXM0Rm?=
 =?utf-8?B?Qnl5VmJMOEtROEdZRUtlYno5aytXTmwyUmlvZGtWMmZBV0lWZTNvYkFLN3FX?=
 =?utf-8?B?Z09CSFV1YVpYeUd4YXhDUlVhU1lQamdlNW01SU5Id3M0Q2IrbnJrbjB3MFo0?=
 =?utf-8?B?U01FYVFuZ3RUUS9rSkdyVFVoa210ZFZuYjlCVVo1TnVaY3d0eG1Mb0Yxai9J?=
 =?utf-8?B?QkEyQXQ5TjRvQXNQUHUxMUN5MnBUeThNc1ZtRXBGcElCTE0rcTFGWXNHSkFZ?=
 =?utf-8?B?Vm5IeWhjUHBZOVBZczBGSTczYklHQXc2SDEvdHNVRlJIS3k2SHZYb3J6UGk3?=
 =?utf-8?B?ZHNFSTJwbHRabGNNSGZ1Wk1QdzlsNlNGeTByZHhhZnAxanpXcUM1VHpvQk8x?=
 =?utf-8?B?WW1IeFkzNDNIKzVKTUM2MU1xWWhVeHREODBwaTBoTUlTeTE3S0NJLzcyVmJW?=
 =?utf-8?B?QnpRRHQyUDZuSGw4bFhjTHRCVk1GRnJHciswMXcrTGxURXIwYWNtMUFaVk0v?=
 =?utf-8?B?ZGpRS0Y4K2RiQVEwcjNDb1pKV21kZG12NjV5Mk1TYk1ZOHc4cTFiRzMzem5I?=
 =?utf-8?B?QVdDL3U2NnhhcGtzTDJ5WUlCc3dBTFFsbGk1anZMVXhJQ2p4ZU9INDJCWTdV?=
 =?utf-8?B?YUE3VHFJUWlsK0huZHJadzd3eGVxTFBib0IyeGFpcDlKK3VhZnJoQ21ySHh2?=
 =?utf-8?B?Z0dtL043a2s1Q3FycGRBdE4vOThzem5kaFdjQk1VRVNYaDF6UVpFY1crSU5Q?=
 =?utf-8?B?RXZaM2hEZEpoN1g5OGVzc3Y2WXp4SFQwL1piY0VjZFBUYWJyMFcva1VyKzlw?=
 =?utf-8?B?aHlBL20zdmgxczF0TXlGSXM0V00xa0dWVXFTMFpTWk9WWTFCbkZCV0NNNVo3?=
 =?utf-8?B?ZDdmcXRKY0IxL25PNjVleExQR293UldSeXFBVHZkRitlT25FYVU1WXRWaHN5?=
 =?utf-8?B?Z3pQcG01eHFUMURoS2tXRWFpd1RhSEZ6R1AvMDg0NlU1YWVlOW5oZHJyN3o3?=
 =?utf-8?B?R2tFZkJMT3h5aFJVM0x3VXZiNVRQTlg5azNVL2hJZXg5aEUycVBwcHJUNzR2?=
 =?utf-8?B?T3ZnM0U4aFJsQ2d3Zk9STGF0b0JvMjF6bTdpalA1aDkra1VlbzJSamtDdEdR?=
 =?utf-8?B?SStvRjYwMWMyNld3Z2tiVytOQzJJbnFyYmZ4ZXVpVlR6amZ4eGRvN1BUb1Jv?=
 =?utf-8?B?UXlDV09WQ1djS210a1RSQ1RuR0VKbFYxQUZmUDFpRHNoLzZ1aFBBTjZWVkQx?=
 =?utf-8?B?SlVZdkh5cmJuaFRWV091YU11ckVVMjZzcHRwaFlDVVBWR2gzQ1dpcDhvTlcw?=
 =?utf-8?B?d1g1NCtUZ0dXWVJvc0pjM3BUbWtkeVpsN3B5MkJyYlJSWjJuK3d0cUdNcXE4?=
 =?utf-8?B?SFVhSllLeG84bnZSWDMvMzY3U0JBZmd2U1o0OXhyQnQ2MDBIWUxUenF4T3Vu?=
 =?utf-8?B?UEJpT21iQWNtOW9MOWRheS81Z2ZOcVV4RzdKUlQwWUhIaUduZGcwQUJvMEdD?=
 =?utf-8?B?aGxpM2xabWlodVFrakNidWMyWlB2UE5TYXV3SDVOSkFETWUxeEFpV05XVDJv?=
 =?utf-8?B?ekpzVXZnS1M5SXhnWGh0a2h5MDZ1SlFnaDV5Z1FWRmV4MEFIOFoxTGRtVE5n?=
 =?utf-8?B?dE1SbTUxOCtmeE1TY0swbG0xLy8vL000T040b0FiazZ0Z2dFQVp6bGdnMzNE?=
 =?utf-8?B?RjJZdjFYTmtDS0xBUlVRVWpFT0VFdkxsdTlJVmFGSnJ0U0RUZGpxNS9CVjla?=
 =?utf-8?B?MHpCbDFkTUxLbGduQlc2ZTNkamo1YU94dkNFeGtkVWN2b3JjQ1Uwb2NFNVR0?=
 =?utf-8?B?V0VjQk9qS21uOTg5SHlPc3l0VFJGRGx1UGlWbE9SQkNySHIzd2p1NUM5Kzkw?=
 =?utf-8?Q?PkEOpEKDceVYPRIU4M/BLRE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b327ac00-95a1-4f30-45fb-08d999fc1b2f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:17:11.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ocC7IjyxDnKcTQBwKZQAQ45CmEAXzpeR01b7f4W7g5rw4xLyFscvVjwUQBhoiK8qAkCLSr/GXp3EfTV4hfYrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999
X-OriginatorOrg: citrix.com

On Thu, Oct 28, 2021 at 10:04:20AM +0000, Oleksandr Andrushchenko wrote:
> Hi, all!
> 
> While working on PCI passthrough on Arm I stepped onto a crash
> with the following call chain:
> 
> pci_physdev_op
>    pci_add_device
>        init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>    iommu_add_device <- FAILS
>    vpci_remove_device -> xfree(pdev->vpci)
> 
> Then:
> leave_hypervisor_to_guest
>    vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
> 
> Which results in the crash below:
> 
> (XEN) Data Abort Trap. Syndrome=0x6
> (XEN) Walking Hypervisor VA 0x10 on CPU0 via TTBR 0x00000000481dd000
> (XEN) 0TH[0x0] = 0x00000000481dcf7f
> (XEN) 1ST[0x0] = 0x00000000481d9f7f
> (XEN) 2ND[0x0] = 0x0000000000000000
> (XEN) CPU0: Unexpected Trap: Data Abort
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000000002246d8>] _spin_lock+0x40/0xa4 (PC)
> (XEN)    [<00000000002246c0>] _spin_lock+0x28/0xa4 (LR)
> (XEN)    [<000000000024f6d0>] vpci_process_pending+0x78/0x128
> (XEN)    [<000000000027f7e8>] leave_hypervisor_to_guest+0x50/0xcc
> (XEN)    [<0000000000269c5c>] entry.o#guest_sync_slowpath+0xa8/0xd4
> 
> So, it seems that if pci_add_device fails and calls vpci_remove_device
> the later needs to cancel any pending work.

Indeed, you will need to check that v->vpci.pdev == pdev before
canceling the pending work though, or else you could be canceling
pending work from a different device.

> If this is a map operation it seems to be straightforward: destroy
> the range set and do not map anything.
> 
> If vpci_remove_device is called and unmap operation was scheduled
> then it can be that:
> - guest is being destroyed for any reason and skipping unmap is ok
>    as all the mappings for the whole domain will be destroyed anyways
> - guest is still going to stay alive and then unmapping must be done
> 
> I would like to hear your thought what would be the right approach
> to take in order to solve the issue.

For the hardware domain it's likely better to do nothing, and just try
to continue execution. The worse that could happen is that MMIO mappings
are left in place when the device has been deassigned.

For unprivileged domains that get a failure in the middle of a vPCI
{un}map operation we need to destroy them, as we don't know in which
state the p2m is. This can only happen in vpci_process_pending for
domUs I think, as they won't be allowed to call pci_add_device. Please
see the FIXME in vpci_process_pending related to this topic.

Regards, Roger.

