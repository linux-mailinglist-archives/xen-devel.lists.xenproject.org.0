Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456A70820D
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 15:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536340.834570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzdLi-0001aB-Vn; Thu, 18 May 2023 13:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536340.834570; Thu, 18 May 2023 13:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzdLi-0001X0-Sv; Thu, 18 May 2023 13:07:18 +0000
Received: by outflank-mailman (input) for mailman id 536340;
 Thu, 18 May 2023 13:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joHs=BH=citrix.com=prvs=495b323d3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzdLh-0001Wu-TH
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 13:07:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e706277d-f57c-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 15:07:14 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 09:06:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5833.namprd03.prod.outlook.com (2603:10b6:806:114::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 13:06:39 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 13:06:39 +0000
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
X-Inumbo-ID: e706277d-f57c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684415233;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WaSOcuBOrfhvLDmVkBGugkCJmxI8KNT9lWP8iM4R7mM=;
  b=Dy06Ml8YLS5SYL375G9Ha8vfh7QhWLPVA1lqUdjjYna9MZZ9YYNfljp+
   RTLCdN3BjvElUWlRuo2SeowldCzEIeOjoUt+Lr92C8ENBiowy15Yc7Qdp
   2R/Xb9cpFJ7zSOUe9SaW/RzLVWomcvRfCJ88oiifBvV0dK1nZtQJCK8xc
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 109527701
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J7h2Oq45fCvQksuLSoHOHgxRtBvGchMFZxGqfqrLsTDasY5as4F+v
 modXGqHbPrYZDb8KI9waoWxpkoFvsPcndNgGgtorS1nHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 aE7FyANdxq6ufOx+5CFcut0lvgoBZy+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXKmAt1NTOTQGvhCiUOR/0YsDAIvRRiEnumguF6VZ85iA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWNQG+Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+zpog210vLVow6Tv/zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQeLhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:PygEg61FoMqQhzPJ/U+faQqjBJQkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcKm7Sc29qBHnlaKdkLNxAV7KZmCP0gaVxepZnOjfKlPbalbD398Y+a
 B8c7VvTP3cZGIK9/oT7WODYrQdKNXsytHPuQ/VpU0dKj2DZMtbnmJE49+gYzRLrd99dOIEKK
 Y=
X-Talos-CUID: 9a23:1X5j8W8kNsd5koBM002Vv35JOf81cmTX9UnBJHSaN15rUK2pQnbFrQ==
X-Talos-MUID: 9a23:JCM7YQTl2Cuu4yiPRXTlmjNbHvhs/J2+S38ygYw0q+K4KRFZbmI=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="109527701"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaQ8EZXgu0wI0JpHP8BkENkAPEBw6Sk71ri6HsZmkSCx1aRIXeRVNU5LLKhjzK1Y2VMQY4+WV/TMqRNbHN0N0RWXXukDPse3PtSj4dlQQZn+JgruuumDQ85ol8KAkdIv6yiqLBMsag2fCXFtAye9hxFNoCr3RG/FjOHkZk6q0Sk4lTOBL5RUJlfRnJ9ZhAeFBi+678d3BC0wMPesqayUzdwjGPL2IjvGhYa0RMvwRRP4oL5BuQXFpX1n/1OMGyklfO0Tz2gRpPpo2woF6IR7ZqFh1zCmDeVc5KIF5trvXyiZ3nuBXK3wOtjviitGpgtePoXNH1+xMTTZcaEN4UYuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgdW8kW3aDopHJzmnsXTv9irrnJKp01lgss7qj6uemY=;
 b=Fi8+i1H9PJQ8RdmtWwcWhVieXjoFi3qn8xQiyayilTYcCxRj94mGEAWTwwPv7v/yUws6U2fyBbO0NvW933JiIXqrcpG0U1KdcnKw5Zstc+qfbfb4Kz4qmh28I/dDPivm8dgleqJHpLpIi4ixapDzazXV+XBIKhQj4LHetv2xQ0geQ8eLhjfEh5gOrTMNwO95+hD9klirVHjI6RBs1z4vxNCBwpPmQAEe/GI8C2YEsT/jjqqiIFbvQvBt5lezx22EprUNoCI/SB0h/Q7VGmfUgRQHIUqfD9YkzuLa+NCdMYYHuN3MRanS/YEGQZf/y+p1XbkCL5z6qp0eF1U41WkCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgdW8kW3aDopHJzmnsXTv9irrnJKp01lgss7qj6uemY=;
 b=hMXX+tx4jC6ijkcV2Dbo7HlbLw8n8z4FvbM54Q9Xfij60j67K6HQQEtUxlJ2iQCiOo/pk7y6DhE9FIwfe1iuzUH8Vk4w0v0YI7wOvhgoucK/e0FC0xmiN+kmdALWaw2neFNOUwYWUwJhOyGykMuDeY0A5BRtcjIzGGKgMf/L+G4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 18 May 2023 15:06:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] pci: fix pci_get_pdev() to always account for the segment
Message-ID: <ZGYi2dexQbJUnt8v@Air-de-Roger>
References: <20230518105738.16695-1-roger.pau@citrix.com>
 <480194dd-4757-d9dc-a2f2-7dea9182aeb6@citrix.com>
 <2274c165-5e6a-2e13-278a-da3c9a6dab4c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2274c165-5e6a-2e13-278a-da3c9a6dab4c@citrix.com>
X-ClientProxiedBy: LO2P265CA0505.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a7dde4-3ef8-46b9-408d-08db57a0b782
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rR48AGZHpTJ+CZ1VAf7hV/By4Di9+JJe5d/0vpKYL+8adI4KnojwXBq0xdYG+Jfth5F1mmI5BvQBwPcKGA+ZqQxPRb00xXnu4TOQox2qDCpB34w96VQWQ7rqCWJkxwtVyx3jvr6cOhBRuxukQNaioGFO1PNdQ0Y+238UpGHScIsHzzdxmMG2r7yV50UzIZNlI/RQTdLOyzucKT9nV+t5pQIXyH+vMxV558wi6Y4wD7xha+Pex6fmb8oAmmexn24FXOEUnb7IHxYclrwc1rfF3u1G3sjUM2OY34UkD5iSSReISmzFPHo1cBm/q8DevnXd1bQJkZe2Bb+e05jZkU/Hn7KmbOcvDazD5+tmVlGLfyVAaffbCEuvYTzagtMEPb5CBsgqVxJSvSsXmkZD2zzR8HLEFE1kqffy31dGHhGgTzHmdAoxXj+QGQU+AX+7pUGHthWknQNErsSORYJ7MkXs25dW8NC9DKNZrZhfLHuiZy933jvkO5Vg3KPetncQKpDdU2ToMCnzoTuOKhWJa65XWQ0G3DRzjpgLHfZj6Psgfxgg8v2DJgTxOXeUj8FtkByo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199021)(26005)(6512007)(9686003)(6506007)(53546011)(85182001)(83380400001)(86362001)(38100700002)(82960400001)(186003)(33716001)(6486002)(54906003)(478600001)(15650500001)(316002)(2906002)(8676002)(8936002)(6636002)(4326008)(6862004)(41300700001)(5660300002)(66476007)(66556008)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWFEREgvcVZ6YXNFSit1MzRoWWp0NVBDVjFsa3hoajh0RlhpcjU0NmREOTha?=
 =?utf-8?B?YUdtcHhHbytDR0hPQWpnUFc3bmlidWJzMlpPdE85Wk4wMlZxZU1yZEUrRWZn?=
 =?utf-8?B?NFllSjBhS05GalAxYmZRVHU3QmpJRmJYOWRTR25wL3hRNkhZOFFOSXV6Z1I3?=
 =?utf-8?B?QW9Mcml6Zk9qNTFMcDlkdS9lUXduQkFwRnBQSGgvYnFMRmFwc250OHUwUmxJ?=
 =?utf-8?B?WDZYd0plSDBtQ3orUDkySnhkUWlNWnJNWHBqUHY2TFVyREUxN1k1TG02MzQ1?=
 =?utf-8?B?SkNVUkdYVkI4UE40c3BISjh0QWVoZm1kcUlVRVMwZm5oNGtIVVpWQ1g4TWl1?=
 =?utf-8?B?dVhJYXMxa01LQ2hjRlJQWkpuQ3ZlbDVJb3hJbHFqOW94eG4relB1djlwckE2?=
 =?utf-8?B?NVBKeHE3V0UvMVlUUTBueDRKWTNUUERtSS93S2hpdG1aUUp6bm05cGdLbEln?=
 =?utf-8?B?dlIybXVHNUZheVdGd0pYR1NCY2xORFE3dGI2dHh4dTRZOFpUakQvTmpoOUJl?=
 =?utf-8?B?MWRRd0FremxmbW51bXBkRkZlQ3EvL1M1S3FMRHB1OXZpc0lSQUwxNnNsditI?=
 =?utf-8?B?YWdmWkJkcEh3U0lIczFHRHk0SUNSaGZKclZtSVlNQ0lzQ29uSklUc0pIS0p1?=
 =?utf-8?B?ei9UaG95VU9YdmZOdmhkcDIzc0RlblRkd1U5cHdlT3Z5Tyt6dWZvY3o0MDVm?=
 =?utf-8?B?dVdlZ1VDOEhRSG5tckViK015YWFmL0t5dGhzclM3R2x2Ri9VSWRlL1ZoRTBr?=
 =?utf-8?B?MVcreVovZW05V0I3bnpsSi9ZN2JsL1FJdExNWjVNbnNYQkhPVHRkTk9QS2lO?=
 =?utf-8?B?b1R5MkhNK0N0N1VCYzFIV3JCdjNDeWFteDdpT3dDaHAwc1llZjUwd1V5bE5t?=
 =?utf-8?B?ZVFIUHpLVXpLWTIrL21udkFaWFcwY3F4Ymtuc0RoaW91OEQvc2lDY1F2STZ0?=
 =?utf-8?B?M1VvVzMxN1NVamtldWJBL3F4aVhvc1BkYWFIODkwRnh2ZC8xbXVBQXRUWXBy?=
 =?utf-8?B?TUo1YzdRNk9QT0d3NWVXRXhVWG9JaGV6TXh2dWszazRXMkNYVkVKMHBlYVZ0?=
 =?utf-8?B?K3IzekwvVTIrTm1rV0pwWU82Y2xpY1pHWEM1WGNQRXo1aWpKeUxlSHFHQXJW?=
 =?utf-8?B?R0ZEb2NnV3BhL2hlSjlBbXV3SGhtS3NFcHI5UUZHNTVwSTRGNHZpeUhVUWRq?=
 =?utf-8?B?dW9pWkpTYjdCNTFZUW1NV1BhWVFxaXBxVVhzbkhWcFBpcmw5cEg4a0lSUmE4?=
 =?utf-8?B?MUZnSlAyQ3dPZk1maEN5TkhRT0VqY1JnbzN3RXNVUFFiMGRGMEZ1VXcvOVp4?=
 =?utf-8?B?NjVxeCt6VExuS1VqZjlvRk1oQTVMOG84Z2hZWkhoV3NJZmV3bEJhNWNYUzh2?=
 =?utf-8?B?dVR0NlA1SjR2NXprQ3kvMWk0N1RaNlRvU1VrcjJZam9SSHRxbXJzQlVoWm5v?=
 =?utf-8?B?VFdjWE1IUzRpbEVqeFdjYVpXdUhJRFJEdHR1RCszdEZDTXFydHJBK2R0dXBu?=
 =?utf-8?B?eUhkMTBCM0dUb1JBR3dCQkg5TE5LR0U5VFpoeTNQcmRIekxjVmh0UmZ4UmFX?=
 =?utf-8?B?SVlCUGg1Vy9aN3VGeUlyZGFsTnFkZTNZYkhIQ1h1aW9MNStibFNQMGVRaFhN?=
 =?utf-8?B?VnRUeXRwT3EySFdab0orUG1SNlgyMGllaXVjdWZ3WFN2TnFZMXg0a3J5Ym5Z?=
 =?utf-8?B?NElVdW1lUm91TkdxSkhOMkVZQlJWYno5dXpTU09NR1prNzRPZm5kOXhRTDJa?=
 =?utf-8?B?WE5FNU5rLytXQUxzdnVCcXZubll5SEV0WSt2RVYrdDNJZUZLUEV1UUU1c0ox?=
 =?utf-8?B?amVLYy9TRXhUUkxrR1JVU3FTOUJCMUVzQkNPc3A1L3dObUZYYVNtRjdlUWpS?=
 =?utf-8?B?cExHK2hNNzFqU0xwRUdvaUZtUEVuSFVubGtzK1JJa01nWHpLcUN4a1U5ejc4?=
 =?utf-8?B?MG9VYzQrS2diUnRNemdlWmVMRDMwcXNTb1lVWXdNRUJDNnUyaTluekNhU1ZF?=
 =?utf-8?B?WEllamlsUVRTVWNuaG00UjMrdm5Ca1hwdnd3MDhqTFN3R2gyYy9VQU8ya1pa?=
 =?utf-8?B?ejJ6M040KzAvQ1lSeVN3VlBibFEwSXJySWxtNlZtV1dPM0pKWEZKZHFCYlZL?=
 =?utf-8?B?Zmw4bHh1ZUdOZnFzNGVZYndOYkxVV2ZFVktxZThkaktJNnVtalhKeU1SeU5J?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tAlrc/8pCcGXQG1ceslY3b+iFN04F9RQwdoCetRc0vVQiv8kR0/mtQYmtszIuLVtar8XgzcNlymGIHn3EFMAjdOxNdL32SlvxrV0rmxAQz41WBM4hDMVqA1H44FS3jmkAmEhaeur6an2pvonLXb9aSxIFTG/78ZqSAdFD7nyXHqwDFLBrPKtiVih0Gjdh/xcYPG9ukogQKrbsI4vx9YPhOx2TvzhbDNYkspfk5NktNxeu822Czj3rML/QHP8p0SJKex5mhnV7r2hCecHZNY7ZtVn6f4RB3/bm2z2bEUTLT85jvvOYeuaOm/vDq6ALV+vtQnULFumVPni9lotj74AeY7JIwkNjFtN0uv47nfJIv0ozdbtue75J+v/+BaMdLIAQFM2IqypK3+F6vGNm3g3axCbKB2JOTGqqaJdupY/3PEs4lySs42fKlLF1/WnTwX0FD8relzNGBAFMEJwecBrLCuiDNL9RMsy0ncxfhTjm0Nz2OMVRH4MdKT74ErfV16uakpFJsvB+1xSyKq/pFxKRH8mYUwCXAi1lSqA7isDtznCAYRx89wkvcxZoeu0JHkCMrPRE8sOkb573bSPq19jryyYnv5rBKQc/YrZpQu22vYf8ThLinfzAdyeMH/EjLxeiWgEtdYOqw5YjQnk4qp7q5fLnuGvjKL6ROUKXdRzYrnA+QRMh2Uol47wmo/5t82tBDA0HmzzLoOH7IB5feoc+A1Hui+Eaz2kg0eVG2325nhfE1tw70Xy9V9riJqe3jcoV5KaouNSslbkKBCOrwL3JKyTv/GLn74MT8Hd5GCulTkGAf/4ioHo+yjkMBpAI8X8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a7dde4-3ef8-46b9-408d-08db57a0b782
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 13:06:39.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpWdPqd1Qwxwtv2dYHe6Vz6+YHRm9L4OAAeFTxJItZ1jfdc8CBW80DS//c5MAXn5lY29LNiTeprbslvjK3qJgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5833

On Thu, May 18, 2023 at 01:58:34PM +0100, Andrew Cooper wrote:
> On 18/05/2023 1:42 pm, Andrew Cooper wrote:
> > On 18/05/2023 11:57 am, Roger Pau Monne wrote:
> >> When a domain parameter is provided to pci_get_pdev() the search
> >> function would match against the bdf, without taking the segment into
> >> account.
> >>
> >> Fix this and also account for the passed segment.
> >>
> >> Fixes: 8cf6e0738906 ('PCI: simplify (and thus correct) pci_get_pdev{,_by_domain}()')
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> There's no mention in 8cf6e0738906 that avoiding the segment check is
> >> fine, and hence I assume it's an oversight, as it should be possible
> >> to have devices from multiple segments assigned to the same domain.
> > Oh, absolutely - skipping the segment check is very much not fine.
> >
> > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >
> 
> Sorry, I should go on to say.  Xen has had code for segments for years
> and years and years, but I've seen plenty of evidence of Xen not having
> any kind of regular testing in multi-segment systems.
> 
> Sapphire Rapids is the first platform I'm aware of which is
> multi-segment in its base configuration and is going to see routine
> testing with Xen.
> 
> I don't expect this to be the final bugfix before multi-segment works
> properly...

I just found this by code inspection while looking at something else,
it wasn't related to any testing on multi segments systems.  IOW:
don't take this fix as me having done any kind of testing on multi
segment systems.

Thanks, Roger.

