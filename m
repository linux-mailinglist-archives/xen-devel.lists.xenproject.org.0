Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522EF44E648
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225201.388913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVZC-0007IN-UN; Fri, 12 Nov 2021 12:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225201.388913; Fri, 12 Nov 2021 12:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVZC-0007G4-Qz; Fri, 12 Nov 2021 12:22:02 +0000
Received: by outflank-mailman (input) for mailman id 225201;
 Fri, 12 Nov 2021 12:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlVZB-0007Ft-MZ
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:22:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f02df5-43b3-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 13:22:00 +0100 (CET)
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
X-Inumbo-ID: 21f02df5-43b3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636719720;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NMX9ADwXpUyxQR85mVx32Z+QsmBIWysDL87Js0s5hac=;
  b=VYZ8gBn6B2JuxdCCHlWKtlC1+KQeXQEasVTdcE65FxtWxgFY17sYlIRT
   EApIj7EQCnVZF57nfLj05PQTwtFUz/kKPBSh94O/LTs49Frjy3JH0cFZk
   2J0LhfeNdiUZPifqd7I/00oACzM/e0L7l6e8rFFy72syyaO6c5ONQQz7H
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Hwb+7pQZdG0mneseAEz5/lZEdeVNPXk64T+CHI/aymSWsLk/MNnEAJvHARBoorOtfh7MPVmDkW
 KiBXvz7CsGvCo06S+8P9oovo9Egq1oOYjPKeIYI491K5CCIqf98b+AipVz1AzlabZ/Wo/Q6Sbg
 ImL5R0IzmY5XHcOVIfW+pZuq/9FSBTk4or6IuE/Jr/1FKoiz16BvnUS/cvX8pbJ51OFkpu8Ay7
 zOhGowaieyQz7KAijfolw2llrqogXEbYnA+mgblUezeNfmcsGgzQ/8zGEmvOPTcX7Fl5McDwnz
 zRZnbdAPLdTeHLB7wu4H9n15
X-SBRS: 5.1
X-MesageID: 57703828
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ne91LK20RHwGSVKyufbD5TJ2kn2cJEfYwER7XKvMYLTBsI5bpzAPy
 mIYCzjVOKmIZGrzcttzYdvlpxgP7ZPQmtNqHAJtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wrRh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhxN8t6
 dpD7ceJEx4xAaPdgftFej9KOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIAHhGxg3JAm8fD2I
 PEWczkxNhH8MgxNA1gTV4sdk9r4mSyqG9FfgA3M/vdmi4TJ9yRy3absNpzJe9WMbcRTgkuc4
 GnB+gzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4SOJmyQ6DkvHtuR+BOWYVVyEZQfo0nZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swZX2AAcmV8HlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybJhZJ2WyO
 x6O42u9AaO/2lPwMMebhKrrW6wXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:5G3pNanItbhmgdB4kBqzQNYGGJrpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57703828"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlROlBee66SdV/wKd3WChOLTbuMpAEbo4XZuCN4vgJucMGol2lNIBF8xx+5OJs7i839E4dXkLuX/XWdU7CTXeet46JUc8PrrfXfvNvEcvGoiUBfIE1GTv+/YS3gIKgWO9YW8vGZTwFUQ5s3+DSXWauGwLAJsXabJmTv3U1FAxzFyciVqNjuHQTv+rYnlNCa3PCAMyHmMhROs1fUTrAFSuhvT/KC233muodkkhl16z3pAsBdZNZMLVoAgUglrAvXKvxcNGtyLtsE1KGG0g76qtMRCVKT2T/wIRL16nSYaUdzbyxioT0H7aPZy59MB0/JwpV7HcEP02ZDfqRqqH5nYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS4sg0gmDHSoJ4tw0HkZV/dGqolTXb5jbg7x8hK0RcU=;
 b=lOFXelEgS/BOr3jQ7hDHM9t6Qx5XB3NB1h32oZJehTk2elUgsm/GnbuV/FTk0vfiRLXsHJyy/Y96b/hgwR18wtMuE1BeQKcvX1ojCQVCVySZdXT5yNyJgswhPsr6n8se42/vwRdt/qFDPwPIwRcpdknOrqhwVqcedYcTW1ruhPsfmzWB5tNyn562vEzBP3Y+tniNE3KknFny3EU01mR7oIQpzRJ05P3Z53KaS3ghqlSFxYgjh2kJBUl6jDK7WhWfxkzxG4D35ogWrqTsKl1ExmI48Zg6UwwFX8LLVs7Ezr3gGi/74yTRhofrygJZwuNQnh7Q7rdNxV4GQqRXPhCGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS4sg0gmDHSoJ4tw0HkZV/dGqolTXb5jbg7x8hK0RcU=;
 b=qfCb+VMgrKkHNSCxTwmqLSaeSWxga9a4YkYDazAa7TMKrOUaP+iQUfXcprd1qg+rg5ef1mZE/YpElL/cSFvgoFwLodENhe+h3UJIZtlUTaIuapVGBny/g5uqub0x6qbJBbUQAxEojCrwdBUZAOS5iJ/H6zmNd01jtzXw0JcreCA=
Date: Fri, 12 Nov 2021 13:21:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Message-ID: <YY5cYFhnALBNDIg7@Air-de-Roger>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
X-ClientProxiedBy: PAZP264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc2b18b7-2ca1-4fc9-3ccf-08d9a5d7048a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB4476CABCBA5801901EBE7C488F959@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmsrEMYVAS0i9sfLmVoUXv+SO0B3n/so/FLI3b1uZeqBEfKqSYGYglG9kau3OAuS4u4y0C+yYNxTfbbjD+HEsElQtqIwvEfGymz67eK9p4rA9TUrAb7+yNoQ6gYizNHkULi3uxg57HFNphYWMW27uaRWg8pa96lJqhtFR36MmyY2Y53HgQk8lMSVXiCeGgIofy8XXVaC0wnoSMTw6+ObUm7sKrS3e/IXhVnCtfUxaSCK2Var0MzcTn4/uxzlCSiG1XumdKChrQ0tlXES3cUUJkXmaleya75cJt5enbwWOH1dAm70MsB4d+zfGOJh9+DWb+/Z2Sn8Gs99hmKXCDPfQ7kYSr/IrCCbfxmsbHt94YBRycXHPnEi3R7hessjhgJO7lRSTFekBnC/RAC4aB+Uj6lX0lAb9XTqb9Q3kmmwdIfXPnPYz0cps8haebBMZYCySGThzGmehfVmSBftr3/UEj5uQ3e/y6Wn8HyDRa+ukkxsZjSsWd/UiwVKxKLyd7PrWTSnpoeJDNfEhHul6dNCW0LW5ukfPdHh2t+5FoPycmI2mz3IR+CNAlxeFY5XvANRRVYQnBasm+Kszv5nf/WA+5rHtfAsUoJ4AM9WKtqfBQUUUXzwIx4LQdEpIByv1KTV1RHsFr+89XkFsYoU3mtOgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(9686003)(26005)(82960400001)(956004)(6666004)(8936002)(33716001)(6496006)(508600001)(6486002)(5660300002)(38100700002)(8676002)(316002)(66946007)(66556008)(66476007)(6916009)(86362001)(4326008)(4744005)(186003)(85182001)(54906003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0tVY2szSUVpMWwzMjlqM1htcHVNVGhrd2lxWUcwT0R1b1lnc1BZbG5RSHdG?=
 =?utf-8?B?cTVGRGp2blRtY1A2YXRjcFpraDN1L2VHL2R6Vy9xdlNrdHhZT2dkQnNmSjVn?=
 =?utf-8?B?dnVCVUNNVUhLYk9HQnEySEVMQkdjRlNDeCtEWHcyaU43S3VyZzloNkdTemlK?=
 =?utf-8?B?OStjSTU0anZISHFPcVozVkp1elgyNUFhVWdLcUNndE5yMDhCZTdYbVp6UHNQ?=
 =?utf-8?B?YU01YTdHdm8zLzB3RE5OK1BRTE9MK3R4em03QkZMTnJPN0dlYzBkOXF4ZG53?=
 =?utf-8?B?YTRIeVJwWmpKUVZUcUFFTVUxQXFQZk9ZMHpudXlrTFM5Sy9kUXNrK3VGaGZ5?=
 =?utf-8?B?SWxoS1RlT2NPZDM2ZmMwKy81SDRRUkdtMVg3a2FYZ245TXpxMU9PNWpFSUQ1?=
 =?utf-8?B?dDJiUVZTYmt6NVpKR2tLWHpUYXlVTWlUOUpzVjVPbjhqY2FORSsydjQybzZP?=
 =?utf-8?B?cUlwckNrbFA3R2lScUhmYk1VZWdJeDJnTE1GRHc1M0E5WTdRQk9hT3NTY3Vl?=
 =?utf-8?B?Mjk3TWJzdlhacGorOGVvaXlqZ1VmTWpKRkpEd3B3aVpGOXNtWHhrL1RFZ2dE?=
 =?utf-8?B?eUlCeHdTVGtXQ0s3OHcwMVNXTFBybVlZUU9EVXRGbUFQYnVFRUx4M20yMEdL?=
 =?utf-8?B?a1NBOUNrdGg5blB6SU1KWWZQV0VQWVlnVTRsaXRtTGtJWDBmRG9iZGxEVlYr?=
 =?utf-8?B?VnB6NWRjb2FGeWN5d1NuNm8zaEpmbWNyUnB1SStvQlB1VVBvZUVZK2dhVW90?=
 =?utf-8?B?d2dSS0tWTzJWZno4U3lTbVpOTlpFSUVvTkxyZ0JXL2FkTHZGcHFCS1RReVRs?=
 =?utf-8?B?RHVUVGZOTXQ1a3ZhM0QvVEovUWlVUE9VY0UxUTFEckl4TGVCOEErcDdwMHpL?=
 =?utf-8?B?cGYreVgyODlWQnk0eVp5ZE1kRHNXWkQ2eXJvVTVCNHBTb2xVTGU2bkwrZ3Na?=
 =?utf-8?B?czFYT1JDTGdDUWNsWmRUVk84T1FWVDBsUzdaWXRJTTdtVmljTlBlNklrSnky?=
 =?utf-8?B?WTNPa1lPUThqai9mOSswMWl2MjQ1bEZMNDU3QVV0NWhaQjQxREJoRWRZcDZI?=
 =?utf-8?B?Qk5lQU42cTlMUWxXWmxhZ3dFOGpId1E2S2U5dndnZHdPaWxVR2tTRmYzWGd2?=
 =?utf-8?B?Ykx4dTJzL3QySlNFZDViRmRudWFNMmVHcy9vMlRjNDhMK0RGUXlVSVJna05Z?=
 =?utf-8?B?OTRMSlBqTm8weHpuenhBMnVSMURtUFlRNTdyVysvQytMSys5WXVVWUZhNThz?=
 =?utf-8?B?cnowdDlkQjNiRHlKRDduMXVUTTZyZ1UxOVhmcE9pWkhSVjlMK2V0NjM0R3BO?=
 =?utf-8?B?T0E3ZVBhQldVWFhsak5pd1lpejB0ZFU1WmVDSEhrbEhkM2J2Mjc2R0tNQmw1?=
 =?utf-8?B?QXJpQnlJNkNYSi8zSUJoeVhXaEhkb2hTU0VNV3AyVU5Dd29FSFJZUWFoTVY0?=
 =?utf-8?B?QndobHZVK1JmSUMrMmd1OWxGeUR0YWt2TW9zOEFMT0VSNlJBNnJLTjJ1aU4y?=
 =?utf-8?B?OVZJVmVTbWp5UU9NclhHV0JZYm90MllGMXllTDVEK2FxaEd0dit1WmF1SCtG?=
 =?utf-8?B?M3R1amcyV0ZwTXBLUXBXS2RuYmRxcHlldzRyU3NVM1dnTzZONlJhWWFJNnJz?=
 =?utf-8?B?MDhPcTBOVGY4dGFqYk9KejMrOUgwWFkwT1JLREpZVGVkS0U4WTRqZXhENDlX?=
 =?utf-8?B?STc0WFJXUlFDQ2g4K0xUQitQeGQ0Q3g4Tzg2NENZb2N3ZWszMmFLUWo5VGo1?=
 =?utf-8?B?enZTLy95ZlQ5K3JOWTMzZHc2UUdvMnBQQmVsdXV4dU1PTW9kalhReDJ1T1Az?=
 =?utf-8?B?NTFjSzdPTm9wT000VzlmTkpRVkl0RVVCL2RnN3pQMmlCQlVzbGV5SWd0dU1q?=
 =?utf-8?B?bWJ2TDJTSkowT1pwYjJpTXlDNUlVYmtuNUhBUWxKMlNYNzRzNitJck9ETDA0?=
 =?utf-8?B?RkJKTjI3NzZUUUpjTTNRcTBZcmNWei9NRFFvSFdDTktZU3A1cnVVSktVYjNR?=
 =?utf-8?B?R1l1VlVGUHBtQitzRjZkSmRaQzhpU0orem1peGZVejBDQ1JZbVpQaTVQQXBG?=
 =?utf-8?B?RVo4bGlLcFZBVUEyTjJZbjVIWnJEdi96bFF1QTZscDQvNXBBSm45U3NpdkZ0?=
 =?utf-8?B?OW4vOC93UU5iZWw3VElYUWY4M0N0Q09ETjlId0tLSEtQbkpFazk2M1lwYmxz?=
 =?utf-8?Q?WCMPO9XqycxG+emZebYMPys=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2b18b7-2ca1-4fc9-3ccf-08d9a5d7048a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:21:56.3162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHBHGTQS9e3OqlVgUmS2Dtnw7S3hRWeM3sGNZHTRYcTkZfRMQ8jeoT3uFbgaBEcDDKD0inZORD6cVabwHx1Qww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 10:47:59AM +0100, Jan Beulich wrote:
> Merely setting bit 0 in the bitmap is insufficient, as then Dom0 will
> still have DID 0 allocated to it, because of the zero-filling of
> domid_map[]. Set slot 0 to DOMID_INVALID to keep DID 0 from getting
> used.
> 
> Fixes: b9c20c78789f ("VT-d: per-iommu domain-id")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

