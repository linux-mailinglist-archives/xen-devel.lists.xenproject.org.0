Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE86CC1F0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515892.799212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAAa-0007oq-Dy; Tue, 28 Mar 2023 14:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515892.799212; Tue, 28 Mar 2023 14:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAAa-0007m7-Aq; Tue, 28 Mar 2023 14:19:28 +0000
Received: by outflank-mailman (input) for mailman id 515892;
 Tue, 28 Mar 2023 14:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phAAZ-0007lx-BI
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:19:27 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8842090f-cd73-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:19:23 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 10:19:20 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6755.namprd03.prod.outlook.com (2603:10b6:510:122::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 14:19:13 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 14:19:13 +0000
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
X-Inumbo-ID: 8842090f-cd73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680013163;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5y+nNRLdIlX6JyWse4KtLL2uyLMWdzbAiJcScIblJmA=;
  b=W4Gs0DKhncmxEpRPocG8/CpooeHEbyLKi8q2s6DTUUI9bUPOXYkWtSpI
   EFyW51uQQvtJieMmoIruo2XW6yGA5DU3KTaWkv1lBJUMd8wy7x0defBk8
   cQabKvSXdC7vBlPEPNJFI0U41ujPn3O02vv40IkXPQ+Zf+rOoPNbfTnqz
   0=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 103386364
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lF0wFK7PVmeBBh4rUfBkqwxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 jYcUW3XPP2CajP8KYt1advn8UlUuJbdm4BhTFM4+XhgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 MFfJDkidSK5ocm3xJOFU7Qrn5R8M5y+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOaF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXigCNxJSuHQGvhCw024+G0YEzwtaEaqvfia0hSxZetjE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhrigqVF449VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:Z71bUKHpmuPjSE0apLqEL8eALOsnbusQ8zAXP0AYc20yTiX4ra
 CTdZEgviMc5wxxZJhNo6HkBEDiewKkyXcW2/hoAV7KZmCP1wWVxelZnPDfKlbbaknDH4BmpM
 BdWpk7JefcSX5dpq/BjDVQFexL/PC3tJqFv6P16VBDbS9XUIlczyFfTjy2LyRNNWp7LKt8G5
 qY6tBGtDa7EE57Uu2wGmMZWezOvP3n/aiWAyI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103386364"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKl4g7hl1reruNc0YPQyY2561xGF1rUAv7+OmS2vQbaBwM322FUTzGM0Xsggns/sSf9d7FE8otolxrXbJ4BZ61C8ER8wbu7IbezM1uWpd724RfFnHKjxrLpn9J+NjmdC6mImGKAoFShoOeauZ4ZxxV9LEWPhw10WDC6/iJ3z8ITNB4GNOgBo6XDlNUzFmOOMJL+nOQhF9NBt72kBZx4bdfJbTYHO6SioJQGlbH3vB82qGqbrzbxFJgD7jh5ry+4AV3nXB5VnCc04lQ5mVxvVO9MOeeYaolf6+WzrtGXQ43uxoeHHULaG3FVxrLwiyN1oi7VD6SNuJMPE6hpG2zzl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y+nNRLdIlX6JyWse4KtLL2uyLMWdzbAiJcScIblJmA=;
 b=HS2nB9r9koBs4JnjBBK5MkmjM+ApI2UI01zntNEOFBK/X9gQmuj3bZU4oQVxaMs5AEs8pnKHR3bKMSUIdcZ7xX9g0lFou+XSkZU02U79Jy7OyK7HeUypZPKr1LFcdE27t+g+iKZhXfN+ynyLvtNWK/PzYwqUrLEmsAiEJd4YYF2tFjgFdHj6o60mRo8InvDMkgf4PVdi2ydKpX/9eRGLKLBOzWsh9oTngEWRYNmBMGTheH2D1oHkc9QnI0fscwy2xnqN/UJkAqRXwGoivP8PVHkTVqOhQkPcojiQ3SxbNQHbqtI0i/bVLrcUZ8X1DLp5fUkgi3AH5md0jJjZgBGOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y+nNRLdIlX6JyWse4KtLL2uyLMWdzbAiJcScIblJmA=;
 b=KDWi5Wg0GBqW4ZtknOvvaWgodU4e6Um7iZV57LSX7F964Epr/2E/oCDplsoOZWj4hOIi0A0lLbRSVv5naZnT8BxzkvC8IQIWZUxUNef64BRSJh8B0PsUBhlspodjynyi7nuOkTVUSv2z8Rai7FmSTKM5ao1qGDOZRDGZNQtQtEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 16:19:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Message-ID: <ZCL3W/HrwLANuE/0@Air-de-Roger>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
X-ClientProxiedBy: LO2P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b51001-152b-4f83-b349-08db2f9767d1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bsTvCuHaw+4kD7RbeYIaAzKZbBCIq+H4X0YysCR3bi9Of65MhKLLSJjcpE7DPA5uLKv/58wlC1n/ww9xMOJyLJoYrCpQFfdY1UYYZAe9414r59X3B8nXceQitQ4eGpOc5C5BggB9l1Hnxwm7Q/ij9T+SkeKcM/0ackDWNx0J+Qysj+X75ythOw/zDt+RkorRSL9dKbEvyXVn+PWM6aY9Y4QwklV8K11IoPSzTHl36etty29WERK7N8lL/DTCK6/z9JYAKLUxk4QE5JSTxl87GxliAG0BFSUutGHSeS5u18O66iykXZpfaB0Vp4TubxhoKmjWZ+F0lq4T97qKjBZIfRCeTqy6KUzFoFBc7mPrTXXh3qxRMbX6Jnw+lyAAzRZnS73BS0utxCl0kwUS0p3pqt2URnDMWM1vn/r0EupYw8jqxPK+TLH2mU4TGjyPHli4GBDgqp3F/dEqIVMJp6GClfivzegsDFlLViN0fY+tgcO6vOViXMz3NBiL4B+NVxn3650Qp59n9houiE0ubkGyAJ9hISnvQj/9llmtSqJw/mcK1CkKUOIAcNUXXSpURDPS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(186003)(478600001)(54906003)(9686003)(6506007)(6512007)(316002)(66556008)(66946007)(6916009)(66476007)(26005)(8676002)(38100700002)(4326008)(6486002)(41300700001)(6666004)(5660300002)(4744005)(85182001)(8936002)(86362001)(33716001)(2906002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkxaNFA1TnVwYVloOVJDVjNaaHg3S2ZjTHFTWmNQVndEQmUyQUM1d25aZ1Vz?=
 =?utf-8?B?Wk1SbE5nWGR5ZGkyNWU5bFNEb2NORXdKODlVV3YzOUtvdnV4TlBadTk4TjVK?=
 =?utf-8?B?QngzNGZKaEQ1QWRaTVZzMlkyQUlrYnRxTjZmWDN3bVJwcEc0Zlh3SmhCSW4x?=
 =?utf-8?B?Rys5djlJNWd3Tzc1L2hsTld5Y3Raczg5ZVIyYjRkeXhJUGIzNlM4QUJHSUMx?=
 =?utf-8?B?K2pTUXE0Sm95bng5NEdnSUxqOU0yNjJyaC96TTEwTGtlTTAvWWJuTGhySWZP?=
 =?utf-8?B?bGNFWUNobUtLeDRrNkx3cW01R2RVd011ZGRpVUFPM3dVZytsK2NJZVZ3OE45?=
 =?utf-8?B?dHVYYzdKdytHQWhTQXkxTVhKeTVneWVWN0dyemNQTzVsbTlXOGlWNGRMTEpG?=
 =?utf-8?B?Z1M5d1Rud2wzc3JLcnhTVzdaY09FYXdUdUg5cjhBa2svV0ZmaXBBbExXY2wx?=
 =?utf-8?B?bklRY0oxUzBiMWR2b2NWTnEzRDl6QnJqTXhTTWRtMEJEeURxZEpZOElIZ1FL?=
 =?utf-8?B?cXhYeUltOXFoYzIwRzZGQldRd3YzbDNITmFLcHo1R0tRSXJLVityb0lrNVZG?=
 =?utf-8?B?M2V5VWFVaHBjL2ZKVk5qMnl2VzAwS2FjeVdTOGFKZGcvbGIvdDRaWnhOYXpE?=
 =?utf-8?B?QjhyV2txT2U4OVNpVDhCdFIzTDFFSm9VbXpEMTd3NzhJczRjdE5HTm5FWWNh?=
 =?utf-8?B?eFJkTFNrTlpZUnU2RlY1c2ZJZ1IxUkdxNVcrMnRybzF6SDluYjJDcEMrYzI2?=
 =?utf-8?B?MTJJTHcva2FLUFI0cEN4Z3hGSzZrM1E0dEdBdEgrNGpjNlFDT29DZUpNSFFS?=
 =?utf-8?B?b2tvS085SWRTUUpOeXQvcElFeUVUT2pBT3FrUlZrNUx5Q3A1cVc5aENua3k0?=
 =?utf-8?B?WjJEL0Z1L2tZRXlqTE1RRDdaLzVSZ0U0YkZGZFlLME15QWFSdE1jMDJ6eTVz?=
 =?utf-8?B?dU0zTk9FQ1VzbFRrV2x4a3U5TnZWYkxnZlBZY0tsc1hXZjcyMGNnSnYxakQ5?=
 =?utf-8?B?V2F2QzlKSllqZHlaV0UvMTh3azlyUXk1YmJ1YUQ2TzdyWnJ3dlMrcWRTT1dy?=
 =?utf-8?B?L1VEamUzRFBlTkl2elpNWTRqZEo3bVBVdlFaeHBTa2owSFNzcHI5TmpoTDBV?=
 =?utf-8?B?V3hEdmVuSE1tNisyRmpiSEFlV1hoVU9TcVVhT2xUaFl0UWdxYTY2V0RyNHh6?=
 =?utf-8?B?TDAwN1Fhd1ZQcGtrQnpKMWtocUhvRXYxbHhmQXdUb051MFFtM3laQkpTakt5?=
 =?utf-8?B?TGhVQ0h6ci9BMWVRbjN3MFN2MU90OWFrSkt0blVYQVFsVHZSWFJ2bS9iY0dv?=
 =?utf-8?B?S0F3cEtZbVp1WkNiN1h2bkEzREdGNTVWcmczb01LSmJFNzI0TGp0eHA2MlA2?=
 =?utf-8?B?cFhhMktDYm0vV015bFA3b3FGMlhjT2R2U3hucDQzaUtRVCtKUGp0VXNOY3pq?=
 =?utf-8?B?aDI3eUc4Tk82MWR4eGFGNWZBbmM3U01ZQWVjT3JlNFdrbXc1NXNWNXdQYXI5?=
 =?utf-8?B?WXRKRWZQbDB1cDVndjdkSElUeHR6Nk85NE9uSTFTRW9wdHh5bEdNVW0yZ25F?=
 =?utf-8?B?TlJZZDF6VklNSDFSdklCZ2thZGdZT1EwRytJR3IwR1BDRlRSSlNXYStEWjJx?=
 =?utf-8?B?dGlML1orL3UyOGlxR1EzWFJmdG45ZkRmSXJGRGpnejlsTUp0dG9WeklpUnRC?=
 =?utf-8?B?VStYdURBQmJ6R3BraFc0MDdrc0tBZXBlbXBnKzlKb25MbWdSTVJ4NStnUXRx?=
 =?utf-8?B?SUYyL2JWVkRKTTJ6VUFvYnA1TjgrWGZ5aXFkUUgzWWc2MHZnMUR2UHZYWnhh?=
 =?utf-8?B?ekV2M3lVKy9NRjFmdlhtVkhvRDd1TjBIQUg2aWJhV0d0QVQ4UHEzdEtZZUVq?=
 =?utf-8?B?Y3NjSjd3YjRRQUk5QnJ1MnVoR2xoZkR0elBtSWFZbzA2Ni9QSnJXVXJpUTQx?=
 =?utf-8?B?bXExNnRsdDl5VXViYTJYNnRBU05Ga2NBYmVuWjFvWStnNW53cm1WWU9MTVBV?=
 =?utf-8?B?M2JSaHg5WWpxS2hJVzNsZlFOcEZ0YXgxUWdmOXA3QmVDNDA3QlJ4NG1UQmhQ?=
 =?utf-8?B?RVN5b1hKMmRla29TcnowNXA5NmxPMk92elFKWm02RlpkM0FtdW9ldVRoOW5o?=
 =?utf-8?Q?Dlnl2ryHnneMP09uHU9L/61n4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1zTKDOZgxHn0IddP45XnWlkvH0IV7CvuJnea0Ogb9LPXqdL6BDShvNYw9ozqFN7/KKUAsAcZic2QkWUnHVSKII+xx1CV/qH7CtHRZCYwIVzo7YV99RRoLz3srEtWP/PPq7P4Gk9deai+m6ZysjR39mYYJD7886Hvz6nDqgY0UvhpjlS92T28BxT4hwIF57KFOTnRHS0KHG7TQGN6HNXYYG8tz1NL7rHK8mrIVQYp18i6BzdQ6o030/mDT6um2pH+YN4WNA9eaJiZR+kzKKvrDl2wERD++9SBjJPhPxnOKmvh7nDw34weuYjRXBE5UYDugnSphEiL2VWRox3cnrywGjvIeJnVHlq1ltDnoAlUp/txcHzzqpKL2V4+0rSgHKwQELYMi5LbHIBDgbjvh58Rhxw8YC/Ils7Rga1s20sxlSANhgFzfFOIJMM/4yLYkO86nHEZ05ohuN17AoCjCJHasdG0hCZnxcFdVnYx7ezcPJ39V+OAa1NK7i5Xy+0JdIYSc2PglXrGol+yGlqFyjVnx3l1nxu7NtaMvQrzWWUsfvEAIKkzi04qrmA/e8Mx/FQRmjyRa2QpsQz7tBHxPccIm94ANFcLoLwT1hLwoKqTGDLwQ+mLFm0Zy8OsvmF1SoAlc/fKdd3dCWGNy39gpMkiJ18fwU3oiboNlrky2n7PwPCCvnkDSZjVgkKlIdPvS+ABqvF89o7moYF1+pBc0VWrF1AwVW3jr3HDGOBpXnBdRF1qtv//UTVlmkl62dTDhbUQ3AvLLLqcdSIE495pzbJXUxEb+0a+RmL6uNAsb0MbH4p93jnA48/vZieevCKmjdzh
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b51001-152b-4f83-b349-08db2f9767d1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:19:13.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJAw4K9WPGBNG7RY6uxuTg2l8DBmdPi4mTf5GRE9Lvxd2vB+esQHOp3MFj7O0egnbsuBiXfidZycRVHxeeELZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6755

On Wed, Jun 15, 2022 at 11:57:54AM +0200, Jan Beulich wrote:
> ... of the huge monolithic source file. The series is largely code
> movement and hence has the intention of not incurring any functional
> change.

I take the intention is to make code simpler and easier to follow by
splitting it up into smaller files?

Thanks, Roger.

