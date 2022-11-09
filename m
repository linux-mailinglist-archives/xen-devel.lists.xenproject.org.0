Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C384622C4E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 14:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440918.695144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osl2a-0000ju-K3; Wed, 09 Nov 2022 13:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440918.695144; Wed, 09 Nov 2022 13:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osl2a-0000hI-HF; Wed, 09 Nov 2022 13:22:52 +0000
Received: by outflank-mailman (input) for mailman id 440918;
 Wed, 09 Nov 2022 13:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNAf=3J=citrix.com=prvs=30523791d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osl2Z-0000hC-6d
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 13:22:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ec5dea-6031-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 14:22:48 +0100 (CET)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 08:22:35 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO1PR03MB5793.namprd03.prod.outlook.com (2603:10b6:303:98::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 13:22:32 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Wed, 9 Nov 2022
 13:22:32 +0000
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
X-Inumbo-ID: 99ec5dea-6031-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668000168;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hjcADLPT+zVGnCTXdSQiHI8alI0n3E4uezLp/ZU+IH0=;
  b=PY4LXzNB8MgI94ITsEBMY66C5bfhluapEOvH8ovM8edcfYsi8IbEHk5o
   QSmeOkkDbKb+j//kzD661bB1oqBcttBi7I4iw8dqO9nLIKhinvJSvY/M0
   6CECsKJDmBnzScMhUf9SKci8RKZjHxBVOT3ZhJzJhz5ENzBAtIGMq6+Dv
   c=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 83547295
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:46WYlq+PsbmvR3GNprsvDrUDsH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TAdW2HSb/qMNDbxc9gnPYy28E5Sup/Syt5kT1Zo+Sk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKga5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkV8
 uM/CTcmfiuchvyv8JCARqpU2pkKeZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rSSwXyhCd96+LuQ9t80p2a25FEvKgAKfgHg/MWYqWSzVIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUSyAyL0LuS3A+fCUANVDsHY9sj3OcpQRQ62
 1nPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwi8KvHzj1m
 mqOtHJm2+RVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:RtpJJ6oT+RIUoG6wgP73m2kaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCAIqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP8f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aiSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7svVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wU9HdwGOtt5Dt
 //Q9RVfYF1P7ErhJ1GdZY8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="83547295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBm9VcRqsaqJzQTqW6NSxKkI9ZCTgEy/fCPxMHf2u5yuIbLxtRwED8l9DVqbqxlw8iM01Zr6zFdBGjkt32VF1V3l9MQn9IX0S8ctmDuxN/+QTrUPxECs5CrFmIEc7uAKGxQFYherPyu/UcesosZgaID7TrxxHCBZW36Wdh0W1xXeYn+MHSd+LaTP+tbXl1+7Q9TwIh8/qN0zDR3maKZfv3J2To7+jw4xjhf6YSCLbCELEL24BUXO6hIktvCYpykPeiVrkBcI0mQKh0+A6BiyzZgkqScAh7adGcnHMTdhsFyh7U3bTnjsl4VL6xgBJvJ400WS/pli3JmD3A6s9B8y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnkrBU9otFoxnR1euvBHtCseCIwUb3BaZS4J81TjYdI=;
 b=ARIPJZ2X3Cr8LLHJi4j0HLeoykmcWtZUOvjKg7r+hpf0VTTHgYys/Jie5FVoqq26kVfwo+kHjiEEkt5pSrPlr9zPCRO3umigCeLj2Aqmzhy7CxLEWEvB5RGnOzN3325O33/5tj0cx/C/tRnKTVzcCbbkFeufDjsPIUuwmCrgniDmkZ38kVtXnvOWZPdmO+MhG3tyu378RrSArebOT6AQ6dwW9SxIy89rz8meQYpWTk8oybQKcdlGdACgineMcOgcNTZLj/cj0jSJ8XUxmRXImY1DC82sOYaH4/Ql6sdDgrRcnmUVuLlYa9BnGU3XR/I4sHvfnhlk2QNvu2zu6LP58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnkrBU9otFoxnR1euvBHtCseCIwUb3BaZS4J81TjYdI=;
 b=Su9L2CjbhfGBMnCOtmap3er0bQ0YIgSboO6ptXmFCrlZ08/VWEu+Hkikb4CIXhCphjabxH456m7pJMJioFbPk1pSdH8L33gtQ8p0e9PuvrHiqEQL6gOOvvM0qsK1iWP1t05irjgLSlUa+e7A9L9LYLCg1BeXUXG2tzbE6tMFRuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 9 Nov 2022 14:22:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Message-ID: <Y2upkkdrPAxFjNl7@Air-de-Roger>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
 <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
 <Y2t87YE5acLfiClF@Air-de-Roger>
 <afbc37a1-99cb-ea09-575e-dc6448cd6f92@suse.com>
 <Y2uQxiykG0+Jt7Az@Air-de-Roger>
 <31f048fc-f2e5-a421-0e60-98d1bed47ca1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31f048fc-f2e5-a421-0e60-98d1bed47ca1@suse.com>
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO1PR03MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 75adcf18-ea8e-4042-ea41-08dac2557547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2K/Slp3woZWt3RNHUYIiWcKBytKC/Fr1jmjMoTMzpLZoM12XRCYnWNmgecpngbl1jtKfEV4njqmfJmEEZ8yNMHSEbGsWM/dsVV2WPOFJUG95Wzor4t7U/I8UXr7sMhZGlHa7A7VfGEL/Exeh3cdhRtpSdPVhqIdUHBMyYFEz0dHbSJhEzN2AEUMLJLTLBkXJQfzKpIIQQpy9Zt6MtoYNfX7kngJaVhQTTQp+oJuRD/jr7qrC4j/lo6lLzsO3/V1F7ZOkzavIBB+hSPiIG6dJPXz3NSs6jPBL96u4kH86viB4n0hASrXe/NynB2qpw3RsT9mdb3CCaN/mYQI6iAp1JZmUYdN51rRBl19STvFYs1JPInYjxN32R7A1Hxdq+hFQ3vdBZPsxnI7lhFtgU/F/2ZQZ6Zq8ko/MdrLfXXF9zPcPZEh7gg7iK9TGC0IOD3nl3u9ou0Q2BAsI8GYUa6Jb5eveHm1bCBwqK4Ei12e4VgqCdXjLhv8dGkYm0zZKwVPWd/+aCAsAzT0FWDf7gHAqU9x6iQ0JxifH2uA8Pw37RRxlcFHEReknLra8DawQqO8sKy0yDkTad0TlHTZvmD9akPsXBOIkKT61vQwIfH5GneSFhooBiYFfBlvXIkWixqfIz6b25E/ngoqqukaFrooCTvNOtt8hYy064vL1P/q2rJH9usT5s6dQuaeQ1wHm7PADpGENfPujBCMB5raMc8SkRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199015)(85182001)(38100700002)(41300700001)(83380400001)(316002)(66946007)(66556008)(66476007)(54906003)(6916009)(5660300002)(8936002)(8676002)(4326008)(82960400001)(86362001)(478600001)(53546011)(6506007)(6666004)(6486002)(9686003)(6512007)(26005)(33716001)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUxxR0hrN09pK3UzQUtWMG9oSEFQeTh3aWNHMCtGMHM5aEthWngwdE8vbWh6?=
 =?utf-8?B?ck5yeGVGczlUVGUwbUg5d0Q3bWx5REMxQ096MG1FaGtsdy9NQ1NMR1RDZzFU?=
 =?utf-8?B?dk9ieElRT2JPcmo5d1graGdwVXFNSGRVTzE4VXNqYUdUOUJPSmN6N1lJK0JW?=
 =?utf-8?B?bncwRFBmZUxOZWRvVmRQSWtzZzFSTG1BUE81SnVSZG4zNU1pbGREcFltV28y?=
 =?utf-8?B?Nldhd2NSODZLd0JXUWE0YUROM0lnU2l4RG9BaFMrL2hseVVQQlhoQzhVY0o0?=
 =?utf-8?B?aGkrOEsyeWd5aytWdFFBRnBhYTBuTzNkanRqUXdRcTkyNHVwSFMrRnNPa25n?=
 =?utf-8?B?TDFwa3I1S0pBYkNUU0FJbERzajllSW5RSEVKU3puaFhTTXVvd1NxNWRQZW1R?=
 =?utf-8?B?WTl4Vk81dnRLOElRa3oxbjFLN3pORlczeXdzaS9lVmxkRFlOMXFtZUhPZ2t3?=
 =?utf-8?B?L2E4K0ZaTnV4MWwyaGJvTlF6NWhEZVZ4L2tPOG1NNStvek5kUGJiNEZ3OVp5?=
 =?utf-8?B?dEJ2cGU4U3hwYzJjK1FuSFFQRDhkTmo3a2ZYbjhDQ0V5bHpFYWlDb2dPeTNp?=
 =?utf-8?B?L2hJMHF2ek5qNUdadlVDVjRlQjNkaWU2SnNUQmFPaFpwcHd6cU1HT2FzcGhQ?=
 =?utf-8?B?TGdUR3RPQ3Jab1NUdDBWWkZXNmZYNWpWL0tEWUszS09NaGE5dUhQR3NGTjI3?=
 =?utf-8?B?WDhIb21zS1I4NW84d25CZkNFa0ZBWmpOMDI1aHAxUVphZnJFeFA0VU1tKzFm?=
 =?utf-8?B?Wk9FajVKdi8rVHJMVnJxL1FlMlQxSkNxRWtkc25mYnZuV21BQjdBaVRuYWcx?=
 =?utf-8?B?bk5PTTJNdW9JNURTblZoN3F0M25LR1Z1VG44ZFhXWlhOOEpCMDZYV2NBS3RH?=
 =?utf-8?B?VmFvVzZVMS9TODVUOGNLa2E3MW9nL1FOM0VyOUM5Tk9uZkhadG9hLzdoU3ZN?=
 =?utf-8?B?SkExVWlQL3p5L1N3Z2VPWlpuMGl2Ly9va2NlUzB5WFhLMlNKdEVBQ0ZLai90?=
 =?utf-8?B?eGUzS09yME1OSm5RY1piMC9jVkdORlhzOVh6TkUzT2ZPaG43N0xXb1FUaFg0?=
 =?utf-8?B?dGRiZW1PWElxS1BqYWlNanUyZkVZRjZoMWpUZGE0TitUV0c4VnIzOW1WeGk2?=
 =?utf-8?B?RTZZaVgxY1ZPNVBudjVlK21OZnV0NXNBRlgwNmpKb2VoQXVyS0E3NktvM0VI?=
 =?utf-8?B?c0ZNVHhRNkgrYUt3QWV6YmtOUWg4b0dRdFJXKzdmM0N2VU5GbVdOUTkzQW9p?=
 =?utf-8?B?ZTkrWXFSdklQZlcvVkl2WDVzYWg3Z3g3REYwUHIwdHJ5U2JxSVpmanl6ZW1j?=
 =?utf-8?B?ZHVJTkt1T1A4OTZrOHRwL2ppanNXOGhDTXEvbnJPbDJmMnIzZmtyNUVtYWlD?=
 =?utf-8?B?WjhBK1BObG92Z211ZktGNEYrZEhzNTErZmZGb24wamxsOFYyMWZzQWJyQ21a?=
 =?utf-8?B?ckkrYWhUaForaHBWbDFWM2VpUGhWL00zYzZYNXdONXRJejNxZVZTTHhwR3l5?=
 =?utf-8?B?U3V2Y0NVenZrSHZSNVlmRTdCcHJWVnM2VW56SnkvczR6ZmtDZDBsMFd4SEc4?=
 =?utf-8?B?bWlza2RFSmJ4UGM5OWdyaXo3ODdKSHVSZGN3OEE3TkRTaFNIWnhQbkRxT0E3?=
 =?utf-8?B?bzIxeWg0UTdYcU5VMG92ZXRoZXZ0TzJlU0dyREprOVRHQWNFQURkbU1rYmN5?=
 =?utf-8?B?cnRsQmVmYnF4SWhQSXRiY1Y4MU9lNCszSkF3V2FKbmc5emZJbWhRNE1RWGcx?=
 =?utf-8?B?enRsL2pFSjlyWWVLd2JsbWtOKzNYNkVkWFRrS0Q0UHlaK3RmVUtGZ1RIWHpw?=
 =?utf-8?B?K1NyeWNVOGQ1ajZiZ1kzVkxOemN1QXQ0NFpqc1JKTjlLY2psVmhIc0ZVcUM2?=
 =?utf-8?B?bWlIMzhhaUZDYUNHV1hJQzZveUNjUlRrSTVPUURncVVoTnl2ai9vcFczajAv?=
 =?utf-8?B?OGRHeUJXOUMvcEhjMmxKNG10cDdWVStSU1BtTDY1WitaYW5RaXpZWGplTzZS?=
 =?utf-8?B?Vm1DYlB1YkFMSTlOK1dwOXIxbFVQbUhVanlhU1BnOTZBR2FWNWZRSHZMNG1n?=
 =?utf-8?B?bk1sNnZtaWViZS82cHBWcUFRWXhJMFNwelJFYjIzRUZia2lYdSt0dkpiZ29l?=
 =?utf-8?Q?P2vXf8saBTQ5BX5kePPNXNhi6?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75adcf18-ea8e-4042-ea41-08dac2557547
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 13:22:32.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMayW1QPNnQgUCv1KwWx9BFEC3o3nx9tTQoLo5y5PMTknmX40k7fV8O8YDXagT2NmhjWc4VL3XYwRiekODxHug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5793

On Wed, Nov 09, 2022 at 01:02:28PM +0100, Jan Beulich wrote:
> On 09.11.2022 12:36, Roger Pau Monné wrote:
> > Since I don't see replies to my other comments, do you agree on
> > returning an error then?
> 
> No, my view there hasn't changed. I wouldn't block a change to go in
> early for 4.18, but I also wouldn't ack such.
> 
> Perhaps just one remark on your other earlier comments: While you're
> right about XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK}, (effectively) random
> data in the bitmap may cause a caller to do extra work, but wouldn't
> look to be otherwise harmful: Considering pages dirty which aren't
> is never a functional problem, while considering pages clean which
> aren't is (imo) not a problem for a dying domain.

Can't that lead to failures elsewhere when attempts to fetch those
pages find they might have been removed from the p2m?

We are exchanging one failure path for another, but it would make more
sense to return an error here instead of uninitialized data, so that
the tools don't attempt to perform actions based on such invalid
bitmaps.

Thanks, Roger.

