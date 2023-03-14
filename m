Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775716B9BB2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509744.786126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7cJ-00085T-AA; Tue, 14 Mar 2023 16:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509744.786126; Tue, 14 Mar 2023 16:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7cJ-00083f-7T; Tue, 14 Mar 2023 16:35:15 +0000
Received: by outflank-mailman (input) for mailman id 509744;
 Tue, 14 Mar 2023 16:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc7cH-00082m-Mw
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:35:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e86df55-c286-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 17:35:11 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 12:34:47 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5194.namprd03.prod.outlook.com (2603:10b6:5:24c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 16:34:45 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 16:34:45 +0000
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
X-Inumbo-ID: 2e86df55-c286-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678811711;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MZ7wRc34p3lIkTBG9E9MULay2gyGFp+0vK2LA6si8RU=;
  b=C0/MDQ7BJWyymTzeotZX70FjW/Xr9pkr/CISBeNgDVa9b49V+1q7eN10
   bMERxsRV+rdAFtFDlVhPaGYfst5xY05X05Vwnp0G9xr8MxrPE8Lbht2Kp
   nv9OxXQtrYogWPCzU9todxviA8W2crS4wDitfsetuZXeLYg/eSmmEAHwC
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 99620573
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5fg+TKwAkU/If3dUE296t+clxyrEfRIJ4+MujC+fZmUNrF6WrkUBy
 jYWXjvQbq3cZWTwet8gPYzk9x4OvJbWnNVnSgZuqiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKwT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUUT9
 sY0AwsPVA6Og97r5q2rWuR9oNt2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE176Rx3umB9l6+LuQ6twximXP2EIpIiZGf2OAm/aQhnyvRIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbQGDq5WQQHOZs72S/TW7PHFMKXdYPHFVCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZutm07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:6iZkyK184DS0Y3pmrWcGSwqjBEIkLtp133Aq2lEZdPU0SKGlfq
 GV7ZMmPHrP4gr5N0tOpTntAse9qDbnhP1ICOoqTNOftWvd2FdARbsKheffKn/bak/DH4Zmvp
 uIGJIObeEYY2IasS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYytLrJEtP+tCKH
 KbjPA33gaISDAsQemQIGIKZOTHr82jruOaXfZXbyRXkDVnlFmTmcXHLyQ=
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="99620573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csFSTtnhed/C52rHNRHQBP4pzaloRaFMjIe7NgsjzWIn0xVT4pCOL22j2PmRt/xsTsFh3uwP/OQG/hFgt6eTHiEtlPdTCMDp6fLVxpyxIKQx0AfPxKM1E1G+WHrcQbSto1YV1CHDRNBqKLbici+OfdCcNddE6SErPNxZcFpYegwvUBJo4CoRC6VIWfhUKlJHO25xSrdWDBNpAoMvcCC/wlE4M1xnkyLJQdpf6dBYFGG8Krl+mbSulYztZOj//r5eAO0NlqOcLKqQO/TYv/K0yNZRFtFYaCt6n1nrK7VHV0VsUb/takMnt5qJfJCvgb5xfsKZcKdTFWfXx5WH/7IN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFgkAdfK2aWtavfPvvKyKRjTsv5wgIwYx/e/HvsUdHo=;
 b=QesWjSW21fe9A+WOQM2wsCvXTipG2Kc/gITrCoTJyGQAGBw9mnmkTZBdy9Q6ApwmYfJ/fqS0D5OGhiIIP01VYLOri0cTlzrhI7Ev8IWTfnNLMitrV8N0Eig8H/XWlXDTn3RQXYPGPpf87m7a21nxS+nSYXRJqpvzCGDjflKqxg04zyKnwutxz0MW9akY2yg9HUdDVZOFtJhMYd6Iw/JvQUU73CXmlRZVZ0UgQ+r9KpjjY4vFj7MtTE1RqgePU12mZ6hGoywX785b1nlAOVYEFzdRxTFf7nVaf3s2eYya6BhZzEmslIjBXv1UcWAupIU46HWFa+2wR10eCxCM+PM5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFgkAdfK2aWtavfPvvKyKRjTsv5wgIwYx/e/HvsUdHo=;
 b=FTgzeahkfhn8KK9qSn7LW25FS6n0e8hROIz/Oo2e0ps1axWsF8Jo7wDmafC+OWUe8kdnQ0qap66Z3lk4cgGA7XhdssNvMIIFWlqERHX1uI794I4o+rQOxESeVYmLDXpIO+kqqdTf58aJY8c4kkYPgasR21RHz2/c6QaVj5JVvNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Mar 2023 17:34:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZBCiH+0wXvO98lEQ@Air-de-Roger>
References: <20230314101331.4194-1-roger.pau@citrix.com>
 <d22fabea-5821-075d-07be-7e9378be1b5c@suse.com>
 <ZBB8ejEi4mBktBpb@Air-de-Roger>
 <69fdfa84-cec8-6e76-8b1a-ff4de835a908@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fdfa84-cec8-6e76-8b1a-ff4de835a908@suse.com>
X-ClientProxiedBy: LO4P265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: c80b6ff6-e87c-4659-f4c7-08db24aa050c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TRSMcAAnPygd47Fg21fBTAYCBgV1rbal/Nl372DbqKWnHr3pEAY4qd0bfSsdbsykLsDOA7LFR1d5MAbG10ZWcNBCboVZyvqx0yxebB8pCJHIhDMqtKwOmKa1isF7Y3d6QdN47UNTJ9AhXV5WH1qehLONnMDeYTPFqITWMYvKZZDpWxEbHU4puLRvdWBLtmWUmPiC2ScDo1U14Qtwu5B9CkrLLiErbKfE55pfPO3t/1JbLaxnLba2V3VJY+1Sgxsk+9rbedvNPLdgPCR/UgxI+WaSZfm46mIPdMUMxYNGgU2N4gwfjMGe3GzHzXxwgwIxchjLdXDaryVZoDoIVnVGlO+HD4ZSqJPkWzR2+RetoccaapzMr0o7X004GwEkzPPK5e6IO8MY59lQ2oGF3GYty/nxc6zPOuiqe6cENHc4ts5Jte5s3XfNECgx7DjW0VRSiVv8MXlLUKdonaQufqxGGw/3giHk2C92RO5oTGZ+05n/mit16segyOdsOJueKrDGncKzt7jxGbOCM3/s0Lm+KVGmtrHje6pRufdzAZYgArPHcXac+DgxoWgNznCAVI9N1f93UJmEgd04ASF2MrEHarCOL0/FjidQFBWkYtGxmCZQl2lE9WrCKaXL5h1O7adZcKygddu+C77gu9TmgQ8shP9jZUGLFB9ap7DCLCkWEI6A/4OJ4Dv9tZdEzndmtFdg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199018)(33716001)(26005)(6506007)(6512007)(85182001)(6666004)(6486002)(9686003)(66946007)(66476007)(66556008)(478600001)(82960400001)(8676002)(6916009)(4326008)(316002)(83380400001)(38100700002)(86362001)(2906002)(53546011)(186003)(41300700001)(8936002)(5660300002)(66899018)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWlXYXhRSzZPNUwwMWpMM2NPKzYzbThXd2JXM0dKWFhMTjJPVGVpaExnK2FE?=
 =?utf-8?B?Vkdlc3J3YUFjb3VCL2pnWUxUU0JlTVp0Z01wNkRpOEdwdUwwcW9wSFRORUdJ?=
 =?utf-8?B?LzhHa1duVG1zSm9KTHRSVVJPV1lhSGlhSEtVVUJ5RWM3eXB6RFh4Ukw1VXRu?=
 =?utf-8?B?cEJrWWhKSW9sL0VpSW1OQ3k0RkkySEdJdTdKM3NldzhkS1Bld2xxUWRuZGRh?=
 =?utf-8?B?Mitpc3piSkZ1Y0s5d0ZsM0ZLVjNWcjVNL2s0bUlSUWxTaDIxL3h2cDJMYjcr?=
 =?utf-8?B?TUJyUUQ1LzZ5d2FQb1pjK3MwczJ4RUdJalNGZFVqU3lHVk13VkJnZGJ1L2M0?=
 =?utf-8?B?emR4UlR0NmpXNWpaUk9lVFFRMlM3K0o2b3FnamNSM3RSby9aYjBTT0F1MnlQ?=
 =?utf-8?B?RnRaZTFMb1Z1NUgzVjF1WGFaNFhtdmIzdVFOUWJsY2NIdmZsVWlQc3E3NW1l?=
 =?utf-8?B?ODJYRmI3U05JTzBOTmdEbHFFSko3cHoyaTlycUJtY3VIU3RLZWpBYVlUYVpU?=
 =?utf-8?B?ejRjbDFpbG1DVm5MbWtSWDFmVGFmajh2UDNROXBrYlNUaFZMRmNxOWZQa2lV?=
 =?utf-8?B?UGUwU2lnZjNxbGJrbTA5cTVJa3ZZQWdLUE1hT3FjV09FcmNxTTVQdUFaZGNK?=
 =?utf-8?B?ZFkxNUY2RGdXa1FZbDNQZlpTK3lLVnFpVCtsa0tCalhzR25ZblRQNU5vei9x?=
 =?utf-8?B?WG5NRWNoc3k2VXRhdlBjd3RGZ0d1dkx5Wm0vd0dHYzN1cVZGUXNmcFJtM2FL?=
 =?utf-8?B?NFkzR2pSdU45M3dlVGp1WGhFcTZQa0xPNlFpU1ZkZUFDZHEzTmVMMzVUZk1E?=
 =?utf-8?B?bnlFUnRZUS9JM2F3bXdoYk44SkVYaEs4RDY5ei85V1lTdzFyTG5ZblhndFhx?=
 =?utf-8?B?bzZKVWFpQURTMFFBK3VPdGdXZWV1eHd5TDJQNzYzVEdPOGs1L0xQelMxLzZW?=
 =?utf-8?B?OVc3Yjc2RThrTFRJaG40ZTFtVEhlMytpWGd4Rk9CdklSWTRFVXVURkd4Q3ZP?=
 =?utf-8?B?ajYySnliWWlONVhaZkpoTXlBWGNyTTlxZEM4Ty9pakhENUI0VHRCcE03dm9n?=
 =?utf-8?B?UklUNmx5SVFxS0ZvVEtwV2dYM1BPcnlSdW92S3JwTDl2UG03ZWYzRms0QURR?=
 =?utf-8?B?V01lbitsRnJGMURSZHh6MTljbjBPRXhvZ3YzRlpxQ3lzakd5L1RCZXczUkZa?=
 =?utf-8?B?dFBSOHZWQ3RicnRiMnJqZFUra1dUU1EyNjlWOHZ5T1IzUnY0QmwzOStmT0c5?=
 =?utf-8?B?Q21UMzl1dVJUSWdDemJ1c2w0bVBmSWo4cEhkRUpyNGdVaWpFa0hDblArNEtL?=
 =?utf-8?B?eGI3YTNmM0IrTDkzUjduYWVNUWhHcERUMUppTmY3dUNWT2RnaDdOd0tRUzhO?=
 =?utf-8?B?emxONDBwdWY2aElxd0tTWlB3dGFxa3VQOXp5cE5ydnYzMFllWTJTS3p2VUZ3?=
 =?utf-8?B?NDNsajZNaDY2ZkszZ3VBMHUzdDN2ajE0TEhWVXZBZnBld3lFK1NoYmh1VWt6?=
 =?utf-8?B?WUI3Vjh4WEZGeXlQNktPZzcwUVZNMlFSZFF4RDZxZmwyNmdZV0I5a3FBcXJm?=
 =?utf-8?B?UVkzZTF6OUU0TldGaFF2NUo3RFIvM2hCeWthMlYvMStvQjFoMFJHYnhWNTNv?=
 =?utf-8?B?RnNCQ2FnUGdjUEtnMnVVMlJRRjN1eVNXQWhmeEhxc0hOY1ZzWWlEaXErbWow?=
 =?utf-8?B?Q2xxVUdhVE41L21sVWhlb1dMY3czOEV1dlVXSm5UcjkxN2dPOW1paGU5Smt1?=
 =?utf-8?B?VkZDdkU3MjQ2Q0g0VnpaZEtpUjVyd3FxSkFNUGNCRTJCNVNIb1hIQUM0bGJS?=
 =?utf-8?B?MENpemJ6eUxGVVk5MHpzRXdid3BSYkcyQ3RJUFlxbVM4bnN3REF4N2Z6T3Ri?=
 =?utf-8?B?TDluM2Z3SGVlMWw5a0EvMVBjeSs1S1hmdlNGYWdhRFFvNXVPOEZpMVczLy9u?=
 =?utf-8?B?YytEN21wSEVFZ0lsczZUYjZoSlhWZWl2NVBnVm0yZTQzOVFxajJpbzlnVDJO?=
 =?utf-8?B?dS9Jc1RJTm5LTUF2YTVmUjZ2Z25ReEx1clF5RTlRSWJhTHNqWUtDSk02K0tT?=
 =?utf-8?B?N0Q2ZVpNNTFhQjFFcCtQYnVmVnd0OE1mT09jZVg4K1Z0SjgxRHcyWC9zb211?=
 =?utf-8?B?SkNQWEZzbThuYWtFZmNxTDZ4enZwVFZtTkhtK0xvUEJ6NFJqRFhsdEZyNmo0?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F+Vb31JM6gm8Lw934/2s/uHS31Y/RqGkAIz1sDxSadUftpVPGInosngkdXPkew8kHeMV+TTFN7+w5faG5NQA5+2y0ruSOVzeWb9fPgZAoqn1SXtHyXp9yb+cHJe8iKtHr8qHMEcxVCJCcWu9vN4BCG2skZDx8M4vOTcoC4PWd0jwmNLhrktbbSN5LcWdwPy3ibrOVWPjDpy50HgwEIxDNvlc3IO4Pre+qYYU0p3U7RACtMYUaJIbrYns8BqTd46LliPAs+qEvNFqzOmsPVbwcB/0mduy2tMU8txrtFSmhcCXv6pZJphULSXe+psQsGPnGR+AhJpoa5NuB7ZeozL8mXeUS+yGTjcfpa+/j/CsfKoXO4BbkaeFqvSBTl39XPEYQnGgq7BoxS6jWGmH0LbW4ZlI2mLWcbRWw1bOeFtdJemc27EGVCYeuDRDTobDrzD31ScsEwDU8JgSXjU/Itfjs/tjOtF2maui4N4hjGhmMifVlQ1gRRVz1abWB/r6VXApBnP6isbepS/ua8uPPrZyxiOC7flrPS6q/3WAbjBovXpnWNVHjOWsGEbywRg9k5AyXxYf8pOHhwxOPrqrCwwJ1xY5Da5TR4gFem09TqQ2OqlOYu2CGkER1j6CpPLCjurSGX2s9iTees0u44kjsHtz7QEAHBrAkFb8TukhPibeRWye6eebn26U/mUBrlz+l8di/35ZVp+NhghBfA+ybA/JkghQP6bSt2StE5WuLkv/iR5y7nVLG1LqI38ebgOV1BSq/JHhUOIGyhPjo0kIV47A3ZDW1JnQRiITixsi+56/9g4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80b6ff6-e87c-4659-f4c7-08db24aa050c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:34:45.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8f4RfPei+FNmYq3BT93FogY5jO+KY3FHDdf1vErkQfTvi+zP6rch0XjLvlg7Phf/zxKaEBD7f/29VMWV/PnMPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5194

On Tue, Mar 14, 2023 at 04:46:19PM +0100, Jan Beulich wrote:
> On 14.03.2023 14:54, Roger Pau Monné wrote:
> > On Tue, Mar 14, 2023 at 12:56:33PM +0100, Jan Beulich wrote:
> >> On 14.03.2023 11:13, Roger Pau Monne wrote:
> >> I'm also concerned of misaligned accesses: While we can't keep the
> >> guest from doing such on pages we don't intercept, depending on the kind
> >> of anomalies such may cause the effects there may be contained to that
> >> guest. When doing the accesses from the hypervisor, bad effects could
> >> affect the entire system. (FTAOD I don't mean to constrain guests, but I
> >> do think we need to consider splitting misaligned accesses.)
> > 
> > I was also wondering about misaligned accesses.  Should be allow dom0
> > any kind of access, while limiting domUs to aligned only?
> 
> I guess the code would be simpler we we treated both equally. As said,
> my goal is not to refuse misaligned accesses, but to break them up. To
> keep things simple we might even use purely byte accesses (and then
> perhaps simply REP MOVSB). Special casing Dom0 would only add code for
> no real gain.

Hm, I would be worried about then breaking the requirement of some
registers being accessed using a specific size, but again we are
dealing with misaligned accesses to a region that shouldn't contain
registers in the first place.

FWIW, the device I currently have that has registers in the same page
as the MSIX and the PBA tables is fine with limiting such accesses to
aligned only.

What is it that worries you about Xen relying unaligned accesses
instead of just the domain itself doing it on any other BAR MMIO it
has directly mapped into the p2m?  Any error generated by the device
in such setup would likely have the same effect, regardless of whether
the access is in Xen or domain context.

Thanks, Roger.

