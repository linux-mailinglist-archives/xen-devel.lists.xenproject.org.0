Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3770632F
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 10:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535830.833866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzCjd-0002gv-Sa; Wed, 17 May 2023 08:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535830.833866; Wed, 17 May 2023 08:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzCjd-0002f5-Pj; Wed, 17 May 2023 08:42:13 +0000
Received: by outflank-mailman (input) for mailman id 535830;
 Wed, 17 May 2023 08:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUit=BG=citrix.com=prvs=494f6562e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzCjc-0002SE-Pr
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 08:42:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b612b35f-f48e-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 10:42:11 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2023 04:42:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6064.namprd03.prod.outlook.com (2603:10b6:5:393::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 08:42:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 08:42:06 +0000
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
X-Inumbo-ID: b612b35f-f48e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684312931;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=K3rDPXXb5oaP+oe6dacAoyK+btNfzMaBSkED60EWD8o=;
  b=ZuNi+j0+dm7OHdkleGqFap86jKxPnQ4wKxBgBTv3Xsp8pZmjgXJVzHaE
   0hHlkfAC+ISBd6X/IXunZM7UXf1CVucymOq8pyRFFZElxTo/5pn03UREX
   PgZevBTNLHzraJSdHpkDZ9LIqnFF7OA0PT+nC1lTwX+F+i4GgtHxsWIxQ
   I=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 109734942
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GAfmV66gKppA5s/ym7hZnwxRtNjGchMFZxGqfqrLsTDasY5as4F+v
 mIWD2GCa/rYMGP9f49zOdjkoB4Ov57Rx4cxGwNs+yE3Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 +QhAgETc06/huO2yZ67a+VwptU9BZy+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOOF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXKkA95DSOfQGvhCj3OMwUlNJUUsSUKqn8CguFzieolCN
 BlBksYphe1onKCxdfHmRAGxqnOAuh8aWvJTHvc85QXLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HTrYcyh1T1R9liGaK8jdroMTj1z
 3aBqy1Wr64PgMAC0aL95kzOiT+oopnPTyY84wmRVWWghj6Vf6agbo2srF3Et/BJKd/BSkHb5
 SBf3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxewC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:yJLq8ayGrN5zhHtXzaIzKrPxduskLtp133Aq2lEZdPWaSL3jqy
 ncpoVm6faSskdlZJhAo6HwBEDkexzhHPFOkO8s1NuZLXbbUS6TXf9fBMjZsnDd8k7Fh5lgPM
 VbAs9D4YbLfBJHZK/BiWHSebtNrrjmgcPY55a6vhNQpENRGtxdBmxCe36m+yNNNXJ77NYCZe
 Ohz/sCgzKhfHQRYICfBmMZNtKz6+HjpdbeehgBCAcg6A6SyR2VyJOSKWnr4j4uFwpVx7Es6G
 7ElBG8wJ6CnbWU9j/wvlWjnKi/vrPau5J+Lf3Js9MSLDr0jAauecBcXIaPogwPhYiUmSIXeR
 330mEd1txImjjsl3+O0FPQMt7boUYT10M=
X-Talos-CUID: 9a23:tnUqMmMm/SXyf+5DWjFe3n8KB54Zc3zdxVvQAkOkKXd3YejA
X-Talos-MUID: 9a23:8x70BAaDthi6BeBTuBHzgxQ8GZ9S/72/NnkUo4dampKZKnkl
X-IronPort-AV: E=Sophos;i="5.99,281,1677560400"; 
   d="scan'208";a="109734942"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwwbQ4lBc6KkrnZhTMdRsN9HOalrEYjVMfz3vayyDKKJyL+Se7UZCsfLhH/EIdueVWqSN9j9Dc9JiGuGwlz42htio+RQjpskiMsAea+rsfrf1KCMhF539fOjPNPIVXMN1TZ/NB0Ri6w3AguziBGH5cMBeEyXXaQnj2zYdwEWxR3r4Q30fALiXKG5r0xIPsBkbbWMECQXXTUg7h0s+ZwTzTJYiUJt4EH7I19DeVOO6cN5CAc+/fuBfrCJTDlMxEZgJzOUaF2Ok2T26nUcrkQDd/ywtR/IoIf8n1k1CkWwai24sYIBbSInCsS3pvgRaLpN73EyN7rTeB6JGCm1BSuVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ4G3CcfL9WU0zGwNpjDGixKrK8s8Ra5A7oUT7as/IQ=;
 b=CLi6A0lbmUIF8z0hwM2QYIp+skg5k0XG9FB0mwm4Uerj92Zn5fqau587ZNH/UGk31DCCEJmg4G+wJmxjP92zqyvd0VThkbkgXQ2hh6WEuKZ2cl+6NqyVOc1J8le9g1PnmH4aJtG6Bfu+7db1+7NmpCf5GNka7mhjNLuSBQl0yvPb+xCGm0NlOtiREWkw9aYqLaNDRlSH2QdQg/VwCJy2bDwVnILNKbyXRQycab0Xq5ndl3t2VJlBpEKXGxCuvNDwxbivZtVXdK/qA3RAug1Ui+O0kx0DLIX9FSNoVchY1PJjLeUe4Sldv9tI07DZdV44UZ4C2lWFdlEZv+MfJDSWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ4G3CcfL9WU0zGwNpjDGixKrK8s8Ra5A7oUT7as/IQ=;
 b=b1BF0lsS8sjrVZ1iM3j+5BYoTg7guBANUOp2KV4+UuImjwJZc/h/74WFIaDx18TVAZMML11RRuzK6CL9XK9ru140hCedI5qIPJYDaPfpZAqxLR1d8s81Fzf5SMA/+zZrRE6D71Kyv5mn8sR53FnI6zaoVYkrSzADJjYogWn/5EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 17 May 2023 10:42:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Message-ID: <ZGSTWJcLmWGPg9QM@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
 <ZGHx9Mk3UGPdli1h@Air-de-Roger>
 <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
 <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
 <ZGM6X19p50oSqbNB@Air-de-Roger>
 <ZGM9vzwGm7Jv6i7M@Air-de-Roger>
 <alpine.DEB.2.22.394.2305161509040.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2305161509040.128889@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: f4809a14-39c9-48d7-89ae-08db56b29810
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1PNPCyVykvroum/qnWYGrhbYu0eyCdJwQRWt8DqyIbSV7cSAjrYY9sb7ddvSaYasW0A+jDvhY/8ysJ7MEcqiWSbliCAOzL5JQoFy5DHVUwfhwo0lKqS/FEtY6gM493Sg+vk1zoTKP6qGnheyEvXiXuCRrAW1jMb4Umcgd4OnaTi0zP39XyYe2AcHG2lowPtlqj+NS3XHr+lNnv9n+VhwntTph0tEhKBWoUI9jsXpsCemk4EUDrLfubGc1cys+BncZL/E4d7wX95jts02Ac9nKk+ZTIMk4FEmE+62Co3tsI17M68IJAD0dhaIW/PCPWMbso9/hMpiRAxeceWkqk7gBViiYLXda+uevPp/yT/QaUtwFzBKiMN5uhqDxl7yFpMbKDznQuxoG+N9aG8famdhsnH+mPvj2xGR+CrRr9skHm7JwxcW1nCEECEyRSN1ZEIpMTS4k6lcz1+WHbdEZq3yG54+d7OmhJI0proDbEImToAyskayvqdXJXPNTSneYESBsUf8KfQSViTh7dXOw5aZLvwt0Mr/zc+5BSLoYYytrvtJUDIt4MAgzRj48S1xJ973
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(5660300002)(41300700001)(2906002)(83380400001)(85182001)(86362001)(33716001)(82960400001)(38100700002)(26005)(186003)(6512007)(6506007)(8676002)(8936002)(53546011)(9686003)(66556008)(66476007)(66946007)(478600001)(6486002)(6666004)(54906003)(316002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3NiekFPUlRwblFUQ1NWNTV3SzhiVTZ4QWxwMm9td1dWUUpqYjRXaytUOFk3?=
 =?utf-8?B?OEJZSHc2Ukg5ZE55Y2txMUN6Y1BVL1N6akMyNHd6V1ByUjF3ZjNBdWlsRHJ6?=
 =?utf-8?B?Vk1nRzVTNEJuaFhJbklrM1ZmRlIzS2pHY2xqRHV3NldNVVc4S3VzVDlHVzJy?=
 =?utf-8?B?NU8wTmsrUGx4QTFTNnA5ME9wTE5vSzNhUjROblZHSUZxd2RkRHQ5cktxUDNJ?=
 =?utf-8?B?S3dxZzl3bmFqT1Q4alVZOXFxVDl0UXFYUFZDZlo4T0ZGazVMRkpnZEVUL29u?=
 =?utf-8?B?ZTdQOWZzcFpETGcvL2VqK1hCTlk5bHhzRGQrTVNyUkcvQllUazdpVm5nUm5h?=
 =?utf-8?B?U3dyc0RCZGUwV3Bjb1ZHeGJKVFFGWHJoR2xCeFd0UWdWVXFtSXBPc1d1VXN5?=
 =?utf-8?B?aFdmT0pzS1lGVzRSZXFvcUtnQkZqaStROENJUEpLRkNzSzYrQVpDUTMzUUdh?=
 =?utf-8?B?VkZWT05qUEpFNmQwWHZwQ0RpZnJjSmgzZDVXQlFOTmVhQkRtN0VzNjVxRkxn?=
 =?utf-8?B?aFM1TkdsL3ZnWXg5dkVDRHpyWWpGWEpEUEFCQTJvUDRxWjcvU1dqaUE0Z2xR?=
 =?utf-8?B?ZmVROFIwWHZWelVxS29NQitNd3lYS2luMXFwcll3bXpnN3pSLzdaSW1IMkZS?=
 =?utf-8?B?M3BpNFg1cldqblhmR1FNWEExWDAwejBkcHdWNjRKbDJzcTNEelNHV0FvQW1z?=
 =?utf-8?B?SmFoN1JDWnVSaWxuUjBYV3cwamtiVk1mMlBCRVBnTi9DMjlVemppcUphMVZp?=
 =?utf-8?B?N3p1ODN0b20vRUdKNUM1ejV1cHBhUGZhbjFyWENZUmhBL0tRWGV4SEVveExt?=
 =?utf-8?B?NjJ6dlB2aW9oOU9XMXV2VXlDWWlKcVQ0bjFycVNpYmxnTVpCaXhtNWtsOVh5?=
 =?utf-8?B?bm1VcEY4bFpTM1UyQk9vak1GRmRVbm5ITVI0dTRLN2l1MzIyOVJpMDRzMlhW?=
 =?utf-8?B?U3d1cFA4anIxNWZXU0pPTHE0ZEtEZFJNNThrMVFlMEVQK3hlYVJBZ1c3cTVy?=
 =?utf-8?B?dllQVGpLTFJDM2lpL09zR243RmhYT3BuTHZNOGNvUTdkUCtVNUo4eVBIS25L?=
 =?utf-8?B?NFFEWVJvZ3Z6dFM0YUErYnYrVzZPeDEvREhHV3M3TEFaUXBVZUNxa2hmVmVC?=
 =?utf-8?B?VzEwc25pWDFkMTlpb1gwR243MERhWUhLbVNkUFIwS3VLOXBNQ01YVHV2NGZp?=
 =?utf-8?B?anJmV3IzQXVGMmJ0TlVIcXVLaUw0R0oxMEdrU2k3UjFPVWlUZS9Hdkg5ejNu?=
 =?utf-8?B?cE1xaVVEWEswTzFoZTExU3NzZ0xtYjEza1dmWUlpVk13aTNhc01XaFpGMW53?=
 =?utf-8?B?bmJjUEU2NXBlUzhxaTNYYjBVRTQ1ellsTzVhUTBzSEVIN1BPdFBHZ21yeGN4?=
 =?utf-8?B?SWlnbENjRGlVZzVoSS9KbHlPSUdYdHBwRG5zQTYyZHhpL2JWMUU0bWlhUC9T?=
 =?utf-8?B?aU1QczlkRHJFU0hKS0kwR0dub0VMVDBKTGFxSFIra0pEWWc3S0djQUxmWmVn?=
 =?utf-8?B?NzFqNFR2WGJFT0xGTjhTTUxUOEJuS1RyNVR5YWZxeFpiNmNlcW9GRHlCN2xY?=
 =?utf-8?B?NEVvRmY0V3VWcE1EaU5VNFBLbWFlVFgyNE9aNHAwK05pR1FGNE1lV29rdFhU?=
 =?utf-8?B?S0s4Z1FuUjUvK0llZy95Sms0UkVnaGZ4dThDcDNmWGVVelZqVUw0NEF1TzFu?=
 =?utf-8?B?ejJLV1lhdGpibkk2ZmtkbWxZTFl5K0FIOXJpMktVbGUzdmYwMi9CcFdsTzhF?=
 =?utf-8?B?NjRrVTdUeHJqWHl4VmU0MmJhSGVWeThhd21VME5KVnp5SmhNcjhNNzBwa3Fa?=
 =?utf-8?B?djczOE5tYlMzeE51U3E0M1QwZTlzMnUvcDM2WE1ySlZsd2V5cm1mWi9vallt?=
 =?utf-8?B?Vjh6eHpRcXl1YXNQNlcvcmJObHpKd2pQaTdvU0kxL2VOdW15SzhQamhGeElK?=
 =?utf-8?B?SnRmTzFFNnBjcU9tMEFQSmMwVXBMMjh3UUp1Zm9JT0xoMXZFMUhLQU9MT0pp?=
 =?utf-8?B?dkdVSFhTeThwcnNWVzJlcHZjUExtTGFBZWw5d0VicFBJRlJWM3RScVQ5WC8w?=
 =?utf-8?B?cUZJbzRWREtDN01BZDV4RnVrL1NnRStVSUZ0bmdoZllrM2liQkRHdE1pd3VQ?=
 =?utf-8?Q?yHoZVslBgIZQgrybDqcXbchdt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/DPfyJvnEXCDmvVvJ1pqR9s8bat1xSXlC0YaxacFdNycGs4KqI2bl0FW0nHWC7aZsnnW2WAVqV4Di95hcA9Q0V5DUPnzJc0Fpqxdrfo/yD71xrdi3YukCPlUUpz/rG8zMTqgzcXFrKmppYva6ziZqogEQoEtriA3+rgTVkMgVo7w8Hu9djCzEa/tPer6jTqLc5YrdI/1kZ7KOzxv5ZV19+QL+Ibwqz7v8YRdmMLJH/0AwPKn1rb6d+Py5HYMXtZWZi/xjklD3WH+MpPQqKjOkFDP88ExdQW9QRe1sg6vhm0W9hB79ngC/25Shex03ISQ006drKoFJ0UV6Wamx35ZJn9Gg3Q8MuIpg9qmIhyA4J+qr5CJC6gnSgzduMkxwANCqdRs4xu5DZQXF3QLJp4uMduO4huQ4TNeUP98v4B099003oVNxtrkaWhMJqynqZugpVvLEYOC99hOj7pDTVRFoSjvh/koYnAFSkivgPkJtxDv9370dv8YEfAYoNcXqcqIQdTDy8WfL3keGEC5w6/j1dfeXgrQB6OvdMsoxmoEpT+XUSllC7J481P0wYLoy/4QQVqpZ1LK8qpKD1rGiFetssRAnkos8SbFIj0azFWZf0SF5ABdmDYbJQ5mMHwHO0YlBO9mtfI2BX0hVptSlSfcKE1ShJoMgFugRj8skYFeBRXlcf4uv5WX+DSZ1b5Y8DCAwFhBs8FNLddx+n04W/S+Z51WJJLfApvUoZdq+xRxf4oB7tpYNxllfNy01LlgcZzBRYzYrdHVB6wGGgeWi/O5mxIOteWFIkn8SDW6BiYi6ff9JqERcpVHipAVBEx19AXKzq88vEfg37eef+p2XbhKvxlhldnFisL5zeXo9tETlmg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4809a14-39c9-48d7-89ae-08db56b29810
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 08:42:06.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vt4p6W4Sw4iOcQ2aBddW+OK/i38trmA61zmM6d3DeXJinOysvdf/dvhFrvR+bIy3XOTzx6ebQbaIZOJkn9XJbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6064

On Tue, May 16, 2023 at 03:11:49PM -0700, Stefano Stabellini wrote:
> On Tue, 16 May 2023, Roger Pau Monné wrote:
> > On Tue, May 16, 2023 at 10:10:07AM +0200, Roger Pau Monné wrote:
> > > On Mon, May 15, 2023 at 05:16:27PM -0700, Stefano Stabellini wrote:
> > > > On Mon, 15 May 2023, Jan Beulich wrote:
> > > > > On 15.05.2023 10:48, Roger Pau Monné wrote:
> > > > > > On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> > > > > >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > >>
> > > > > >> Xen always generates a XSDT table even if the firmware provided a RSDT
> > > > > >> table. Instead of copying the XSDT header from the firmware table (that
> > > > > >> might be missing), generate the XSDT header from a preset.
> > > > > >>
> > > > > >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > >> ---
> > > > > >>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
> > > > > >>  1 file changed, 9 insertions(+), 23 deletions(-)
> > > > > >>
> > > > > >> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > > > >> index 307edc6a8c..5fde769863 100644
> > > > > >> --- a/xen/arch/x86/hvm/dom0_build.c
> > > > > >> +++ b/xen/arch/x86/hvm/dom0_build.c
> > > > > >> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> > > > > >>                                        paddr_t *addr)
> > > > > >>  {
> > > > > >>      struct acpi_table_xsdt *xsdt;
> > > > > >> -    struct acpi_table_header *table;
> > > > > >> -    struct acpi_table_rsdp *rsdp;
> > > > > >>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
> > > > > >>      unsigned long size = sizeof(*xsdt);
> > > > > >>      unsigned int i, j, num_tables = 0;
> > > > > >> -    paddr_t xsdt_paddr;
> > > > > >>      int rc;
> > > > > >> +    struct acpi_table_header header = {
> > > > > >> +        .signature    = "XSDT",
> > > > > >> +        .length       = sizeof(struct acpi_table_header),
> > > > > >> +        .revision     = 0x1,
> > > > > >> +        .oem_id       = "Xen",
> > > > > >> +        .oem_table_id = "HVM",
> > > > > > 
> > > > > > I think this is wrong, as according to the spec the OEM Table ID must
> > > > > > match the OEM Table ID in the FADT.
> > > > > > 
> > > > > > We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> > > > > > possibly also the other OEM related fields.
> > > > > > 
> > > > > > Alternatively we might want to copy and use the RSDT on systems that
> > > > > > lack an XSDT, or even just copy the header from the RSDT into Xen's
> > > > > > crafted XSDT, since the format of the RSDP and the XSDT headers are
> > > > > > exactly the same (the difference is in the size of the description
> > > > > > headers that come after).
> > > > > 
> > > > > I guess I'd prefer that last variant.
> > > > 
> > > > I tried this approach (together with the second patch for necessity) and
> > > > it worked.
> > > > 
> > > > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > > index fd2cbf68bc..11d6d1bc23 100644
> > > > --- a/xen/arch/x86/hvm/dom0_build.c
> > > > +++ b/xen/arch/x86/hvm/dom0_build.c
> > > > @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> > > >          goto out;
> > > >      }
> > > >      xsdt_paddr = rsdp->xsdt_physical_address;
> > > > +    if ( !xsdt_paddr )
> > > > +    {
> > > > +        xsdt_paddr = rsdp->rsdt_physical_address;
> > > > +    }
> > > >      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
> > > >      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
> > > >      if ( !table )
> > > 
> > > To be slightly more consistent, could you use:
> > > 
> > > /*
> > >  * Note the header is the same for both RSDT and XSDT, so it's fine to
> > >  * copy the native RSDT header to the Xen crafted XSDT if no native
> > >  * XSDT is available.
> > >  */
> > > if (rsdp->revision > 1 && rsdp->xsdt_physical_address)
> > >     sdt_paddr = rsdp->xsdt_physical_address;
> > > else
> > >     sdt_paddr = rsdp->rsdt_physical_address;
> > > 
> > > It was an oversight of mine to not check for the RSDP revision, as
> > > RSDP < 2 will never have an XSDT.  Also add:
> > > 
> > > Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
> > 
> > Just realized this will require some more work so that the guest
> > (dom0) provided RSDP is at least revision 2.  You will need to adjust
> > the field and recalculate the checksum if needed.
> 
> But we are always providing RSDP version 2 in pvh_setup_acpi, right?

Yes, as said in the reply to Jan, just ignore this.

Thanks, Roger.

