Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7276A4524
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502672.774565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWepC-0006CN-0O; Mon, 27 Feb 2023 14:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502672.774565; Mon, 27 Feb 2023 14:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWepB-00069K-SR; Mon, 27 Feb 2023 14:49:57 +0000
Received: by outflank-mailman (input) for mailman id 502672;
 Mon, 27 Feb 2023 14:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWepB-00069E-5F
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:49:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc6b907a-b6ad-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 15:49:53 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 09:49:31 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6052.namprd03.prod.outlook.com (2603:10b6:610:bf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:49:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:49:14 +0000
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
X-Inumbo-ID: fc6b907a-b6ad-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677509393;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iY4MRneShEdl09YptamtBOd+4nAdAUzUI3hqOx8TSnI=;
  b=drxHuMXPANluVEXH4UrcOTKc4A7+K50G7b6P5ze+F2/ZZ4rwSKgduG2D
   7LKeFiQb6SR83r0Xtpn0/CHNq9bWyQZ+bhjbg0RUtfXZ5icQrVi00RgIg
   IV/K5opOO53ep31bm8go8I6Na2ZCvjLYz1OUycitiDxWTybdzlUmbASMt
   Q=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 98697399
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9BTA8aI9x4F26OLAFE+R6pQlxSXFcZb7ZxGr2PjKsXjdYENSgTEGy
 GsZDGGCOvqCM2b3KYh2O4Sz80gH6sWGytJrTwVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5AZhPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5RDD1S5
 P01AQoLdzKq3KWEzKC6Ws1F05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHOlCd1JRezQGvhCgVKS+lY6LwYsaVqi+aCXmEK+R8tYJ
 BlBksYphe1onKCxdfH/UAe/u2WspQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHvbGKSHTb6rCOqjCaMiwSMGNEbigBJSMa5/HzrYd1iQjAJuuPC4awh9zxXD31n
 TaDqXFmg61J1JZbkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXVMzlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:/Q2e06lgUTnC7d2hrQ1l2HYVL7vpDfIp3DAbv31ZSRFFG/Fw5P
 re+cjztCWE7Ar5PUtKpTnuAtjnfZqiz+8X3WB8B9uftWrd1ldATrsSj7cKqgeIc0fDH4Vmup
 uIHZISNDQlNzlHZc2T2njeLz5XrePmzJyV
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="98697399"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKlC4Kz2GNlwcrVE0EzJk07NMm5b3vHM1Y1qzDy35f98vCKrh7pCY4A47cf7yWQajpZGs8s3QLsBXI2V2ueJeviS6i/xugbaTvAGXA8K3yJo4AMyCd0fBl3NlLjTds9QCP3ahEEunokQ5Wv6SiPxXedCpmYthRJKKA+As9ujIntRW/dpL5hI2FnY9NfoD3H5oyil1II9+VgIDySrEwBJD4y76ocytGUkta7om5Vbi7Ir60N+e1975zTgbYulKfG8a6JyY/VpLbZHn1XdbiQ5FnijV+8C6VxCbw6d6CylXpqOp9+XHafDb/xCbuJnKuo3gAF+B2Xr9Sl0PO45IdEWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY4MRneShEdl09YptamtBOd+4nAdAUzUI3hqOx8TSnI=;
 b=N50nCkxifC2PiontIPc/q0qBzNSHTPNaNHnNve47LowRlM0tJUhW7I5GQah4EICSxSNVoRKmRqJVvWQikpNvqn3875sSvqXzSf8+dKGljiakKR9HKLXiwBBfPuCd5kR55QJnbB4AofGd70Uo2GWs65EF2mT6Vfs+kO8WdEqcFFsFRZIuod7d9khFoRL3hnAiucS4+a0ya+W8sMG8YgoZW1hXFNh52CKoEOg280wNqcFYOaVhm35Zt0AkyqRAf8jpAmWruImaxSUyGjSU61klcl+BE+nwnFn/3srxkBQMO1rTKs+L7Mcd55JSY13tFpTCFsc9vHwiQEMWTEdjUf1SEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY4MRneShEdl09YptamtBOd+4nAdAUzUI3hqOx8TSnI=;
 b=MgKXVVFkLVV3Mc+CCurba6UJanH41TqmN41B9N0PupIArZm/0k4xYXLDzAoB7TvHhBeAZZSNbUpzacmBY5kd7ypiacIlsLboGscvkPgnF3yo3hQq0LL+wT405k45rpNdvRuKYhy9C1OiSmzsvzoNXDTQC3FiZ8hzRtC/7d2Nd40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <01313963-0cdf-e681-b0d7-9d0e756ea6a2@citrix.com>
Date: Mon, 27 Feb 2023 14:49:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/2] xc_core_arch_map_p2m_tree_rw: fix memory leak
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edvin.torok@citrix.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1677245356.git.edwin.torok@cloud.com>
 <c721e627bc74047c0c5e55c0aeae7d72bbc3ce0e.1677245356.git.edwin.torok@cloud.com>
 <12b656b2-76d5-2ce6-9548-5ee8e57451ae@citrix.com>
 <deecfab5-0622-f004-d592-1c186fc241ae@suse.com>
In-Reply-To: <deecfab5-0622-f004-d592-1c186fc241ae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0488.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 648169a4-31c3-4c88-91d2-08db18d1cb79
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PsrjJZBSRRPHzWdtAleWQN9fnj+byDku+VVXprYmKkcGOHpFY6zUvpze9u/ptJk06bWgcEAXjSfQF57U/221dCgQEJns76mQ6lv65SgdX4uEPalftMZJ8PAUDYOZHNIyQZwR1yV0HoulVY30FGqqYWC9bRtPRinky2kBpxe9p+/BBjJypTzwPf6Grpf3yvddLC/RDpncf2UqZfWmBt9ADKStZCZOvLpIDxQL/CYa1Qxt+OQ5O4cmWRSRUpjQCCktYfzmTJIino5P8HvbyC93fupKVHIYSEQ3SkToGj/qPwp2IsaVbb80nliHVxy9mlgz7zpUM1bPS0lwSQMgWmyhEzf8FNzUSdDSfh86rsqF5n2MFlP2503ymbt//5v+RHVYenlOVRGHBU+9N9aQuc7qDDexViYFg4B6rTO+0VbCbIuQaZiEwqGp449/9wqunRhgNLBPgoafzsI5S0M/09MU368cWLiN0zXZHPvLditAqetLDXutGRIEfvL8fJPlLTK8+WrMWC8aypV3Wxc6steo4E3EvfgaHSvLYnLeuyMjFZnTWhH8TpBAggPOEu52fH/nB71jCwiz2H6RCJFiqHb2KBSKgA3Hhc1QonLnph7CJcoTvKeULJk0z1WHLlA5W8WoFZuYlJ1QleIlG5mb1OHwp+5iaPgQh7do86y9oDRhP1m2kzgS8FIIByyobNjNhWymIaeNqa+lyoOlIF18XRFjUoAMPaG4tUCHV8ZzJyTqwmLpBqmnkM6pULBR+Y640+IBtpj+e3IPwhKD6RaKuO1pTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(36756003)(110136005)(316002)(54906003)(6486002)(5660300002)(2906002)(8936002)(478600001)(66556008)(66946007)(66476007)(8676002)(4326008)(41300700001)(82960400001)(31696002)(86362001)(38100700002)(6512007)(26005)(107886003)(53546011)(6506007)(6666004)(186003)(2616005)(66574015)(31686004)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1Zjelp6eTdzbjdnQlB2SGQ0TSthVmpRR09Tam05M1B2OU50WWZUeloxeUVW?=
 =?utf-8?B?c24ycm01Q3VRYzJqZnlneFdpNzFzMkl3QVpTZkxHYUhXREdwQWROV2pJdk52?=
 =?utf-8?B?UkFOVUgrenh4aWJwZXJIRXpuUzBPOXUyYkVEUk5CZFBqNHhiejJZZTJlMk9K?=
 =?utf-8?B?eHJwQ09zUFdWelZYbU51MHZ6Zk5FRHVDbUtMTEZRZnV2K0RyODBvL3lTNDJl?=
 =?utf-8?B?N2FveEU3YS9pQWZRT0wwS1k0SXc0NVJNcEZBY2tsZ3lTRXh0MDJtNjVlK3Fh?=
 =?utf-8?B?eWRKWTdkeVBYdUswR1d4MHExWlVybVViUE9nZmtmKzJVSzY0RE1KUjhXYnFD?=
 =?utf-8?B?QUpLenFvZkJidTRzTFl5SjloQXFFd0lNakxYS2FaU2pJalpDTWsxSG5NZ3ll?=
 =?utf-8?B?d21OYjNGWjdHRHFvYzhyTXAyNEpyakovcnNrRk1mMEg3NHBjSlZkUEtWdWph?=
 =?utf-8?B?SlJ1NGVJZFJsMUloak11UTh4cE80OUZtMTIrSkdCL2JpU0E3V1NhUEdKbCtu?=
 =?utf-8?B?ZWJQR3h6VkxlZUlFQzduaHZCMWxDc3daeUhLQlF2Z2xZVGJDN2hySkNDaEFo?=
 =?utf-8?B?Q0tmcjcrUUM0YmJoNFVsRDQyV2FwM0JyMlJIYnlKMHBMd0hiaTVpSjhZdkNl?=
 =?utf-8?B?R2o2RW84OXhnR2thK3pLQjBRbFVtOHRvV1ZpMjgwMTJDeEw1T2JvcFJIbDFC?=
 =?utf-8?B?dDdZSFZ5bUd4bkpkV0Y4YmNVMG93UElrQlNyZEJGQXcveW5IYVdxTVZybk5Y?=
 =?utf-8?B?b1huTUFyT24zSGpFbG56UjBaM0ZsalJNVmVzSjdCYTBtNUMxQXNDUHdBTjE5?=
 =?utf-8?B?b1ZxeHlKL1Z3MHo1WjJ2TUc3ejRwQVdnaTNKUTZzK2dNbjV2QmVYRFFBNzR1?=
 =?utf-8?B?TlFQb1A2YTZ0eU9IbitJQWVhcTY3VlAwSXlBOTlpRXcvekpyYnBFV1dyUVQy?=
 =?utf-8?B?RTdhWmluUEdjdDZBSnBGZk41ZUgrSFd5LytoVXlTWk9RU3NacFJaWXVRQ3VF?=
 =?utf-8?B?MXhqWVB2K1FSRDRZbS80NDZKV1BzZUo3NDJMMHU0OThwMEhYYW5UYllWZVVZ?=
 =?utf-8?B?K3FZQWxZQitmV0hIUjhhV2xCSjVoVlNGdGZjMm5SSkZtZHdXWGVOOGZVVjJC?=
 =?utf-8?B?T3p0em1IWVdqelZyczdFYWlwZ3diNjJ1S3luaVBKMjhwRzVzK2xGMy9hdGdC?=
 =?utf-8?B?bTRiMGN6UjU5SDdwTGRtWHYxRytlTDRMVSt3MVN4VE11bUtNMy9iVDhnQ0Ex?=
 =?utf-8?B?czVyWmZCUkp3dU5UOGlBUzBtY2dGdThnNHAxQWVTTmxNczJCTld1VTdIUTdi?=
 =?utf-8?B?bjJrb0Y0di9zZE5hWFZtaDdFSi9HMnRaRnMvZHkwcVRJME5GNElJdFVXOEJL?=
 =?utf-8?B?MVJmNVJRcWQwdjV4UXVHVUhYV3MzUUxaSlgzeDJKSjJFYnR0ZzBudnJUejlK?=
 =?utf-8?B?ZE9LbmphVzlyUmh3bmZRa1l2amlKaTNzZzVhVmtQZVFTTGhJKzlTTmRwbjgz?=
 =?utf-8?B?VjZSWWtCbDU4RGhZYTEwcHliK0J6ZjkrdGkva3NDUnZwbllPNjZvWW1GZUMv?=
 =?utf-8?B?aXVnZ0xoT2VPWEJVczNQcm4vSVJ6aGRUWGgvdWVWZ2NSTzVIc2JUb09VL2lW?=
 =?utf-8?B?cU5RMThxYmd3UFJ1VzVwa2FVTVp5MTlyZENVQmw1c2JjRVRVL2p4d3B2Q2Q5?=
 =?utf-8?B?eS9rbTg5ZGFjdzhZR1hvRmFKK3IzZTJrbThJY09qbWQ3dy9XUGtCekpaV0ZZ?=
 =?utf-8?B?NnVNRUJWWGd3TTJvd09sS2F5K1FJZzlsWjVNblcwbng3SUVjMXpUYm01Tlda?=
 =?utf-8?B?QjFiRDZSRUc0SmdsV3JtSC9zUVBMMEQzYmJiNWtlNUsvQnU1d2Z3ZzMrVlYw?=
 =?utf-8?B?dk5jODErcndvT3VubnRiUnZ2STlJQ2dRSlhnUWJBL2ZNZGo1OU9NOVpGS3Qz?=
 =?utf-8?B?djhwY0FNMEM2S3RyRFZ6eXpLUEhrNlo3ekdOTVdodnp0RFRPMWc1eGx3TUhP?=
 =?utf-8?B?S2E4d3BXRFRrRDNvWVpRNFNMbmV5VUJGamtVN0tKR0RLMC9tMzlpSGtZUXRQ?=
 =?utf-8?B?aGQraDF6MCtyQ0QzR3BuU3kwaUtrUFlxV3d5UzBYM3U3V1lGNU44KzVjV09B?=
 =?utf-8?B?Q1h5Wk9zZTVBZjYyTmdFdjh5b1RPcmJ3dlVlY01PN0dkRGdFMDN2ZUdpbFhu?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j25bI4ygAPN5sLv0ml61VJXZDQ4rQbJUJBSjvvyvMcourPUnE9FMhqm31yc0ykS2eB9QDpRua/GWBCGc1vqW82L0gab9e7+vId8ATnLclC67sSDWe8xfVV70jhuwsDtDSxtvdsnhy9ip2wcmOllTp5W9Q4/ExYrwLIVLjcvkJJTUkCtP2bcTbwtKN8UP530U0PkMkjjw9+qCDqmI0VeuzMjvRjHxj4Lc81Wg6yESaGTMccmW2io2P0U/03pWBRgOK5qO3laAIRVLDFCXtMxPtdBBCM0y1FFx5tnNR0lKJx7iq6xGjcHUMiYuuPhz5GnDPzxv8fB/hrszFK1wF7wUymHAFN1UYwMkhI/q80MAqIk9aIQNn7gDaQrCyu6ATugtAJqBLd4RDXdp9H8dmfISDhvmtswtqjQkCy4XIhFONTIg6OXO5OcZF74a1xXcp6FpN88Nf2sFW1z9+ahxu3ITLUtp1mAQD3nfIQ3TfH/GMvpOrwf3+Dx3P4UijFo8dQsmWd4g53a4hUP8oObq+bpKyzqtCh+pY39LGsHAWNAHxU7Fms2wWzlky8vRFKhU3HYVNgnmZJ+HHcUoz+kLi6yinMffAM+ld4uDNcoK+DorueYt9af2Y9UTB2VH0Sy5jny7v7mmUWQatEnXjBZkiQK54RoDEAPL9s3RDrF1zN0S4BJrZ9xna4LyYPCGO1sIiDBFBu3KUVG0/UORa2DmlvqCU82H/uT20oUZ5TbP8MeNx0n0rAxCUK43dAryUOsGfClckOFZCLC+QWzqdDk6TGH6ad5VVnyt1fhAHZZ9U3115AHswrbApta2wATGsAGbTG5SNSD3x5OU83i3MOXpAwVnc0OLhObJpPfnE8x9NQWrhnM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648169a4-31c3-4c88-91d2-08db18d1cb79
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:49:14.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXJsVP6US8IdsHFVoLJqPjHw+smX/+iqFkt37YFyrZoIGH0zBqX+a7L67GWzGBqyF3g2TuVDi4TPUKSYGRG/Ac8Ioy7hHMBlxKY8DAHx3qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6052

On 27/02/2023 2:42 pm, Juergen Gross wrote:
> On 24.02.23 15:56, Andrew Cooper wrote:
>> On 24/02/2023 1:36 pm, Edwin Török wrote:
>>> From: Edwin Török <edwin.torok@cloud.com>
>>>
>>> Prior to bd7a29c3d0 'out' would've always been executed and memory
>>> freed, but that commit changed it such that it returns early and leaks.
>>>
>>> Found using gcc 12.2.1 `-fanalyzer`:
>>> ```
>>> xg_core_x86.c: In function ‘xc_core_arch_map_p2m_tree_rw’:
>>> xg_core_x86.c:300:5: error: leak of ‘p2m_frame_list_list’ [CWE-401]
>>> [-Werror=analyzer-malloc-leak]
>>>    300 |     return p2m_frame_list;
>>>        |     ^~~~~~
>>>    ‘xc_core_arch_map_p2m_writable’: events 1-2
>>>      |
>>>      |  378 | xc_core_arch_map_p2m_writable(xc_interface *xch,
>>> struct domain_info_context *dinfo, xc_dominfo_t *info,
>>>      |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      |      | |
>>>      |      | (1) entry to ‘xc_core_arch_map_p2m_writable’
>>>      |......
>>>      |  381 |     return xc_core_arch_map_p2m_rw(xch, dinfo, info,
>>> live_shinfo, live_p2m, 1);
>>>      |      |           
>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      |      |            |
>>>      |      |            (2) calling ‘xc_core_arch_map_p2m_rw’ from
>>> ‘xc_core_arch_map_p2m_writable’
>>>      |
>>>      +--> ‘xc_core_arch_map_p2m_rw’: events 3-10
>>>             |
>>>             |  319 | xc_core_arch_map_p2m_rw(xc_interface *xch,
>>> struct domain_info_context *dinfo, xc_dominfo_t *info,
>>>             |      | ^~~~~~~~~~~~~~~~~~~~~~~
>>>             |      | |
>>>             |      | (3) entry to ‘xc_core_arch_map_p2m_rw’
>>>             |......
>>>             |  328 |     if ( xc_domain_nr_gpfns(xch, info->domid,
>>> &dinfo->p2m_size) < 0 )
>>>             |      |        ~
>>>             |      |        |
>>>             |      |        (4) following ‘false’ branch...
>>>             |......
>>>             |  334 |     if ( dinfo->p2m_size < info->nr_pages  )
>>>             |      |     ~~ ~
>>>             |      |     |  |
>>>             |      |     |  (6) following ‘false’ branch...
>>>             |      |     (5) ...to here
>>>             |......
>>>             |  340 |     p2m_cr3 = GET_FIELD(live_shinfo,
>>> arch.p2m_cr3, dinfo->guest_width);
>>>             |      |     ~~~~~~~
>>>             |      |     |
>>>             |      |     (7) ...to here
>>>             |  341 |
>>>             |  342 |     p2m_frame_list = p2m_cr3 ?
>>> xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
>>>             |      |                     
>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>             |  343 |                              :
>>> xc_core_arch_map_p2m_tree_rw(xch, dinfo, dom, live_shinfo);
>>>             |      |                             
>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>             |      |                              | |
>>>             |      |                              | (9) ...to here
>>>             |      |                              | (10) calling
>>> ‘xc_core_arch_map_p2m_tree_rw’ from ‘xc_core_arch_map_p2m_rw’
>>>             |      |                              (8) following
>>> ‘false’ branch...
>>>             |
>>>             +--> ‘xc_core_arch_map_p2m_tree_rw’: events 11-24
>>>                    |
>>>                    |  228 |
>>> xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct
>>> domain_info_context *dinfo,
>>>                    |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>                    |      | |
>>>                    |      | (11) entry to
>>> ‘xc_core_arch_map_p2m_tree_rw’
>>>                    |......
>>>                    |  245 |     if ( !live_p2m_frame_list_list )
>>>                    |      |        ~
>>>                    |      |        |
>>>                    |      |        (12) following ‘false’ branch
>>> (when ‘live_p2m_frame_list_list’ is non-NULL)...
>>>                    |......
>>>                    |  252 |     if ( !(p2m_frame_list_list =
>>> malloc(PAGE_SIZE)) )
>>>                    |      |     ~~ ~                        
>>> ~~~~~~~~~~~~~~~~~
>>>                    |      |     |  |                         |
>>>                    |      |     |  |                         (14)
>>> allocated here
>>>                    |      |     |  (15) assuming
>>> ‘p2m_frame_list_list’ is non-NULL
>>>                    |      |     |  (16) following ‘false’ branch
>>> (when ‘p2m_frame_list_list’ is non-NULL)...
>>>                    |      |     (13) ...to here
>>>                    |......
>>>                    |  257 |     memcpy(p2m_frame_list_list,
>>> live_p2m_frame_list_list, PAGE_SIZE);
>>>                    |      |     ~~~~~~
>>>                    |      |     |
>>>                    |      |     (17) ...to here
>>>                    |......
>>>                    |  266 |     else if ( dinfo->guest_width <
>>> sizeof(unsigned long) )
>>>                    |      |             ~
>>>                    |      |             |
>>>                    |      |             (18) following ‘false’
>>> branch...
>>>                    |......
>>>                    |  270 |     live_p2m_frame_list =
>>>                    |      |     ~~~~~~~~~~~~~~~~~~~
>>>                    |      |     |
>>>                    |      |     (19) ...to here
>>>                    |......
>>>                    |  275 |     if ( !live_p2m_frame_list )
>>>                    |      |        ~
>>>                    |      |        |
>>>                    |      |        (20) following ‘false’ branch
>>> (when ‘live_p2m_frame_list’ is non-NULL)...
>>>                    |......
>>>                    |  282 |     if ( !(p2m_frame_list =
>>> malloc(P2M_TOOLS_FL_SIZE)) )
>>>                    |      |     ~~ ~
>>>                    |      |     |  |
>>>                    |      |     |  (22) following ‘false’ branch
>>> (when ‘p2m_frame_list’ is non-NULL)...
>>>                    |      |     (21) ...to here
>>>                    |......
>>>                    |  287 |     memset(p2m_frame_list, 0,
>>> P2M_TOOLS_FL_SIZE);
>>>                    |      |     ~~~~~~
>>>                    |      |     |
>>>                    |      |     (23) ...to here
>>>                    |......
>>>                    |  300 |     return p2m_frame_list;
>>>                    |      |     ~~~~~~
>>>                    |      |     |
>>>                    |      |     (24) ‘p2m_frame_list_list’ leaks
>>> here; was allocated at (14)
>>>                    |
>>> ```
>>> Fixes: bd7a29c3d0 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to
>>> support linear p2m table")
>>>
>>> Signed-off-by: Edwin Török <edwin.torok@cloud.com>
>>> ---
>>>   tools/libs/guest/xg_core_x86.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/tools/libs/guest/xg_core_x86.c
>>> b/tools/libs/guest/xg_core_x86.c
>>> index 61106b98b8..69929879d7 100644
>>> --- a/tools/libs/guest/xg_core_x86.c
>>> +++ b/tools/libs/guest/xg_core_x86.c
>>> @@ -297,6 +297,8 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
>>> struct domain_info_context *dinf
>>>         dinfo->p2m_frames = P2M_FL_ENTRIES;
>>>   +    free(p2m_frame_list_list);
>>> +
>>>       return p2m_frame_list;
>>>      out:
>>
>> I agree there are problems here, but I think they're larger still.  The
>> live_p2m_frame_list_list and live_p2m_frame_list foreign mappings are
>> leaked too on the success path.
>>
>> I think this is the necessary fix:
>
> Yes, I agree.
>
>>
>> ~Andrew
>>
>> ----8<----
>>
>> diff --git a/tools/libs/guest/xg_core_x86.c
>> b/tools/libs/guest/xg_core_x86.c
>> index 61106b98b877..c5e4542ccccc 100644
>> --- a/tools/libs/guest/xg_core_x86.c
>> +++ b/tools/libs/guest/xg_core_x86.c
>> @@ -229,11 +229,11 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
>> struct domain_info_context *dinf
>>                                uint32_t dom, shared_info_any_t
>> *live_shinfo)
>>   {
>>       /* Double and single indirect references to the live P2M table */
>> -    xen_pfn_t *live_p2m_frame_list_list;
>> +    xen_pfn_t *live_p2m_frame_list_list = NULL;
>>       xen_pfn_t *live_p2m_frame_list = NULL;
>>       /* Copies of the above. */
>>       xen_pfn_t *p2m_frame_list_list = NULL;
>> -    xen_pfn_t *p2m_frame_list;
>> +    xen_pfn_t *p2m_frame_list = NULL;
>>         int err;
>>       int i;
>> @@ -297,8 +297,6 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
>> struct domain_info_context *dinf
>>         dinfo->p2m_frames = P2M_FL_ENTRIES;
>>   -    return p2m_frame_list;
>> -
>>    out:
>>       err = errno;
>>   @@ -312,7 +310,7 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
>> struct domain_info_context *dinf
>>         errno = err;
>>   -    return NULL;
>> +    return p2m_frame_list;
>>   }
>>     static int
>>
>
> In case this fix is taken, my
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
> can be added.

Thanks.  I'll write a full patch and post it, with appropriate tags, and
also include it in my commit sweep.

~Andrew

