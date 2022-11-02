Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E6616339
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 14:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435928.689879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDLr-0006Ha-UJ; Wed, 02 Nov 2022 13:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435928.689879; Wed, 02 Nov 2022 13:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDLr-0006Ek-R4; Wed, 02 Nov 2022 13:00:15 +0000
Received: by outflank-mailman (input) for mailman id 435928;
 Wed, 02 Nov 2022 13:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+cO=3C=citrix.com=prvs=2981f1107=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqDLq-0006Ec-7j
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 13:00:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 485290ee-5aae-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 14:00:12 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 09:00:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5240.namprd03.prod.outlook.com (2603:10b6:610:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 2 Nov
 2022 13:00:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 13:00:04 +0000
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
X-Inumbo-ID: 485290ee-5aae-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667394012;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FCG69aKwVCPCDrV9hAw10OX+sU/2RfItZY3wwI9TkXk=;
  b=ZMPUkoUhkSShbcKE+h9/lJBAPL7OugazOhqc2K9c4/7UkhvBE2QRSJkQ
   apsLvSiQvnDwmQBJTGvzcXazRh+6JhYVlUskzsJ07aoIqi7bTDawXH/qs
   Jfry1ADrK5oQTJJBkmwmQtl8LFEZC6y44DomtAw1DygYricKUgsZoIly/
   I=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 84024085
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rnaraa8as7FlIJWjQ9FtDrUDZn+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jNOW2mDbqnZYDf0c492Od61oEwOsMfcztZnSgZlqyA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPKgR5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklk6
 tdDBishNCuOoP7un6uRTMkwhP48eZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN5KTuHgpqMCbFu72WoKL0wVX3GB8LqUqUzhXOluL
 lYx0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBq19L2ZsDezMig9NnIZaGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXuAi35y
 T2OqCk4hp0QgNQN2qH9+krI6xqzorDZQwhz4R/YNl9J9St8bY+hIoauuV7S6K8ZKJ7DFwfR+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5YEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:kaE5Aqk5tnvsvdmTnHzUAWdRA4HpDfOgimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdC9qADnhOZICOgqXItKOTOLhILGFvAE0WKP+V3d8k7Fh6dgPM
 VbAs5D4bTLZDAU4/oSizPIcerIteP3lJxA8t2uqkuFIzsaCJ1I3kNcMEK2A0d2TA5JCd4SD5
 yH/PdKoDKmZDA+ctm7LmNtZZmJm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYZ93
 TfmQCR3NTojxj78G6Q64bg1eUYpDLT8KoMOCVKsLlVFtzYsHflWG2mYczDgNl6mpDt1L9gqq
 i2n/5pBbUI15qWRBD8nfKl4Xic7B8+r3Dl0lOWmn3lvIjwQy87EdNIgcZDfgLe8FdIhqAJ7E
 tn5RPqi3NsN2K0oA3to9zTEx16nEu9pnQv1eYVknxESIMbLLtct5YW8k9ZGIoJWHuS0vFQLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2Hp500wbzsoCmWpozuNLd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTnfARBrdWVjiUmgP1Jt3S04lh6SHnondvtvaBKDg5KFC56
 jpQRdfqXM4fV7oBImHwIBLmyq9MVmAYQ==
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="84024085"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fraDem14VvtsV6lzKTLvjGhIPD6EdJXyRB5KDx9c1Kk8dwJYBQ+/jhTzzWFUjCZ4pkAGnutT1Dawbe9tsSeIeR9nzllOuip7s0SUde6H7SvT0pL8dDAKhDpUazVBisN1QzD2J/ETbayw+LedWXp/20+h4dpM0c4TV2ALtJi6ouzjEhPjjmJKKDoX8HTbeFv11F6Kp657icbFw/S7RULVeWBd4YviriS/68G5rbhDHtaSi9xTiF3Qb6L76O89k5AXkghjRdZ8tI4aUSfFkApj6eyymN+/PfWsaFfeZDDWyn7wUXlrRsBOIUDFztWJtUrttw1LmrDe1tKc0uGFKEQcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCG69aKwVCPCDrV9hAw10OX+sU/2RfItZY3wwI9TkXk=;
 b=EjKrHcDpyxg6IkXnKMJ4thLHieMMpValAi7cAOSoVIBQjRT35V4EFqgt26P9cRfyqekUyyFSlfBg8cBoBC9F/IaPfgun4AxDNEy3c7LVseSjET1RKPjfcV/5D1znjEWWWKWH66fNIlbvgJFuVOn99m/53XzDfqwq8L5MOS8LdcHuuW+ga6RiAPf6kJwuFTV8yl7bKcblnbrlAHxEmCK5O4MVaJ4wCJOKq+DRtwX46oNdhj2FEPV5P+vfV+Eoz0JHdWUKpZC5Rcx/vUDrKI46VU9LyJMgP/e0tj/nQL4rBS1SeawhL/N9YgeCAaRdKv77RW08/58yqCV7Xg/PHwy4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCG69aKwVCPCDrV9hAw10OX+sU/2RfItZY3wwI9TkXk=;
 b=H8huxwCjnZCgUfOrqR+2Ig1K8fhgivwRATeLiplxm0nUDd4S9kDOVmwuekZCEz7VxjepBcEK1JTXhSKi8IJkv31QBVs7CbTRNf+XgT00G99ZBS6A1eFzamE8fMFqVBLNFIu6AwS8fg84pMzkcP6wWEY0YP+cG34+vv37TXUlN3Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Thread-Topic: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Thread-Index: AQHY7q5c3VQOfOFuk0qA+nRDI2AEY64rmK6A
Date: Wed, 2 Nov 2022 13:00:04 +0000
Message-ID: <5e3c45f1-7d31-f0e0-4224-e5317b004051@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-4-anthony.perard@citrix.com>
In-Reply-To: <20221102112854.49020-4-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5240:EE_
x-ms-office365-filtering-correlation-id: 80a66a47-5756-4863-8f70-08dabcd228df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EmUnNNwu7EBj8cD4GPFN0ryhhVmeoe/kCs5WDtS5GY/nTtrY924pjVUOkXe+MbG+/JBBV5YDU5YbiLeRqSHzwU991hL6sCkJyIaapfSSSag0/jNV1y0CvGDnGFH6hzEZJ+rXW8dCvCPBWntCJbaLhvAg9Uq07KB3ZeFmP9VaWc3d4sTR1bwoZbrpmaJNuddbtH7megh9qhPZWENF9UF0SLbdoBBrDjOy0j9+WCzyAEJrnCB7X6Lcu5Uno2nNg9tfqCocKdGjz+wAX7y/8laWwoTT3osf6qZrkq5/6iycTEdz0LazoPk62ghYD7ut256grYcqKgxjhQOsJTXFKXT56ZWQZNdSmDaepzHA880QymQWG2Eatu74etFRTPZFwZ0lbFb/l1GjnwrhYNXkQkySwdvH+wbg7wD4ePEaVPIW8jOHyXtO1PLtQ34f6iMqoI1ivTxvApitq+mlBi1wApyRJhMIYqxPjxRRTurd1Wev3cWUSlVLZkMVLHShGYeUAPCXi7sq/1PcFzMCn7WXhk9SKhmgUTue4UGtmh4NwCA+UT77A+jtPFwAxOjM6nnDrsf4bEhLFmRooet94FYbZh0swkRY6ZTEJZTr1KAF+6PZ6P1ALaabBlpWykd4GHNHRAHuHuirDh7X8UgdC93wCstzL3kYKZMOgY2jVbqsR6BC85oYhl2ze882eVsRuj0yvMOBOH84G0fzztYpVphDOTLXoAPpEjI6o7ueTi3PABEl4HXwVWYZPUTqdN21nixp/iwr+ivPZ+OOmLdoZ6nbq4hKV/zD4UUn0O+PSbzoRejDzMAW9394sZp33d3CfcUX/ktEatc645i3W1RjRZTJY/kBQw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(316002)(110136005)(38070700005)(54906003)(8936002)(36756003)(5660300002)(4744005)(66476007)(66446008)(64756008)(8676002)(4326008)(66556008)(76116006)(91956017)(86362001)(31696002)(66946007)(41300700001)(26005)(6512007)(6506007)(53546011)(2616005)(186003)(71200400001)(82960400001)(38100700002)(122000001)(478600001)(6486002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDVEU1R0OGFMMVhkaGJhYmlqZGVIVWdGVmsvRkN6Z0tjNW9nZktuWGJkUUJJ?=
 =?utf-8?B?d2YrVTkxUnBWTGE2bS9oeFNJdEozQ3pEUVltYzUwQUQreVprOW1URGt5aEFM?=
 =?utf-8?B?aVJZakpBcE9nYlpnZ0kwcjdiSDRMKzB3cUsySEc3UEs2eHZud3dKMFRJM2dS?=
 =?utf-8?B?WDN4UWIyWVVxa3o1MWNnRFhKb2lOUjQ2VDhWanJZMldKRk1pWUFhdGpkZDM0?=
 =?utf-8?B?UmxKZlluNDZWZVBBSTE3M0FVNkxGbHcrcHdKUXBCM1JIN0M4RjRWeGpmaXVk?=
 =?utf-8?B?SCtWQWpSNjh5K2JTZ3R3MDkweFo1QnZmY0lWL2JmNmZyL1phTXcycmpzU2Ix?=
 =?utf-8?B?Y3VFTDd5U2lzVnc0QlNOSmVVanVESVRERUp5K09rajRMOHBKSktNVFV4cFc5?=
 =?utf-8?B?YzJzZVUxYXJLbCtnVjdsbzN1djVhL3hlaVI3aFFFWGwzUjNPMXlZSnFEZXAw?=
 =?utf-8?B?N3ZycENmbjZhTVJudkh5YjhESmd1QVAvci9ONHdETXJjdWpUb2gxK0NEczAx?=
 =?utf-8?B?MlE4cmsvSCt3ZmJuUFJ4WFRiQ0ZYSEpoQ2lad0FnT2c0VzBhL3QzVm12cHI0?=
 =?utf-8?B?dU5kMWNnNkY5OGtLbTR1ZGlORUtwQnZuVC9PN1lJbXNNclZMaVVIMklZNk84?=
 =?utf-8?B?TzVPQjF0bDYwbmpvSU9DTElkR1NraGh5bXU5UG9sdXZiSERoVG1Xbk1iK252?=
 =?utf-8?B?Q1BTKzBJNnplRklCVzdNS0ppMmppajlEVjVpbmUzZGRlRnhCYnc1czBieGUz?=
 =?utf-8?B?N2U0WW9ZcUpUTGkyTitsU2pIZCt0YVFLa2pzS2kyRFRXVVdOZURoUHJUOE9y?=
 =?utf-8?B?OWpMS2J2Q3JUdkJJaWdpN1BvakRyMWxmRXFySnpkcFBlcGV2aCtwdm9HQW5i?=
 =?utf-8?B?bkpoR3RFRU9QbHVqMWdiOVBtQVRhWnBYZjFDajRaYm8xUlRNZmp1UVZ3Qkd5?=
 =?utf-8?B?bmtGYmtZYkxBNVRTTFZCRkloZW9ZOUViN2x4bmxIQW1TYlZjYXZPVVZ2MjBP?=
 =?utf-8?B?M2hkSFlBZDVjbXN5S1RXUUU1UXBHa2NFK1B6SGhWMS8zNnJTazRJMSt1LzhC?=
 =?utf-8?B?c054aEJ2YzFob3N1WWErSWZKdTYyRXZQdXR2TEVabllKY0M3STh1S0N2d1l1?=
 =?utf-8?B?TGJBb29PckJ2NTBycWZGS255Mys1aHBQRjYzN2FrZEo4N0hhTjRKSStQRHpW?=
 =?utf-8?B?YUZuc2J2UXNPYk8rVTd0YklnNHpldlZuZmRMdHE4VkN6T0ZXcXZMQVc1ZCtU?=
 =?utf-8?B?QWNTUWJRcTBMYjVrWUkrWHpONkVXYi9ZZlRmRGwwVmJsMGhuVU9hNDlid0dZ?=
 =?utf-8?B?YVN6eXEyZlhWajJ3SFFtT3JFNFM5dUhySjBXdGVwaHIrRzBFeFl2YkJWbWpF?=
 =?utf-8?B?bkxxK3l6dHorcW9ISlhkWktWbWRPWkpNdEpvQ01JcGw0OWRQaGtQNjN5OXd4?=
 =?utf-8?B?NUc1dGhtaDBMcENaaGtxMER4RHd6eVo5bytITUZWREM0NUN3Yk1vQVEvazFa?=
 =?utf-8?B?VUlGNWNFaTlNOFpBNVoxTUtpSFlPbko2UmEzYnBlbHlYTUpkWmdEWmxoV2FW?=
 =?utf-8?B?S0pSZVFWOEJsN1NqKzdPcS9OSEZiWlVieUY0UEkxbk9sY0I0emw2WTFxdFVi?=
 =?utf-8?B?YUZrL3pMOGV0dC9MNjl1UTkvWHJHRit1dkkySUpFL2N2VW5oNEJNS0trYUMx?=
 =?utf-8?B?R2dFelVMdk5lZ2s3YXpVeVp4ck1uVGlqR1gwTnBkMDRMUjVWL1hyUjREN29w?=
 =?utf-8?B?L0R5M0NmWkVZQ0IxalFnRVNWc3dQN2d4V3FDK0tYV2k0TWc5RnhYSWYzN1lY?=
 =?utf-8?B?V2h2UUU2Zk4xeE5BREtEd0pBV2pKaWJRNG5HUTdIU0FXK3ErZjFqMm5yZFJ4?=
 =?utf-8?B?eDlmR1VTTkhVdy9XQWxXay8rNG43bG5IVm5odi8rUGlTSGk1WTZRdHdnTUU3?=
 =?utf-8?B?OUsvSVN3aE5xbWgyYXcrc1NwdVpFWnNnMDZRNjJVV2diVnNtZGs2MzM2eG9x?=
 =?utf-8?B?MktrUVlhdFlmWkV6QTRRSlNMYnNwUEpndUk2SjJybDVEUFdwQXk4Vy9PSEtQ?=
 =?utf-8?B?RE8rV0l4ZExZOGJEcFJ5UlVTcDU5eitIK0tVVEdrL1JHMjcwU2lRVytKTVZC?=
 =?utf-8?Q?1SjH8VZvEo208sbvnJ3L2QLYW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <732FC1DF9CCCDF468F8C0061177C2A4A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a66a47-5756-4863-8f70-08dabcd228df
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 13:00:04.0615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqMH9hEM64rKYrzmejF6PxoGByHZzqVWJEkALu1xnOy8XS8CS3eVAX9j6w7+LZ5Qco/K9UGTYPaLHS8nzI0I6gyxOXK5thJVV4qoQ0rwdO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5240

T24gMDIvMTEvMjAyMiAxMToyOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFRoaXMgaGVhZGVy
IGhhdmUgYmVlbiBjcmVhdGVkIGJ5IG1vdmluZyBjb2RlIGZyb20gb3RoZXIgcGFydCBvZiB0aGUN
Cj4gcHJvamVjdCBhbmQgbWlzcyBhIGxpY2VuY2UgaGVhZGVyLiBUaGUgb3JpZ2luYWwgc291cmNl
IGNvZGUgd2FzIHNvbWUNCj4gdmVyc2lvbiBvZiBHUEwgb3IgTEdQTCBidXQgd2UgaW50ZW5kIHRv
IGhhdmUgdGhlIHB1YmxpYyBoZWFkZXIgdG8gYmUNCj4gTUlUIHNvIHRoZXkgY2FuIGJlIGluY2x1
ZGVkIGVhc2lseSBpbiBvdGhlciBwcm9qZWN0cy4NCj4NCj4gUGFydCBvZiBkZXZpY2VfdHJlZV9k
ZWZzLmggd2VyZSBtb3ZlZCBmcm9tIGxpYnhsX2FybS5jIHdoaWNoIGlzDQo+IExHUEwtMi4xLW9u
bHkuIEFuZCBwYXJ0IHdlcmUgbW92ZWQgZnJvbSBkZXZpY2VfdHJlZS5oIHRoYXQgaXMNCj4gR1BM
LTIuMC1vbmx5Lg0KPg0KPiBQYXJ0IG9mIHRoZSBvcmlnaW5hbCBjb2RlIHdlcmUgYWRkZWQgYnkg
SnVsaWVuIEdyYWxsIEAgQ2l0cml4IHdpdGggYQ0KPiBMaW5hcm8gImhhdCIgaW4gY29tbWl0cyBj
M2JhNTJhODRkZDggYW5kIDQwNWMxNjdmMGVjOSBhbmQNCj4gODg2ZjM0MDQ1YmYwLiBUaGUgb3Ro
ZXIgcGFydCB3ZXJlIGFkZGVkIGJ5IElhbiBDYW1wYmVsbCBAIENpdHJpeCwgd2l0aA0KPiBjb21t
aXQgMGM2NDUyN2U3ZmM5Lg0KPg0KPiBSZXNvbHZlczogeGVuLXByb2plY3QveGVuIzM1DQo+IEZp
eGVzOiAxYzg5OGE5ZmVjN2UgKCJ4ZW4vYXJtOiBtb3ZlIGEgZmV3IERUIHJlbGF0ZWQgZGVmaW5l
cyB0byBwdWJsaWMvZGV2aWNlX3RyZWVfZGVmcy5oIikNCj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBD
b29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpJJ3ZlIGNoZWNrZWQgd2l0
aCByZWxldmFudCBwZW9wbGUuwqAgQ2l0cml4IGlzIGhhcHB5IGZvciB0aGlzIHRvIGJlDQpyZWxp
Y2Vuc2VkIGFzIHByb3Bvc2VkLg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCg==

