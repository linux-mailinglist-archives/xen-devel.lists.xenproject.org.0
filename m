Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7368E47C15D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 15:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250463.431408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzg0N-0005vX-Ed; Tue, 21 Dec 2021 14:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250463.431408; Tue, 21 Dec 2021 14:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzg0N-0005tG-BL; Tue, 21 Dec 2021 14:20:39 +0000
Received: by outflank-mailman (input) for mailman id 250463;
 Tue, 21 Dec 2021 14:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzg0M-0005tA-2B
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 14:20:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ac4f22c-6269-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 15:20:37 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-vXBlJ08rNbKbxqu91THndA-1; Tue, 21 Dec 2021 15:20:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Tue, 21 Dec
 2021 14:20:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 14:20:33 +0000
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
X-Inumbo-ID: 2ac4f22c-6269-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640096436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBOjWOSMOAdnb66EmLKJww4FT4bEMke8+BrznDdGqqk=;
	b=fJ4kewjVupKj/EYRz+d3YkpFIvCFW1WwcaUfNevYvfHMNJPk74Q/Eced4v6Tmf2za6huGE
	AbgEhJAMv5YaRRz31UxNrY3/aIGF+XpP/+pgKvPaP4r4nXs/Rfzll92ZP0FxoWp3Glp40H
	fvjEkDCun1K8sKeujXkJ/bBfu+0wvYc=
X-MC-Unique: vXBlJ08rNbKbxqu91THndA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYqTB7iJTe2DAN8agmDNGiZbEE2Xt+w26nge4FELqS+69YvpOeE13fPvNPXdKjBkUTUcKiUfA4hbyHqomC81Aw3CSWtPHwzS3aKXgfeyagJUp0OjyTsD5YOv9SoNfMnVHCG80JAE/zOzoMdrIZ9fIw3diGukIAUQDSG8wA/zu1tkLI3hxcgLGsaA8hsKVtwYNdiVZhaz+wBDZQeVUIcdj4Ma0/JLigtgB4hJDIxItKF7MdSIMrIp4YJu0xklgRONbeohNmkO4zBlv3TuqzhL8Jigf6u2qnQd//ECYPLw/znA9t/53qWBIuTe1uHN9/yoBGsAazvO/DL3ekVIwM9Yig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBOjWOSMOAdnb66EmLKJww4FT4bEMke8+BrznDdGqqk=;
 b=mZVlpmuEvJyGe+pzj8NUbPQSBejDU/SotA6G9p7WUWDV4suQWBHwfuZVH85Z66zbtsqcM99djPBbfim717EbJpACiHufU8EumpagPeEuJAFyhMswCIyh0iBiCIp3DZXEulN2jdv5zEFI1JdQYNaIaO5xq5Z7lsjBRngzZMY2CWSCJoeEOiRkUAGvz+AfiA6VQn5UJISFXZpCoj3MEPQMihFBhE6eHGB/Et2mnQJnW9iMTo111ySOo3NKiRKbt+qc8z1pN8WCfgAPlQc16MXAZzrWKT/TZuFMeqMbFBIdV9C9yfMPWDrDfEQYBPuVmTDFijdiytwnHQV8VeAWekG41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1313e18-3a99-a350-f262-fbc531f582e4@suse.com>
Date: Tue, 21 Dec 2021 15:20:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 34/47] build: add %.E targets
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-35-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-35-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0088.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a28a39a-9a0a-42db-77f5-08d9c48d0ce8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53250AFD4D68BA38A4ADF04CB37C9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PJP4CSr55rgt1XCtFGJGuHx3bonbB/jDMwHdNXL7gf1BEYkYEVkGmVhzP5ul9MYpjAKrZooWRiX9GJmS8po451mS1hlSRHrzJBmnw2dOEnrx5Ri01C1Rff2fxVqlqcggVyLIfNwrRzG3rnHhpfPW4Duuwa9aLf4j1w6flLm0OdYv4Mz3TaddbTG+Y4+2EoJi0ECp0wAX1h/ywyolgZ8CpV7DqddzQfrlovlg9H/mIF2qQR/SL0S3JVxNUa+YS8dXexbn/7SgkJ8z7E8L0HxzJTH3uZgrE1RTOALWoHTF+/qrchxGTsLtj4VDwpCILmeH50ojfJ6CZeH8zUycTQppuWWBDQkNoGh1Y5z7nBEflVWG74FT4864FPz1YDMjxfd6z60xBCZ78zBsrqdNyHcg0VBbwDgtImuy8mPa5lmoQlpkfO5CVwnTW8kbvCnd1GrrxoPsjBfyFN6foj/U22hpJAMr/r+bnqj2HPA6NjmPjWExcM/35rZ3qb4dOqMd/Oh1n3nB2qOi01501oW/PK7/n2QZLI32Pt0/R+lXqdKsVD86G9rVucSW8GT4X00+wyudapE0SXwDRM0B2MNM/b8D90W65FCXofWiOKNqD1Y9Xwm8QET5igJGbsfA4RY0SVMCyH9qD5l93ygPzqXdV/Vgi7kwIobJAKTY9+6P0Zty2ch/AuNIslGFo5tRvi4dIVEsnpuf3vPHgoWC6qYlRzdGmdksMTbgUKHotcFuMU2DRA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(186003)(31686004)(6512007)(66476007)(316002)(26005)(4326008)(66556008)(558084003)(86362001)(6506007)(53546011)(36756003)(6916009)(66946007)(2906002)(8936002)(54906003)(38100700002)(8676002)(31696002)(6486002)(2616005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFhkc2lNUllnbFVkNGNycXFPU0FkeVEweG42Y3FoM0lPa3JMK0NrenRBRWhw?=
 =?utf-8?B?d0o3OEdiTTl0KzRTdVBGMk45V1ZRUGVoM00xcXVYeTZGaVlxTExXMWhJL2o3?=
 =?utf-8?B?OUYyTXpSUkpvbFVYVVVPdGxpdm9QaG11ZnQyZ29jVUNrS3pHVUxJcWNTSlFC?=
 =?utf-8?B?dHF1Mjl3dDc0ZHdKYXNLUnc4c2orTWpJR0NBamZKY1JhMWxuZnc2VUN3UUF0?=
 =?utf-8?B?QXNna0JzRy9reVJtVlBjZ3A4bFVpOWVzZ1dNUG5GdFdGdmhxSTdOdmRybVE4?=
 =?utf-8?B?L0tZMDUzYi85MlIrTS85U2tQT3NTa1RhQ2MxcWJTM3VBbjV5K0U5SHJIVGtO?=
 =?utf-8?B?MjZCUXU2U3VnRVZlU2dUaEFSdEFLZUFVcjc5NzFxRVZNZjFNR24veWR0QXlO?=
 =?utf-8?B?OFR3UUJRcmlOak95ZGdpa3ZEVnhaQnBPU3hNRDdxSzg0bkVZSHFLMW1KbzBk?=
 =?utf-8?B?ZlcwMzdhdjRtbjBGK0ZZK01YT0YxMm9RU2FnRUpWRUlqQ3ZzNU9pcHNoa0pi?=
 =?utf-8?B?eVBJUzJvam11Vm1GSzFkcVVOMEptaDhrK2ZLQXB6OHAwTUdpcENVa2lFbUNG?=
 =?utf-8?B?Unp3Uy8wSENjQVBicGxkbC9pZTY4L0g3aGtrbmtFNEQ0TUR5YXhpMXNPRGxQ?=
 =?utf-8?B?dWJQcjF0L2pRc0NzZzNBdVhmdmw0UzBDNHo1UjJyUm92cTZzZUFSd1RoSUZO?=
 =?utf-8?B?d3U3Tk1FVGdIUWNnWG5HN1RtNEU2VHBJZVhHQXRuVzFsbnR1cDZoeHRCZ3lP?=
 =?utf-8?B?QlNzMG5YMUhGNFlYZHdsWnNybEtEODBMOTAxZGM4MVVjKzlrRkhWWEN6OEdF?=
 =?utf-8?B?OGhDbzBxR2ZOVFl3cWFmcS9kd3FHbnhRMDVDNzMvZkIrVjZqdVpzeVJTb3lO?=
 =?utf-8?B?eHlLRlJwVXFsT3Y2a2tTdnluYzVMajJSNFpDMjgvd1gwQktYRm1hV1Vvb3Zi?=
 =?utf-8?B?eThjL3AxVUFmSFZObmdXYVVQWHphR3FZMEVyYmFQOUl0WHhxZ0t5QUdPYmVZ?=
 =?utf-8?B?M1JoWG5yRkhDK0VMb0RDdlVEbWdJQWt5bVhnOVhYZTR1amhVTEpDbS9jWEZo?=
 =?utf-8?B?b0xWeENJOXdMTy9BL1lGTlFlbjVZTmpsc0lpS3NKRTlFbzhSSUllYWxIOEMy?=
 =?utf-8?B?MWNEWlk3ZkxNTFpGWmxFbEVEc0JZSXZEZmk3cU5KNDI0ZUVuQm1PcTdFcis3?=
 =?utf-8?B?U1RMQlgwZ2p0QS91eGoyY2NrVlhZb3RORkoraEY2eUlQdS9nWE9KYWR2dE9o?=
 =?utf-8?B?NC92a3pBclduT1dZMzZMZU1PRFA0OFYxaFhTN1F5dU5udXZraGpCYUpPQmtO?=
 =?utf-8?B?UHM5ckhuUGMwNmRhZERwd1phbU9PTTE4TWR6MGIrUzRLL2k3d0hURW1lUDBI?=
 =?utf-8?B?ZmoyRVBLbHpROHUxNWRPMEtWa3JnOTRKZG1LNkozd0V0MlBDcHNISDdmVHA5?=
 =?utf-8?B?aCtPMlZTY1BvVFBYVzZoZUJzazZ6dzZhUVcwN1FyMDBIMm1NYXQ1dTVuL0FV?=
 =?utf-8?B?UXZGaXNjQ0ZDUEtRYTNtMk9XaENIYkUrSmFWVWhEeHMwbVlCcnluOEd5ekho?=
 =?utf-8?B?R1Q5akZtR2srdmNMS0gvNmx6ZUd2dXAvUWxvalB1OGp4V0JBU1dGdUx1cjM4?=
 =?utf-8?B?Kzl2WmFBT29QVDFhdUI1Rnh6UzE0WitaYXNmUzB6cHBuK3llOUZydkg0MkRn?=
 =?utf-8?B?UlYyWUNqU2ZPZ3c0cGtvVlAxSFJPa3Vnd1ZxZVU4VEhxZkVQZXpuMThWNGhM?=
 =?utf-8?B?b1BqVXdQdGlkM3FRRVA3Snp0WEh6RzdDdDRWWlhHRjBOQmU2V3VyL05EYURL?=
 =?utf-8?B?QUxkMjVVUFRpZGJidTg2RlMzTHhhaEQ4bHpsMkdxZU05WTF0cndCWkhwVTBa?=
 =?utf-8?B?VHdQdjc5Y2k4MFpzK21Sa0JQNng2TmdQNGRsN3dNaDZRMGxYUWU4VXp4UHFw?=
 =?utf-8?B?cVRaMldMNE9vSEFVaFNjaUt0VGxCT3YvSnBRQnpzdUZia0RQQ1dWOVJBcThn?=
 =?utf-8?B?M25lZ2kyVXNSQ0duRWpMbDIxaXlrOGd6MHQ3aEhYMWZDUngxVjZxNlFIMnNs?=
 =?utf-8?B?Q24yZytEYXQ4cERGUEx2S2FDdGhCVlRuN0FXZHZGaTF6SUl1UmtzR3NlQTZR?=
 =?utf-8?B?czdaNmZyZVFvN2dvb2NGZFc0N2p0T1dyb3ptMkF2TkxVVGlTRkZrK3ZGOEpC?=
 =?utf-8?Q?6zOYPLWCSBYzWjoiijrl+aU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a28a39a-9a0a-42db-77f5-08d9c48d0ce8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:20:33.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChP2bXNTqCkfdb6ul1ct34risKrVogX3/urfoBhM00w1+SsWdRtZEz3V3Aa/30RJ+/4Q+hFUX5PhZj3OKYSGXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 25.11.2021 14:39, Anthony PERARD wrote:
> I guess it's easier to remember that %.E does "$(CC) -E" or "$(CPP)".
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I understand that this patch isn't going to be needed anymore.

Jan


