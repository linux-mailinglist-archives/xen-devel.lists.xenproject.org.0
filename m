Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535636A1E88
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501192.772829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZzH-0005HK-8v; Fri, 24 Feb 2023 15:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501192.772829; Fri, 24 Feb 2023 15:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZzH-0005FK-5n; Fri, 24 Feb 2023 15:27:55 +0000
Received: by outflank-mailman (input) for mailman id 501192;
 Fri, 24 Feb 2023 15:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVZzG-0005FE-BS
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:27:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc3f75cd-b457-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 16:27:51 +0100 (CET)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 10:27:48 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5118.namprd03.prod.outlook.com (2603:10b6:208:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 15:27:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 15:27:45 +0000
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
X-Inumbo-ID: cc3f75cd-b457-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677252471;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w72nSpG8huOx7jsZcNfSm8rLlSCP5++qKuhOnPjC29o=;
  b=h1BM4mCLQxkahBpE67nJrbTg47RKPeJjX0k860kBWlsksWYjKis5Xcq6
   6crpRHiYLA7VxWfWo7L4+QzDNzcdxzDiRRWDwTmlvVKB2+MV0+Nq7wpnz
   po5evOkpDpC+hGV7gS1HdeL5dsqEOGy74DEQDkB4Ti93M1WJOZ3loVPX6
   w=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 98335931
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mXfRPKIu56Mhlg4VFE+RMpQlxSXFcZb7ZxGr2PjKsXjdYENSg2YPy
 WIcWmCBbvqOZmb2fYtxYNi28RlUup7QnN83SldlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5LOmBO8
 KZAGAsmLQu4mN3xw7OxF/Nz05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHOgA99DT+TQGvhCoASOxFEJLkIsD0K+sKKVjxOOWdJDA
 hlBksYphe1onKCxdfH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv5sEaezisD+EBnqw
 i6Ntyk4jPMYistj/66y51zAjhqnr4LFSQNz7QLSNl9J9St8bY+hIoevsF7S6K8ZKJ7DFwfQ+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5dEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:UvX3Sq1QUCqQT0GcwvIXmgqjBGokLtp133Aq2lEZdPWaSL3jqy
 nOpoVl6faQsl0ssR4b6La90cW7MBThHNtOkO0s1NSZLWvbUQmTXfhfBOLZqlWLdxEWtNQtsJ
 uIGJIOcOEYY2IK9voSIzPXLz/j+ra6GWyT5ds3YhxWID2D7MpbnntE4tLxKDwKeOCOP/tJd6
 ah2g==
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98335931"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUagpEqwUZAGYdui8p86e9sOSXe71re/w3bz6tivHXtv4X3Bjhmchu1WSKe8BXmZO7wnFhn/PeQjnTWJ3MmghL/9Bx3PyEsyRsFtjNw9P9JkzRzjDGYqXBGpu8dS/hJseRCAaR/+5ZS7OnlFz7BhCkyDvP0+ba3OxHban03uMmF9V5xI2xNoWHkV4xG5CIwmGJFMFhP5GM+R+YbyHjd2pk69yI5My+37zR48o1bQ+9216gt3TB9FEWiXyYJ6F2uyN4jgVGAZWqs93QMyaDoXGbDfLe4zBTIThmw7R21s9AlVZJintsQ5lgJMbwgdUKnMd9Y7BEaqMJeMvmuYrSCO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO5sceEjNml8Su0R3x+JE4rtA4mDswN2OJ0CMgHQOKc=;
 b=JeqjnFp1ertRtWngwPVPDAdKidNK4Vxzx/pnuHFAEJbKKLQoZkbQcOmn9FbFYTyLGwdg9qbMS5O1KQc+GkEDaQDdUtnNtCdmqX3WIXKMZ06iNRe0qQMlZC2OepCnJeqnGK7j7l6btHJuYoBP/72Xd65MDHuXNuGrsYFCxJED4QBnnXwFAzu8XEscLDyIoBw+7+hFPRUwnbV9HJPj1z2imn2GuhKT4NG90anBmZOeoBP/R9F5EnjKjABlkBq4YVQwDVG5xOMAye1vItI854J9KDjfxr8x4CJH3V7sGNBbtL4T5k+fOgWhUMxB+u8lEmMTJr187ss4LBJkFowgHSjLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO5sceEjNml8Su0R3x+JE4rtA4mDswN2OJ0CMgHQOKc=;
 b=nnSBX+3iZnSgqkPB3QZ9RwDEX6fiGb8F5PHoheNsUNaq+Q7yNm1kKObvi9hR1WsJ/HV4gWoa7wGaZJAdUuFq8WR6LcZvnyo5LJzbjK8/SVFR6FgealiymX8OwpJTZoFK16FnOWfCk6wZnVUQVO1HbbTooroMqCIWl2JPMRBdalQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <88839882-29bc-0de1-ae6f-f47dc1ee3aee@citrix.com>
Date: Fri, 24 Feb 2023 15:27:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 3/3] automation: update RISC-V smoke test
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <38ddf88eabd9cc36c332d6a27c6ee1242d33df19.1677250203.git.oleksii.kurochko@gmail.com>
In-Reply-To: <38ddf88eabd9cc36c332d6a27c6ee1242d33df19.1677250203.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9e249c-cfa2-4e5b-a0ea-08db167badac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9dkvnXFG727lCOpAg6AtEsiREP13yIdBZw3HIGBcT2+J5+hw0EvAyfo1xMjFSfJz9jyzTYRHKVncp55hYYLe3AH8F6Y/qcT/J0E+dd3mn/dMrxjsOcPPxBUbg5oOxh7vYjwaPS11Wzhz2hLlCdgbdEOYNd/Kp+ZMKtxgAI23hx4mBJeL97qEnt4beSvAtVTu48ylEFd7GOCTPvhM2o2YZbzIapusJPz+tfJzz4etHSbkJVoSQE0m4zD2b25CkkR/jDmAVROvVu37jnOKLheJ8p+sHmehftHSi14xA0tnc5cpo2V2Q/m9zhtdwl7DPjtL6BpXR8SuCAAkeccerK1tbmtkcCGZVI5JJcpJCTUPe0aqdIfwGjfNRA5ulUxgET1SH8sIjMk9dwfuSAd69yHQJv4yCWVFBRZ/xx4w2IYYxW23gFoswurkiU/EJgeMYZ5mUwJNW695odQrl5+m5OW7227hFi4nAkBzNSe3z6JR+bG3ip+HdC7maa0PscV4bCrzfiA1YYrALdqe8uFjseALLwh/jimusDxh0J3p4tR+3/i8t0Mq+uXlMRaOtnbrk9U3R1uMAFLXK2MtFUAhgxzq6HOfp6J9LyX3dDM0wGqya/e8btN95wi8soDzV3fwn2NCVhFsChJPWRj+glYjVfBORC5lNvOFqf09lrXp4qyL/1Rtt4sdpsxPXenRI0miiWHEvs7Xj1AfMIQbNmYYNnJWUQA6VlUq8nXa1Pgnt+QFfnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(36756003)(31696002)(86362001)(478600001)(83380400001)(316002)(54906003)(6506007)(6666004)(53546011)(186003)(6512007)(26005)(31686004)(6486002)(2616005)(2906002)(15650500001)(4744005)(38100700002)(82960400001)(41300700001)(8936002)(66556008)(5660300002)(66946007)(66476007)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmF6UWNTMDFOZWlSL3NDQ2FLU3pjYTg4c3hxM3B2MDlJVVo1RjhHcXcyTGJL?=
 =?utf-8?B?RHkzTWJKM3doOVN5Qk9UR3VYV2dONFZwZS8xM2dqV1NuUDhPd3cxQzdRanFr?=
 =?utf-8?B?RVNKT2FRSlBLRXFiYW1kdEJDQUJGd2RNRDdObU9mRGZwZkZOSlExZWNSVTV2?=
 =?utf-8?B?ZThkeVdtZDVOZERkVFI0Wk44SDNCK2dBMTNPdlBwN2NuVEFhVU1JTDhXbnJk?=
 =?utf-8?B?UEhsRCtzMG5YWUl3aTdsRW15QUpUV0FMTnRON2xid1N6a0JLYnJja25NeHlZ?=
 =?utf-8?B?U2pjdW11b2pOMGVGUGdxSU9ZNmpGdXNHUHRmNFkxNjRHSHdybUZFVXM5M09G?=
 =?utf-8?B?eVY4YnQ4eitoZkVvMVZmdExxRzlRQm5kZHNqMEcxMDFlYVNmSzQ5KzRDN01t?=
 =?utf-8?B?NUw5SHRZcTJxVEV5ZWJ2dFJpVDJ5THZMN3ZZMEFVMXJhWG9EcGN6TkVzWkta?=
 =?utf-8?B?SFBZd1NlQ1l1RlEvUXZmTGo3RUNOb0xaTmUzT252VXhqNW9WRmgwZVoxeTU3?=
 =?utf-8?B?T1N4d05HR2NhY3VrVFJ5RldHb1JuenBmTDc0aEd6RHlqN3ZDWElTWVJHZ2d4?=
 =?utf-8?B?T0Z2L2o0eE5Bc1JBWUNnV0VtV01pbHFJcEQ1b01vRzIvdTI4RWlkUUNpMjdh?=
 =?utf-8?B?NHdrSXJEZXE0TFk2dkFYTUFTb1VqVko3Y1B2WlFocThrVkRLbTk3OXdOajhu?=
 =?utf-8?B?Tk0ySUN4YW04SWlJRGJwbmIwSXZubWd0R2hrTmh1NEdNRGtKRlg1Q2xOM1pi?=
 =?utf-8?B?L1RYOVRPOUdWQ3I4Sm9lRVRzZWJOZWg0cnRBWnlTRC82Vi9jaEN2VHVGaTlC?=
 =?utf-8?B?NUgzUmlGbVlUS1Q2REVKV0F2RmxmSW85WXRYUjlvdWR4RDJjdWI1bWtrU1R0?=
 =?utf-8?B?b2lQMjZsektyYTl2SXZRMkFlMG1ZaTBrQ3pwcEdEUHJCekNRd3NVT01INzlo?=
 =?utf-8?B?R2lFYzFFY0Z4d0pPUGdUOVphQmZUc1M4SjVQUDlLTG1leVlSUmJra2pSNVF3?=
 =?utf-8?B?RWR4dWlDQ1hyVGY2dnBTMkRxT09nVmthaDFMUDBWZ0VaUlZTZ1NGVi9DUmt5?=
 =?utf-8?B?OFFMK20xc0p2eHRoUlBwQm9BTW5XZFVPT3RoUzcwUHN1YU9sdHhsRWVEK2V3?=
 =?utf-8?B?Yi9YWDEwTEdtUkwwM1hoRnl2dEpXZFdnMWZwRllCVWYvVkY4YzdhVy9xYzJr?=
 =?utf-8?B?K0Q3SXQza2UzOHhTcTdYcU9QZjloLzM0NHZHNFR4YklGTVArUTE3Ukp0T0FF?=
 =?utf-8?B?ajNOUUhzWmhHdWlvdHBkKzZjdmZzcTZsMnBZWWRPL21ndXo3bTM1MzEyUVdw?=
 =?utf-8?B?cmdNS3Q3ZkhVa2ZqK081UDYyLzFNRU83WFc4VU0vcDVXZ3R4YjhOQ2Q0UjI1?=
 =?utf-8?B?SW9jRVV5SU0zNmtxVjRiYUI0U1krdzF4bWxvVnZvem5GdjVTTVV3T3R3bkp5?=
 =?utf-8?B?SVBFYURkQUNUblAxbE9YbkN1bldCNDRMNlpUTzUxMCtpdWU5aUQrQWtoTTIy?=
 =?utf-8?B?V1hDeWZ6YnVISENGWHljVWMrcVdPbUVCcjBKWDJxTE85SGdxSTJEa3ZzbEtM?=
 =?utf-8?B?bENmNFhEc1ozUGpXUUg2bFZqREJ4cnlTRyt4SU5PNXBRN2NRZk8wS2FtU2Fj?=
 =?utf-8?B?R3FvR1ptOVhBTitpckZsUE9xUHdJZnBrMFE3LzBuNWcrNUpnYTQ1NHdRUkF4?=
 =?utf-8?B?aHZKM1hMVnd2UTcvZTRyaEFwOGliRVZlbjVvVmZtbi9lUmpyRDQvM3F4dnhL?=
 =?utf-8?B?dzdYc1g2RTRrZU5jOU9PUDFHNXVPTlQwTWMyOS9PRGRVdmtGenZvZXlRdDF3?=
 =?utf-8?B?QzZCNVlpTGRMMmh6bG5rcW4xZHZaVmc0aVZJNWRBTmJ1NXIySkM2UVpUblp1?=
 =?utf-8?B?K0FiQWRManRVS2E3NjUzaXQzSDZGVUFNVHliYS9yYTZ5cUxkTVlKSWVsc3Ji?=
 =?utf-8?B?L1pQbEJvby9wUDBUblRtMHpXV3QyNG1abTUrVDArTk5BWHA0ZVQvekM0TVlz?=
 =?utf-8?B?MVZkN0k0U1VlZFVQclptOXhBaVppVHdDR2Fhd1R5UFEyZXd5dUhpaHA4K1Js?=
 =?utf-8?B?YkwxOUpYcEkzSFNBSXVsbnRxSVVyb2loc2t1TnVHZHVuTzhscHIyRUlPakRz?=
 =?utf-8?B?bTJzMjZOQVNJZThqWGs0VW1JeDlxZjNxbnBMM2hUNFJYdFFWWC9IdHptbkkz?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TCDyl738H33DditxABzv7QGhxdNyCLOtCrHykUJH5v6eSZiJMsWyVbk+MOalmXyquOSVcq2BdDjEH+3BdwrUaDhJi6Y8zgdsIpNAX5vZQ99xgXtuutJUBmNBi7O+tlKesyt/qQ6QBKqLGEzhfojubamPhdKSQJ6JjZ0mwnz+zfu/18hYvVdjhZ5cImN33H99hZmNgFRtMubl+wOpiEXxXNlnYs9Ep58E7R26/cs4EpAQBiDqrbWqgT9PU54Fn0l4C/iI6tHCrnLhGGQZ3QkdtwMH7J9i/MnFxi3hQhvqloagzmdD/0MV4Zwbj4ZM+Qu7o9GG3ENHGtxVG8ub5u37grpv0mu+cd1jL6N1F72AnbdzgjVkXAbNZlx5IAMvjrGM5Ul5TdQLb9qH3EKqfCagufyohhpEusbduABXlGup4qhFDoVNg4pDEOWhpIC9zZYuq85nhNlrsOt3dxofTYXb9EWtlAjAF1DCZ2z7Cq7eb7pUsCOEfL3ClhaRFN9dkh9j+uhg1Xk9SwbhjIyYc5BBQnEUPKFunXGYhfBumEc2etlYkHkyTqwZGSgYWgFV7tzIZaBNfhCUc/08qpuXpLi2a1DDkzTcgIPfnNuwbBrizUvwif1Li341D3zNSQ84ZpZcBCiZIbqErAVzHI++uRmO6lZS1iYRTC/H9N+lzk0ByvcLIaNoEeK2ocuEQfplMb8o2YwwMCb4z0VJ2B6ayAEtb7pkklHFD+OBcHRDyYCDZxQGXtll4fPlgV0D2QEhtlhss8c9YwL/qCzxdh+Q5NHoWj3j148je1/gOdvgZJtuJ+kSAlsyT3UmnKeTsyCFAWaoJs9Gq6+XTJey3tsPOko/GXPTNMRJBZq8KWzoS/9rrYvJ6kf7wiaFC8LxcxieWVqstQo8EnFrH3DclxYWzEGgSQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9e249c-cfa2-4e5b-a0ea-08db167badac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:27:45.6117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vt5NEw8FtALWIqpX+Yk6hJ6LcCcrFSPhJQGA1FHDSj5azpfEKCMcoAvmZcvFWNoikZhJC01ItmS9Bj+rWUcJU329m/CKRo66swpWZqYM764=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5118

On 24/02/2023 3:06 pm, Oleksii Kurochko wrote:
> The smoke test was updated to verify that MMU has been enabled.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/scripts/qemu-smoke-riscv64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index 02fc66be03..01cd08e407 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,5 +16,5 @@ qemu-system-riscv64 \
>      |& tee smoke.serial
>  
>  set -e
> -(grep -q "WARN is most likely working" smoke.serial) || exit 1
> +(grep -q "MMU has been enabled" smoke.serial) || exit 1
>  exit 0

There's a more simple way than this.  I'll do a patch.

~Andrew

