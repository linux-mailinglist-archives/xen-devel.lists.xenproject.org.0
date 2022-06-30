Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF4562061
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 18:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358603.587873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6x8L-0001IP-LO; Thu, 30 Jun 2022 16:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358603.587873; Thu, 30 Jun 2022 16:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6x8L-0001Fe-IV; Thu, 30 Jun 2022 16:35:13 +0000
Received: by outflank-mailman (input) for mailman id 358603;
 Thu, 30 Jun 2022 16:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6x8J-0001FY-TK
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 16:35:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9afe375e-f892-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 18:35:10 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 12:35:04 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB5370.namprd03.prod.outlook.com (2603:10b6:5:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 16:35:02 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 16:35:02 +0000
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
X-Inumbo-ID: 9afe375e-f892-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656606910;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=X+eLrljL64bpjt76Hwz9sQQv29FUkblb4AZb55DcfGI=;
  b=R9y3WVGd/qsMN5mp3WeGX0cdrMshS8VyA6Il8oAg8d+j2NczSiDmjSSl
   oNxYZPvVX1jOteRBFGW/KNXDLYcgtPaEsMscv/QQEVm/reBIHPLCbgaBj
   CISIhR/0GpGtvAxFwd1f1AbUMb7IbqWfK8shfwijKDU33U9VmLaRMT2Dh
   8=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 77384588
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:luvlyq82OP4WBDwf/I4xDrUDqH+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2oaUDjXOayJYWryedt+bY218x8F7Z/SnN9iGQFtqH88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34PhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnay9QBYwDKrFo/k2Dl5DGgckMLFl1bCSdBBTseTLp6HHW13F5qw0SWsQbcgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHviMvIADtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGID+A7I9fpfD277/VBhioPNbuPuX5+7Apx+tEGJi
 U/J1jGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRokyjXZRZI
 k8d+CsrpIAz8lCmSp/2WBjQiH2JoB8aHcZRGusS6QeRx66S6AGcbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+8tTqvPQAFIGlEYjULJTbp+PHmqYA3yxjJHtBqFffvisWvQG6rh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7DJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:pXvL7K4dm6p4UlidYgPXwS6BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfTpyVSZNNXh7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/HqVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW0PRozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDGnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZxB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MYiFXtuYdg99R/Bmc4a+L
 EENrCc2B8WSyLQU5nhhBgi/DT2NU5DXitvQSA5y7+oOnZt7TNEJnAjtbMid0c7he4AoqZ/lp
 r529xT5ddzp+8tHNdA7bQ6ML+KI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.92,234,1650945600"; 
   d="scan'208";a="77384588"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EC8QX6v46FoxLNJJ68ax0EsV9P8VoD2CwDV2BxqZvtquGdlhtx4S4f0ylz0GCWBnZ2G767vLHcBQcEJZpqCjqPSvwhGWYWKtj/plI7SIKSMd5E45pCh/doRTinzppV6QaasvLJGK90pgPECcq42dRAD/bRiPELH1m0AUWyV27Q2RmX4AVTV8n0ck/7v5NSL7uvzeRQiGKMY/7+NySOszLOcy7+MZsRhMl3LsaKvYNntoBXrJdhYHqKCromuPa7eIkdE8KZepeOUJSXVi6QSJG0s+/aomCmaKVJO4mgNT5yv+I35ajabxEIciHOWgxOcn+bZqZKT/H++Ks+zY5ZstEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oX3URqPsbJ7y/iaNrL25B7p6kAIWUNzEoNnUrhhwRG8=;
 b=VPO5AEl7M9pWP6UfA66+ZeVqreWI8of5TutfyQMxIHAQTOdma0gEGQKwMU8VjwsjBdZ95wQtj7sdwk5lszFGzbfBV1Oaa1hy2ky24ZL/wl//HZVo1EWzpViHe9C4QECHInOhCyqInXuv5PXFYz4dE9dw0OwskOB2zJR+pnfEMVzZf5brgIkUjKk1t/JaK4cu+H3Tgrlfpc2vd5loNKGf5wcGkdhSi/fhx0KBvHpVhjlyHDbW3Biu+PjxaMGEX5xtwJuDegGEsWt4z2hwu35EweQc4Mz75aCRgXWV6UlrBXrRcLoITsbrpIiSS0qb1ZFz+x/3Pdh3kjdpVwmmIN90nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oX3URqPsbJ7y/iaNrL25B7p6kAIWUNzEoNnUrhhwRG8=;
 b=GNmMoqEXNMk4AUOMGdlTFYaTjtTUpUqzxxUpljvuRf5Fnjy8Y71XYov/geUJzh6LsxfkTlNGS8Rcw0klo1IbBWINiJxuFXArBTvkHe0xAR1JTG9FBMIxN3SdT+WAIrE4a1/jj1OFgxOK0aOuESbpk200tjDRYRUUoYQb6/rNo3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2] x86/ept: fix shattering of special pages
Date: Thu, 30 Jun 2022 18:34:49 +0200
Message-Id: <20220630163449.18714-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0348.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 758738ce-329b-4c36-bd2b-08da5ab67b13
X-MS-TrafficTypeDiagnostic: DM6PR03MB5370:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ziep0BtSR7V/e/WhIAxnBOwoeBc+jq6mwQGe4QaAQThJEzt1N+hQW3P2yPq+44f6uJnMNPH6lIAquQRTJlRfSyaJ9x/agrziWaTeUVcfa77y4e6545LXCoWhOSzQgE6xfpFiSILhg/81Icw42xFat4aMn3jgWf5qQFn15yndEQdhdComm3tpb8n/zj47aWOEyM5AS+oub2vpUcZxDNbVDwEpfu+YC8k3APau6/OfzRee6vfC5GAbipMikwIUvxnHt3zbpNs1+wcimM3plWmRUeat4WiQCVrue//7XHxb58ajymrr55kX6xAmpl9KZpFasc6TY3a7Fb4nZ1Ne7wvaW5v22Urm4vP+DSKL3o4aog8PlC8XuvHVw8vZ6vXlk8wg2Tyd+1Ngjh4WrqYY+i1VJbv92mpIUyMGdRKwn/n9EEmgUHlT5tgyCVjGPtTY8/Gil4tWL2ai9Xll5KBauMCgSuDpbZsNDxaluWsxA49PAfSDJtt151zoPWZ76/iQFjhYGQ9UC2UnKmF2COhQPILjNifdTXYzul6Nstc0MnFXgQAhxX3QPAoNlofUNDF1zSF2HjjDirhSUF3z5dguh1k1TTSJLp+c2BaXEF4Z874niqFtFyOoBhqxXb2Ucqof77QPNbMa/ncUraPnwbzIwzJjreRSCCsfHR7XP/JKKWH3hY+neRuZ84jzr+DJeTU6AoJllSjMUVVHryH9CpSgBgUgxct+MWuhM2SrWVtA+OEKMhbHJ5HmvQYN5M+CH0vkji2w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(186003)(6486002)(478600001)(83380400001)(82960400001)(38100700002)(2616005)(54906003)(8676002)(4326008)(6916009)(1076003)(316002)(66556008)(66476007)(66946007)(5660300002)(6506007)(6512007)(26005)(8936002)(41300700001)(86362001)(6666004)(2906002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDFPRlEwM1JLeFRGL1ZyM2F5QUNjczVIa3AvcHllSCtzcXpMWGhMQmRzU0Vv?=
 =?utf-8?B?V2lYSW45dmNNd21oRzdhUVdISncrWTZMc2owekY3UVBEVnZyWnkzamZsQnps?=
 =?utf-8?B?TENaa1NmZnFSNmlMd0diMno1aTJ0RmkwUVhRMVcxZjc5QkxjZ0lVZWthZHVZ?=
 =?utf-8?B?YkhIM016V3ZVKzIwYTlOKzVDWlVESzlkQzY4a1NjZlI4WHp2VnlIMzVNWWNF?=
 =?utf-8?B?bjhrcmtSV0F0N2dFeFpmWlYzdnlaV1VDZjRmUEgxK1VtaC9oNXM1Q0tNQW0x?=
 =?utf-8?B?Z0FNT010ekRLM0EyMUNpeVV6SGRGRXNEM0luQjgvUGRZQ2JNaFFrVlUydmZG?=
 =?utf-8?B?REM1T2FRei9ZWS9WcEgrRGsyd2RFMDBzTGdWbGtuNTFtWjlzZUd2b2g0aUcv?=
 =?utf-8?B?QkVZdi9ydVJBQmFUeGxnZVltdHduTXdHalRwaExkWjFTcVp2aThyNHBHUVRW?=
 =?utf-8?B?K0FrSXZuMEgwYWNKUkdyZkVjek1WN2Y0Q1JVUE9kTkYyelFYWUNNdFYxcVBM?=
 =?utf-8?B?d3M3aGFUckJZUjBLSndCeUdYVlFpbS9xc2VzVlV2MW5CWWNRNW1VOGV1OVBC?=
 =?utf-8?B?RnY5N0FYY2VFbzl1emFya0ZQM1o0UFZxUFhBd0hoTnlVQkxiWVpBT3hiU09i?=
 =?utf-8?B?Nnl0aUlDNlNPWkxUeWdvV0xQN2xnYW54SEM0TmJMWGx1OGtNeEc0bEpjYlh4?=
 =?utf-8?B?UFJ0emFoZVloaFdpcCtWRkErWC9pak9lbHBOUFMwalRqNk54MENhdE4zdGpx?=
 =?utf-8?B?TG5nUHR1dXRQZjRvOG5tVUloVUpNbWdHMDZYU0JuVENkODU2ZUM0eXM0Rms5?=
 =?utf-8?B?bUlVRDEvbE1vMC9sWnBvcTUvRU9HOHhUL3JYbmN0R3BZZXYyZi9TN0xuQWVp?=
 =?utf-8?B?ck44MWpDTjFuOWJ3QThPMFUvYjJTVTlIS2UwSWtFdkhEYTB4VitRZmJRZFlS?=
 =?utf-8?B?WEUzdklpMGtpd2hrdHltUlNWSlh6NHVjOFdSY0VTSzdhWTZ3OE5iMGRoQmYz?=
 =?utf-8?B?TXRoU2Y1eHhOdXpMdzNNNlgzTlEya3FMeWxiRnVMc2tEa29ZdnN4WXpXU3BU?=
 =?utf-8?B?QVdPcWFPODBuN2JFS3lrYU53UVhMTkdrV3E2ZEtYK0dBRTZxREs3cUpHMGtP?=
 =?utf-8?B?NkRITmI0UXBTdktmMEtrS2ZSeWtFT0ROYzk3ckJ1T2VIamdNRU95ZWhvcExL?=
 =?utf-8?B?MzRaMzVrSzc1d2FLSlh3dWFYY2tRL3BHT3FUWEJyY0YvZGJ6N3RDN2ZLMEhY?=
 =?utf-8?B?aGxqbjlKTG1hV0pPakQ5aFdyaWpCTThwY0pPaVc5YTdMRlVRb2JVeG5BYmI2?=
 =?utf-8?B?S0tQTTBSV3Q2QzIxSUJXNDlGNEdBVlhQL3V0bVQzc0tJTDR2RDRBWG9vdW5w?=
 =?utf-8?B?RXJiV0Y2UytUdTF0dUd6azB6UnlWbXZMVjJKRFFGaDNJRTd2L0RNS1Q5MG1q?=
 =?utf-8?B?SmtQQUJEWXB1SFRWZEZHbFpsSm12V2xQZzdkSHlVNWplVlVMb0ZoUnljRm9Z?=
 =?utf-8?B?d2d1RGUzWUd2UTFLYUxOUDdUbU80WjV4aWtQTkVBR3FZdmV1L0tvNGgyaHJu?=
 =?utf-8?B?YmhLRDE1LzR1ZVRwSHZ0R0J0cnFCSWhRdjM2WFFDOWlHSWc3WjNYMUZsMlNF?=
 =?utf-8?B?YzRaK1k3cTVxbEZLR0VONUExWVZ2bEpHdTJ6NXlsUnZlK3hkSXdKQm0yUzlB?=
 =?utf-8?B?OElmTGg2bzg1cXQ1ckgwQmVHZURvRVEvbEtJSWlrWk5Ib3J2RFd3UlpPS1Fh?=
 =?utf-8?B?OGJ6ZWJoRkM2czdIWUtUMGRuRU9vbzVoVElHQjk4SitsNGZjNjNoTGFwZDg3?=
 =?utf-8?B?ZHZZOE12ekF0OHNVWFMyRlBRaHc0Zlg3YnI4Y0thRjhUWFN1cnllNGczWkJ2?=
 =?utf-8?B?Yi9mdnBOSmROVlBKdFVLdUJGVFRJTmxJNmRMOTFTUDNRd2RqN3hSZ2w5U3lX?=
 =?utf-8?B?WE51bUwvUDczaWUzSkZPNkw1MWJKSTZGU1V4eWNvcFFTM1JoVUJETk9KQlps?=
 =?utf-8?B?OTF1OUU5dEVvUGlrUFdmSzdsdTN3WmVQWWFaOGpyY1Nrbjl5anhpZkhZV1Aw?=
 =?utf-8?B?OEt6K1g4d044eUFNRno4ZUhaQVFlSEZiRGRNU3N6REdiclliT0c2RzRGcjNI?=
 =?utf-8?B?eVRYb1M1eTAwc2RrREhXSlBocjg2bjlTU1NBV3A2STZWUWhSNUduS3dUQkoy?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758738ce-329b-4c36-bd2b-08da5ab67b13
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 16:35:02.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbneLPYMsstoEqJvWgUGpjAk1QTEIJ93PTKXObv8v6hkFfUivRTtL4M2+mR/O0P62y3Gs3//iFBdsGNVkEO84A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5370

The current logic in epte_get_entry_emt() will split any page marked
as special with order greater than zero, without checking whether the
super page is all special.

Fix this by only splitting the page only if it's not all marked as
special, in order to prevent unneeded super page shuttering.

The unconditional special super page shattering has caused a
performance regression on some XenServer GPU pass through workloads.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Cc: Paul Durrant <paul@xen.org>
---
 xen/arch/x86/mm/p2m-ept.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b04ca6dbe8..b4919bad51 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -491,7 +491,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
 {
     int gmtrr_mtype, hmtrr_mtype;
     struct vcpu *v = current;
-    unsigned long i;
+    unsigned long i, special_pgs;
 
     *ipat = false;
 
@@ -525,15 +525,17 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         return MTRR_TYPE_WRBACK;
     }
 
-    for ( i = 0; i < (1ul << order); i++ )
-    {
+    for ( special_pgs = i = 0; i < (1ul << order); i++ )
         if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
-        {
-            if ( order )
-                return -1;
-            *ipat = true;
-            return MTRR_TYPE_WRBACK;
-        }
+            special_pgs++;
+
+    if ( special_pgs )
+    {
+        if ( special_pgs != (1ul << order) )
+            return -1;
+
+        *ipat = true;
+        return MTRR_TYPE_WRBACK;
     }
 
     switch ( type )
-- 
2.37.0


