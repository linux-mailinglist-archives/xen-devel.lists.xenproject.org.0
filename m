Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F74B48A9A9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 09:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255638.438101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7CfP-0004g5-Al; Tue, 11 Jan 2022 08:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255638.438101; Tue, 11 Jan 2022 08:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7CfP-0004dK-7H; Tue, 11 Jan 2022 08:38:07 +0000
Received: by outflank-mailman (input) for mailman id 255638;
 Tue, 11 Jan 2022 08:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7CfN-0004dB-Hh
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 08:38:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9035880-72b9-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 09:38:03 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-0pBGvN1kPamR2VgFmaPhZA-1; Tue, 11 Jan 2022 09:37:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 08:37:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 08:37:58 +0000
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
X-Inumbo-ID: c9035880-72b9-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641890280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3JxQ7xHtibEWYVfhQxoTJKXvjnn3riVfbXUViZoRUMU=;
	b=N0dLJL8lve537H60ql6wtH0K6OzZf/rZE8mt6/o7ucMAk/tGbm5lvsMwdPdOVy4ILmAVjc
	sM+iwVbg2p8ufwHv0nv0FWfZMAADPTXFtg8g6UrrYxamXdh7oqVFhNfpxd142bUzN4Br8q
	8G1iSD9I9SvILTevPJu/x33tRD2OZBE=
X-MC-Unique: 0pBGvN1kPamR2VgFmaPhZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6UB9ZH+MCinRsX5HmM6vjx6f9XllsB/DiKPAShlzQ0Fh8lSuwg1gdGTIJ1/L5iOdZg1vqquCzQCzYjsO6TWfRLKml6xYIkynmj6CuBbd0SRjWeEGgyu2M3xoegnjASkzkhe+sHYYE9YEsrYyBa+DhHb9mNU1/S5nmyFVic/HZjBa9fGvZir1PDkt0WL4Rffs7dGBZzhxMUXRZffQ/ZwDMSU1G+5eAENYPKTcIaFuYFwFezwy5NN/3PvE/bMIjf7L+czY6ecBYQCDNaPFwuPl59RSPm0Ec9Y1YwLojsFSfYwe+wz3yJcOhqlBpvU4ueIVZ/3thJ6R9An+C18P6p8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JxQ7xHtibEWYVfhQxoTJKXvjnn3riVfbXUViZoRUMU=;
 b=IqVylHoReqMYSMjYdQDbA4oSR/c3mVEf7ffEM6yWHxkhYhYzKcfgpR9Von4Agsk6lOiQH/8gl5FyeK9n5DEIkOCCgBKa/RLnmbr7iCbWYQatA1OjOuTH8bwLeMUpF0CvtOzHxxj0BqOkO248PLTKcnW1BQwbziSsFtAnpVgdaiL5f2I5gX9E4lFaW1jA3wZ2lvQWb1xGviZMJHc8nttAYk5d2o4AtkXnD5/i7c6cDiSvLcR9BNG5HQVXFfMEmHdgzzleh6wQaq+mD/TzCT1IcII1vjukaoUCImyvyPPyBXYyo4Il/GBiM7fEqOmdSv/DiTjRcoLhT9C4zR0XcLEQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a072e1f9-3667-e0fd-038f-3492113729c6@suse.com>
Date: Tue, 11 Jan 2022 09:37:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: SeaBIOS 1.15.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0183.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aff11f85-12d4-4874-b18d-08d9d4ddab89
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64807D2B4229F38292A7A024B3519@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JPJfknvtDUqVBjv3lvdi6evohdwNfEE8m5VkC7XsgHfvyn4mTbkVD3nmanYaqnqU7UQTK3A7ha1D+WIxeen4r8k3H+GRP91ygwPAL47fmqNekLlVsj1onAPgD/KotmGVYavphDKs6roEYVpSwn2SW8uhp+M9LXJdwUMlr/UVQBZCeyiJgIKzn44Wit5aFjT3u1GD7XP4/TXeFB9eWT/KmRz/WM6XWYdr9hA6NVuasLkTI5NbXmyuo6FhnkX55V0tsCKgsgAPjGXSOc1HRL46mWMZtvCNtwCpZZy2R3gjoDN1/BLW3qDK9iw6r3p6xx5SOPcOYPKCVQs+YbywdnaEHY+/BGz2fg7Rat1Old1aUpL4DJ5pYq+bzAMDtiO4pzvb+57cNUj4E2UVFxYVY/eqOCiiukr4KKunCHKJOv0Q2ZH96BlKyotcWFCeZFt1tJocIKaOhypyEfbLSdgJ2dczlIfQKiuv/WLcHp9XiY5QePiUp5Py9HGcL5Rcb9XTsm/9/gzRhkSI4YbOc49iMCjb386Xakfhd6UZdzBl3Fhg6C3QXZbbi0jC85pJjTFaZ0m7vjQqPyroJO6Ii5si56d6xSa7EvSdVGVzGutk2Pvh0ZhaM7AvbMFI8b1IFmbH+9CO02rtZvBWsPmi/diQ7LNm3TnMQcwAcNzFcR0mn3sMvYvuxZnQhPV6V7ccgGs5P0hEEUNv/wnTsv6Fv4qmMPJj8r1dDS3A8HK4Nfi/wRDpwGmgOoyD6+fcSnWIW7UxsITG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6506007)(8676002)(36756003)(26005)(2616005)(83380400001)(316002)(508600001)(31696002)(186003)(5660300002)(6486002)(38100700002)(66476007)(6512007)(4326008)(86362001)(2906002)(31686004)(558084003)(6916009)(66946007)(66556008)(7116003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpUZmVRSVUxdGRabGk4dVhjYjNweDZBMHZwdnpRT3ZKOEo4cllXaUNLUS93?=
 =?utf-8?B?Rk9pRVJQNUIvZlV4enk4ZndPOHdIRlQvZXlrZllaQkJnZmJVR1pFSjNkTjV2?=
 =?utf-8?B?MnhHRUppRzMyYXozL2Mwa1Q3bGJCTkFGanBvKzlwTWkydGo3VEFVRWx0SWRU?=
 =?utf-8?B?Nk5OeUwxTStNMzlRYzJtbW5XU1ZoM0hGM09qdlVDNXBGNWZPcEpvbXZyN1Qy?=
 =?utf-8?B?d1NnQUk5RVJsRjZYaHAxS1lDdnNTMGwvbHd2NEdzNzVuaHVJVW16UWVVZWUz?=
 =?utf-8?B?dmpIcCtrUVhOWFdjSlRlOWVDY1R4WG5mZTAvQnRrb01vZnY5YWNNa0k4dU11?=
 =?utf-8?B?YSsyRk1pRTJUbVlYdW5ldG44UDhVdjd5MDg4Z2NYUlRuZ2JhbEtRZGN5VklI?=
 =?utf-8?B?T2pGZ0lYSDBRR3Y2aXlWU3dvMXlUNHRFYndHZ3d1WVUzTG8vblplK20vczNH?=
 =?utf-8?B?aVczTmI2UWx6Yys4TUF3V2RBZXFJLzJhM2ZoN0cxSXdFWUdZNUk3b2pWK0tN?=
 =?utf-8?B?cy9NRWdLWXIvNUZzL2x0djJsdkE0TmRKSlMzWEtUblhJOGZGV0tzcDl3R1Zh?=
 =?utf-8?B?dGliRERjWXlibEFOZ3g2UGViYTdMbHYxYmpyNjBsQkdPa1BncGtHVE9TWlJE?=
 =?utf-8?B?MTRjNEo0aFM1SUMzTDdPeXBTUXJPam9lZDJyZmlYaGh1N1RweEcxYUtpdkM3?=
 =?utf-8?B?d255Y05xU1NHMmFWRVpwZ3ZSblhJQS9OVGF4YVJob2hBNjRreGhrN0pzcXZ3?=
 =?utf-8?B?anZyUDBIdVRickNKTFRjakVteDEwRlhzYWJDbTY1VVIvSi9NY09VOHlTNnJr?=
 =?utf-8?B?eERnZmdneHJnYzkrZ0hwNWV6WUF4bFpKaFVsb0d0MldSUDlXUHNxQThYVkFI?=
 =?utf-8?B?c2hUOE9Xd2Z4YWZSbENJQ3g0d2t6ZXRSL1M4WnV0RXVNWjNrd1BHVDI5VGtH?=
 =?utf-8?B?S3JhRm5nWjB4RHJnQVFvV2hyM1F6ZVR5d0hrQjFzcmhuWEloTTZBOFJoWlJi?=
 =?utf-8?B?RkVNYlMwVmdSN2lIdTlsNHV6dnRPSHJLa05XaTZUNHdGS2JsS0lxS0ZMUFNn?=
 =?utf-8?B?bjhxWTlqMTVmSkRGT2dRTlUxU0VjWWpleTMrZi82T2o4S0cxT2paNUR0TllH?=
 =?utf-8?B?bGZpcVVJVzhyeTVPUXFYbk50dzk3UTZXYzVuNXNpMmZHdStxaFhET1NBaXhy?=
 =?utf-8?B?N1A5Y2ZvSlpLQjJRQ3lOejdROE5TcThRd1VmRmowYUtKRkllVmtZT3UzSmFW?=
 =?utf-8?B?NlZ3aXpOTlU5dnhySUpydmhKU0o1L29OYUdGTUhteXpuR0tRRDl5dThicCtO?=
 =?utf-8?B?Z2J3SE1DZ29XNEhuWGpqV09Xc1ZPK0Ewck9QQSs0b3BWbGx3YmlSVHBlUnFh?=
 =?utf-8?B?Q2o2RVUwQ05JTUhHUExpS2Z0TWR0QWZMNTVUZnRmcXRralQ0eDM3SXFmNC9h?=
 =?utf-8?B?dUgwNjZjVS9SSllkYjBnTCtkQnpMbk04V2JRQ1dUS2VLRzE3N3pmMHZPdGdR?=
 =?utf-8?B?MmZoRDBBM0UwbnVnYWF0U3ZFaklHVlNleEZWYXVjNWlmSWIwWGdZSWQ1RlNJ?=
 =?utf-8?B?SEFVajVDVzBDL2hWd2owd3hYUTZBaTJMNHFFVlRZRGNWN093Q3hSWGMwbXJM?=
 =?utf-8?B?WXhsREh1cXFOc0JpeDUvdkh6eHVHcnJ4bHRDRS9tN2lLaDhyRDVieEF6SDRS?=
 =?utf-8?B?TDVlbmlzQ3RkY1hHWTZqY0NMdmRTNnAvbEtyNWhGeEVLckxvVWw1dTlsMEEr?=
 =?utf-8?B?SldneUk3RjJHcmhQVTgwakRBcDl0WW52S2hwT0VrS0Fva2paTzk5OSt2Unlt?=
 =?utf-8?B?dXNTT25uUWJoYzJ3RVNEL0RrMDhMazdBSTJodmlwcmpEODdGYktBbXFwcVFW?=
 =?utf-8?B?eFVxTDFDRW5jSTZ4ZVZUM1NsL1dTNldsVTRJd1l2SG0yYktGYnA1QWo0TGls?=
 =?utf-8?B?cWNtVnV0Z2xka0QvQlFiVXBOa00zVnFGcHMvVjhsSmdmamQ5ek41Q3NmOGRQ?=
 =?utf-8?B?c01nbUJoMWxaNE1NT3dUelJKTTcvSDcvUUlPcm1IQXVtTkZNMEZFTXlwQlZz?=
 =?utf-8?B?ZHo4bHkxMlJjQmo2M1pNN29uRlBMMWt4T2EwV0RXci9HNmZmcmdLZFNaVVg3?=
 =?utf-8?B?TjYxWUwva1RWYXFsSXpRYjFWNkkxRkNUd3JsYW9HYXdqMWVsc3FjSi9lTmtU?=
 =?utf-8?Q?vpPfodfXx/w7Cb0R8+g5vOg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff11f85-12d4-4874-b18d-08d9d4ddab89
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 08:37:58.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E04tfPr6sDHHVMsAniS2Tb0t8Rp7dBgpvpCOgm+9164fJO11Id0EUIC8xfaR9W+0GXAtnVSv0ld7dQ/9ybUJ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

Wei,

iirc it was you who has been looking after our SeaBIOS use. Seeing that
1.15.0 was tagged, should we update the version we use by default? (I
would have asked on irc, but I didn't see you there.)

Jan


