Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06A951DC40
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 17:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323339.544930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzzV-0008KA-5g; Fri, 06 May 2022 15:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323339.544930; Fri, 06 May 2022 15:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzzV-0008Gl-22; Fri, 06 May 2022 15:35:37 +0000
Received: by outflank-mailman (input) for mailman id 323339;
 Fri, 06 May 2022 15:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4KMJ=VO=citrix.com=prvs=1183625ce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmzzT-0008Gf-8G
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 15:35:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29c60805-cd52-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 17:35:33 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 11:35:30 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB2923.namprd03.prod.outlook.com (2603:10b6:3:11a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 15:35:28 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 15:35:28 +0000
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
X-Inumbo-ID: 29c60805-cd52-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651851332;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oKW6JIqzJT9l/kdrfSFk+it6IsUNY83Bc9oZcr041A4=;
  b=gXLYRQIpSru3S+WgUT9jWMReBspRsMMK1zPYS+rzAZqHJV3QEOCSqiqQ
   15XBcFHWLw/kupGMDhFEeCBkubi5BI8iSftSoV6bzerBpQpb7n7graxyI
   6/Jooz9XU8lSa7vI4GOm7zS4KFZ0H8WXmADy/fTcdXwZ4/MUBPUEOA+ha
   c=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 70623337
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pqXdJqmyL5ALffzoDLW484Xo5gydJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOW2jTOayKNjOnfN5zad+/o00F7J/WzINqT1Bt+SEzFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkW13V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSgEJN4OLsfomWABZKWZSY6Me8p76GC3q2SCT5xWun3rE5dxLVRhzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXupkBgmZYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8AzP/vFsvAA/yiQh4KbtatvxZuCmH8txkBeYq
 GKe+V3AV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQRFRkXWF2TsfS/zEmkVLp3M
 FcI8yAjqawz8k2DTdTnWRC85nmesXY0RN54A+A8rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fCQQc2kLYHZdSRNfuoey5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:Nuw3Wav6OYs2KDwwoAroXdIf7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="70623337"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LG9xdNJATDhiJZeFPFcZqngwEYqsdg918F6IeiW6dYva2smqSTXwLGQxS+X5K/C08+A+M/ZnSo3dRGpdJf9zk1qw3MZmDi7VNsWw3sbxGVe5M6vemfcl8qCLLGGizQA6qHjP/cnu6gKcZGsaMEew56jkpCKTjbuXq2YXck0dwa6RBEUMIcYWY1fJXa5j+A6w4BUV4FaJZG/kBHcV/1UaCcl7/Gs0ccaF46sOaBimSSJC7gBgeisxjCtLj4y1gwVAjjr8DF3H2UKbqX12pYeC3tUjK5lo9rVUkHa6Gz5xJjkR2DEd5PxDsxE1e83ncBViWNbySzqzs+h+nwYphnc3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmLsG8TMb93Qe7yuPQkF7sZunb94UW5ByYTU30X0JOQ=;
 b=IfeyBbnslXLkUzm4b9rhszZOt6Mm3s8ZyZI/7qKZPMtDc1mYXEA768r6NW+EktzhoiF6BMGfw6NTpxAz9ZbCFCyq510rTAIpDreHOsM3HEcU1ug7wDV/+1r1dJzqtWIRgiFMt+MCVndUuBgO0KLfS6iY3SQKVvl6wsXRWPtuumKm8mX/YQWaSLBKly3lWXupA7oe0vY45IyZsceSYiYIDXvFMp6oRhJlac02C9fwqMTZ0F13w21YVyVQrFL+nppfIGH+NJe+gzb2H2gKXudBbfX0/j5wXhjC3MiNwf8TceLW9R0UEEBmAGKwuMXeXevZIDGdMCMmCgkmuzhxiCqzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmLsG8TMb93Qe7yuPQkF7sZunb94UW5ByYTU30X0JOQ=;
 b=ofYod+n3a0zHPFWglSMCwedcwei72Kya4LxWbWMl6oHW/0JFBn48q/7yCrRWInWGor92RXb87DDa3KNc43YjAy6FFQSPplAUOZZ+qYTRLv4nrOs38UQWXLVbyTRO7Pc9349QZYzL9ptnoztnrEyQhSSE8as9MHIBfHki6bPA4rw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 May 2022 17:35:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fix symbol generation with LLVM LD
Message-ID: <YnVAPMZ0+dd9jLF9@Air-de-Roger>
References: <20220505142137.51306-1-roger.pau@citrix.com>
 <cc494c68-787a-3cb9-f192-48511d5577cc@suse.com>
 <YnUjICUinDIiNJ3p@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnUjICUinDIiNJ3p@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8e2dec-c0d7-4d0b-73c0-08da2f760c50
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB292347C6FF99165EC6246FAD8FC59@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TVDxQvmZOtX0WWGSJCa6c2tLlFKnwrEh7KkazvzNDDGOlvsCMAHXL0gzasYPimEXoeSCSCAmRrRPgda+iuyNg4z4smq2Mna46dNvKmTykOT9S3PEc7KIeqQ0HOOwPGKhpC494p5nRam1N5k3dii7v+mPDy2e8B78nC16o5Wk0UJn0tSu5BwRHDhiR2RATbHzxX/tBB8CSB29C9IiNIobYFDkKTK1tkGIcftn9tnLnnl2gEJRuAcmuTfqLNOLRQC0breeS3w25uFjSXxgVBmxaxnuH73fa3DZYHmV64q9gfqyZKQrrBbSrGt48Lu1sSAF+aQrt0MaRIPutWbAX4he0B+OlimvZu3I4BR9P5NN+Ul1kNUCy70nCVYbwknd6w7AufSgM4JJnj5A7zr5gUTBNoAfwDWPyMPBCY/gu5tOg7/+prcGqrLJ3BEZQ09IKkaMBKfauxE3gKy4erUAbPGX4GaZpD5rsHZkbVPt6WcOWZd22zZuNDlW19Y3+zDs7gB9Z167RMbN1R3Kqcmr1kXnp49cyQMLfE3OB1Eo6ICOZzcoXc1KUhHVIFO8AQknJfdty8+4W/GdH3HpYrOMOnmvTxUUYkmXQiVCsONFr/OGBWwrDx7yXj72x71BiVVEO7rFpft+2x4tkqxTqiftBUrxx2No/e1E6v6NNgTxwBnD+680PPMctJPwqLy+A1nMcDya/Jmo/C5WOdewPAcpVRA6sY4raN4NsJsmfnFVHlCkIxrQ6Do6E1PDkRQQsdSVlWCCg6xQ62fO80SSMVUgvTz+aEASCAi4scslbJUSSvOnszQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(66556008)(54906003)(6916009)(66946007)(66476007)(316002)(8676002)(86362001)(4326008)(33716001)(8936002)(53546011)(6512007)(2906002)(26005)(85182001)(38100700002)(186003)(9686003)(6486002)(82960400001)(508600001)(966005)(6506007)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG81djhYemZBclpkdHZvMmRTa1VoZUVFY0krN3BmU2xkbmZOa2pFRDFyS3By?=
 =?utf-8?B?Y2I2S1pCWUVoeElvMHV3ckt0TlhzY09mOEJTZXFJZlMvWVV2UXFSeThOVnVl?=
 =?utf-8?B?ZkZ5ZXFUS1Nrb0c0UlB2SkhWNWozZUZRd1lPZ1hJN2RzbUR6ZkVhQTFZNTVV?=
 =?utf-8?B?MVNobkR5R2pUbnlydmZwUGwrWXovajBpdVhSeTdOaWk2eTE2KzVBTTRBVUNk?=
 =?utf-8?B?TjBLb3NZNUFuU0JzOHF6SFhmenAxNk5uWTM0V0lmSEdSUnl4ZXQyMDBhRHFo?=
 =?utf-8?B?eGZDdXFiSmZHa0NhZ3QwTHVQUDdISjdiT1YyRWlwYU5TLzBzSWhDVld1cUdR?=
 =?utf-8?B?VnZzUlloSWVra1ExNHdrNm9pOG9iL0FYOEJpSEExQklIeW5sb3hWWlJJRmJP?=
 =?utf-8?B?OTcyTklSMERDUFVhMmY2YVdvbUF2bTFvWnRqTXdyWlh1WkdoT3dibFE2YWg1?=
 =?utf-8?B?SS9YVW9JMnZoRERDZFkzWXhSbGd2a0o5ZUJOZzZqRTVwUmE0UXVNR3NQeU9m?=
 =?utf-8?B?SzRGZ2p0bFNFNEltT2lxNGloSWJIMldVT2VzcVZnMXN4dklCUW1HTURWWDVk?=
 =?utf-8?B?c2haRTFtWk0rNC9wdFFVMGhOT1JBbHVWT3A4RmxUNmxuTGF2S2M1ZENBZDEr?=
 =?utf-8?B?Tk8rVFhvTHFSOUxURUYyYk5vMms4Q0lqRmJ5c3dtM09hajZia1R1NG1vVmIy?=
 =?utf-8?B?Yk9aaVpRdnZiV0hvM2ZsZXFPTGQ1eFVXWmNCczZKQWxhZko3S3lMRW1TSlJm?=
 =?utf-8?B?NG1hQjB5NGZhZlR1eFQvWHBXTUkrR3k2UytPbHJ1MmFYeldncXZEbU5TN0VX?=
 =?utf-8?B?QnVlNTc0eG9DNGZXN0Irb0RmeDRadENpNWpYYXNKQm9kUFZqTGFYOXBZc1FD?=
 =?utf-8?B?VW5oT3VrRjNZRTY0K2d5OUVtd1FsbFN1QlBNME1SZGhGK1FJR1R5b3BNMFZT?=
 =?utf-8?B?cDRCbmdGK3FIaGh0RVVUb0dXWWRQYVFHbm1icUVCOWNxM1hmWUJaZ0c0b3JO?=
 =?utf-8?B?RUxnZ3lNN1pEbnZocklyaU42VXREMGRtYzMvUzRzNERZVTA2MCszZEo2VGc2?=
 =?utf-8?B?UmRuaUtnTWx5aVUyNGpGRU1qZ1FvUis1c0JqdE0vdFp6REVwT0JsaVNkdm8z?=
 =?utf-8?B?WkoydlNiWHFaNFhQcmVvRWJzSGlqdVdqWCtXVDZqMzFHYVZXY0J0OTJObWc4?=
 =?utf-8?B?OHBBeU43SE9TeGNiTDZwS1Q2eVFHL2RsdGRvbHVCS0Q1T0hnVXl4Vk95ZVll?=
 =?utf-8?B?K0pzNWVQem4vVURPZUlYRVo2RFprRGo3QWY2eDJyNXMxQ2dOaGV1ZDY3ZVhO?=
 =?utf-8?B?OG9Pc3lKQy9xVU00YzA4M2xNMkNJYUdnNlRSY25pbmVKb0VXajEyckV5ZEVV?=
 =?utf-8?B?UWdMUDhTY2pWNHZqL01PdERiK09yeHFqb2F4WkUrU1R0RXIyTmdGRmVvSlRZ?=
 =?utf-8?B?MnNMaklUSjljUEdyVlZ3bklwb01uT0svVjUyTnJmcUE1VTlsMEZidCtUcnEw?=
 =?utf-8?B?dmtneFR6TERXNVBRNDhtN1BMUm9COFZnNEdpMTNTWFdBQ2g1MU85MEFMUUFo?=
 =?utf-8?B?blpIMEtQTTU1UzdJOGJVR3R0WSt4d1JsK1B4OWh5QmxGSEFJajdtaWxheFlL?=
 =?utf-8?B?T013dFc3eDAremR5QmEyNU1kdkhTNUF1enhwZ0Z1dVlSOWZMRkZMYmd3Mjgv?=
 =?utf-8?B?cnlLUXpNWWc5RXh1VW1KNXk2MXdOam9PMWRnanBCWm93MWxFRFl4dzBRWnhG?=
 =?utf-8?B?WEhZUURacG5YR0xLYmFZVHpjZmg5V0ZsMkppaFRlemNyTUFFQkFjYXU1TmtG?=
 =?utf-8?B?ZUR6Rmg5dVFqd2svUlM0c0N4UW9sMEY3YkVxVU5zMXdSdGFTZzZvcVY0bU9i?=
 =?utf-8?B?ZENzMElPTExmSFdLOUUvTVQvdy9OMjFYL2dLanJ5SElYRTN3TnJOY1B0RnBT?=
 =?utf-8?B?S1JhZ3Y3djYvVnF1MVdkUWpxRkp3ZWd5K1pqUFpkRktVSzdHeEpLSTZnb2Ju?=
 =?utf-8?B?Wm1TVUhkZ2FubWVQTWF2bVlHUFc2MEl5aUUxc1hyRlkrT1p5ZksxYjJEcVlm?=
 =?utf-8?B?V2FDTGVvMENPbXVuQUtyS3JIRjg2ZDA4L1BtOTgxa3dkOUtWVlFSTCs4Q0dN?=
 =?utf-8?B?M1lFTEsxeEtXbzFZVmFNNkFhNFhvVXhkZ1RHRTczWnEwODRYNkwxbG80c0NH?=
 =?utf-8?B?UHBKL1ZOY2s0YnRWVzdVdDRTWkVxYURXSzN1ZnRtRWpWK2p2SUpmK1g4bk1p?=
 =?utf-8?B?b1haekVBWGpUeUg2cjRmazhMb3BucGNqdG00NndHUTVpVmVSN0I4c2Jab2pr?=
 =?utf-8?B?cVB5NmxMUGxKY3BlbXkzRVoyWkdVZEVPUS9RdHhEV2dwYTBCYVBRbXdJNTJ5?=
 =?utf-8?Q?WvTXI20QKSFE6/z8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8e2dec-c0d7-4d0b-73c0-08da2f760c50
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 15:35:28.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huadGEemcS6E35yYakzJoYU6Fjx3UG0LvNUkPl72hN9cce147FN7Glm8J/h9yYX+CY+vkQ+swOEf+pb/HyiHgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923

On Fri, May 06, 2022 at 03:31:12PM +0200, Roger Pau Monné wrote:
> On Fri, May 06, 2022 at 02:56:56PM +0200, Jan Beulich wrote:
> > On 05.05.2022 16:21, Roger Pau Monne wrote:
> > > --- a/xen/include/xen/compiler.h
> > > +++ b/xen/include/xen/compiler.h
> > > @@ -125,10 +125,11 @@
> > >  #define __must_be_array(a) \
> > >    BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
> > >  
> > > -#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
> > > -/* Results in more efficient PIC code (no indirections through GOT or PLT). */
> > > -#pragma GCC visibility push(hidden)
> > > -#endif
> > > +/*
> > > + * Results in more efficient PIC code (no indirections through GOT or PLT)
> > > + * and is also required by some of the assembly constructs.
> > > + */
> > > +#pragma GCC visibility push(protected)
> > >  
> > >  /* Make the optimizer believe the variable can be manipulated arbitrarily. */
> > >  #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )
> > 
> > This has failed my pre-push build test, with massive amounts of errors
> > about asm() constraints in the alternative call infrastructure. This
> > was with gcc 11.3.0.
> 
> Hm, great. I guess I will have to use protected with clang and hidden
> with gcc then, for lack of a better solution.
> 
> I'm slightly confused as to why my godbolt example:
> 
> https://godbolt.org/z/chTnMWxeP
> 
> Seems to work with gcc 11 then.  I will have to investigate a bit I
> think.

So it seems the problem is explicitly with constructs like:

void (*foo)(void);

void test(void)
{
    asm volatile (".long [addr]" :: [addr] "i" (&(foo)));
}

See:

https://godbolt.org/z/TYqeGdWsn

AFAICT gcc will consider the function pointer foo to go through the
GOT/PLT redirection table, while clang will not.  I think gcc behavior
is correct because in theory foo could be set from a different module?
protect only guarantees that references to local functions cannot be
overwritten, but not external ones.

I don't really see a good way to fix this, rather that setting
different visibilities based on the compiler.  clang would use
protected and gcc would use hidden.  I think it's unlikely to have a
toolstack setup to use gcc as the compiler and LLVM LD as the
linker, which would be the problematic configuration, and even in that
case it's kind of a cosmetic issue with symbol resolution, binary
output from the linker would still be correct.

Let me know if that seems acceptable.

Thanks, Roger.

