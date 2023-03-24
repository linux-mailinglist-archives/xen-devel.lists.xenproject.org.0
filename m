Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8A6C8280
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 17:39:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514362.796509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfkRG-0005G4-9j; Fri, 24 Mar 2023 16:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514362.796509; Fri, 24 Mar 2023 16:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfkRG-0005De-6h; Fri, 24 Mar 2023 16:38:50 +0000
Received: by outflank-mailman (input) for mailman id 514362;
 Fri, 24 Mar 2023 16:38:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfkRE-0005DN-LR
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 16:38:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 581c7d09-ca62-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 17:38:47 +0100 (CET)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 12:38:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6436.namprd03.prod.outlook.com (2603:10b6:806:1c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 16:38:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 16:38:32 +0000
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
X-Inumbo-ID: 581c7d09-ca62-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679675926;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U32qOudvgrqh/0IHQ1Ckx2SUcU0J5C3AjWqbRDtl0Vo=;
  b=f+8gU8mT1A/NOV4jQVAoTxDcdi6nrANgdTLqtnjjk5J2jr68gaIkPWf6
   syfcR2WLy+NnTQFnYk5H3xtQ8sgi5QyVv0alqPFEA4w4r2cM0K3MEwiiL
   K0RX1DaB1BtPmoAsuDixRHfQNjqeAX9hBIYZ46JlsBMJHcpZaicImF+3n
   4=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 101592902
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:k/oJ4aInTcQZKB+UFE+Rg5UlxSXFcZb7ZxGr2PjKsXjdYENS3jwOy
 GRLXG3Sa/neY2OgKosgOYrn805XsMCBzoQwGlBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZiPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4rJEt87
 KIjDgsqLT6NnuS1/6q1SbFj05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLk2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHuiBdNIReXinhJsqHSvx10NJj42bESmjd+Gk2u/At1nL
 VNBr0LCqoB3riRHVOLVUxC9oVaFuAAdQNtaF+Am6ACLxbHQ6gzfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrNU9JiHaidntDzXzbqz
 FiitzMijr8eicoK0aST/l3dhT+o4J/TQWYd+QH/Tm+jqARja+aNZIuu81HXq+lBKIWxSUOIt
 3wJ3cOZ6YgmFpiIiSGJBvkNHbug+vKZGDDamhtrDp4nsTO39BaLdolK7DZzDExgKMoDdHniZ
 0q7kQZY/ppaJnapRa5xfYOqCs4uwLTgFNLqTfTdZJxFZZ0ZSeOc1CRnZErV2n+3lkEpyPk7I
 c3CKZnqCmsGA6N6yjbwX/0azbIg2iE5wyXUWIz/yBOkl7GZYRZ5VIs4DbdHVchhhIvsnekf2
 4832xeio/mHbNDDXw==
IronPort-HdrOrdr: A9a23:xBKwqaroAbACUxSNJAUi8MoaV5rseYIsimQD101hICG8cqSj5q
 aTdZUgtSMc7Qx7ZJhOo7G90cW7MBbhHP1OkPAs1NWZLXHbUQKTRekMg7cKqweQYBEWndQtsZ
 uIHZIOb+HYPBxWt+u/xi+SeuxN/DCAysqVrNab9VtWCStNTI5BwTtDIju6NGozfiV6bKBJd6
 a0145Jpz+tY3QFYt7TPBQ4duLevcDMkJ78QTNuPW9E1DWz
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="101592902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyb5Olh8LKJodnNO0BUflWkkQV3z6xtzVaUnRSBzpJp7CnusOEIrDOXXg5cFvjjFIp8jH0JEbPUSb5f/sJGMp4moHYRxMw6GUlU59LC/1OODeTVQud0jxnzxYl5pafRA5hGCARlLxXj2B5Jd2JFJNG0lqL+37y8hNu/Fy8LE/5pC5HiMei93Vul8my/BBkKz0gko4tgRO/aD7nFFw0D5s2sJkHrTT0P7ptxX4gv3meQ35Bdsgwdzv5hlM5ZU4litdF64HYaPyZi61VvQyhH/VrhZmt/tWWuG95CkaALUfwxB/F6rmUi6tWMo+EqnUmrzhAurl8+FBw9TgSMqHY+gIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlVL07ZB1sTa4ivG8qPCxiKj2q2EbkFFbLtTuh0CD9w=;
 b=kLiCA3ccFbScpaiibointPhDYmQnSrKicnPWRTdhg3sWUgVNwXim7CjBJ7X+tUYca7R+j3UnhTKp/SEFjpCK2hsu9QZPcRQH9LYsjVjBC3RzKwgbdE67ezAWL6k9QI72ZfyAPeRkfbpj/KfjZw4HDv2+o7bz4OIsClxonOKwDnnwxF3JRnguoT0P4EB7427RugbrpiJ6uoZ9ngjX9MhRzPOq/jjsdKBdu8NfxRdtfppVrETKexCpxZ6elM+PXHCPp3QwWqdGfCKJUzDgNQ1Gb3IIdks5vKG1fydPe5LElGZsHOeRUXI7MfeT51NmNiH5TfxFfEZFjfP6Anv3Z3Oxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlVL07ZB1sTa4ivG8qPCxiKj2q2EbkFFbLtTuh0CD9w=;
 b=NDbj9snr6rzoSpRPNZ8fO3fMrft9wVk25xhPHm5S/wWKaLoEK+Z0Nl7CaEUJTtHkbttX9f+8ghwyeHzjiR10Vcxa23p06fUdGo1SPj7RwfUAZ9A6VIYONFdSvrmISIIoXoXw4Gg0wM/JhYu5nnmZQ1N7oDvwLxY5I450FBlGxc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bb030640-0e5f-1d48-0d02-f6ff4c6959f1@citrix.com>
Date: Fri, 24 Mar 2023 16:38:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 0/5] Stop using insecure transports
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <cover.1679412247.git.demi@invisiblethingslab.com>
 <fa35a012-dd6c-426b-2c54-f03024b010cc@citrix.com>
 <c47045b4-25a4-4b2d-b3cf-76708bdcd6ca@perard>
In-Reply-To: <c47045b4-25a4-4b2d-b3cf-76708bdcd6ca@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f15ade6-1edb-4122-b357-08db2c863453
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M/nIgNLfsFmHl059bO00kkLv2BZgVnP1dO52u2rOgpA8LJgn7dBXHdNeh4+FumllEr3baNlnovFb17DsAKH+f2pfpRWuC1RW8dQxTLLZ/bvllAFyssWvvSRFxtwTu1unP1RDL52mxWEKe1QV3ao7/Jgc2z2+d5dUkpSVXC1zyp4H33Vfo0J4h1VM+vbArJVVC+meujhN4e/a6aSLM5PHFxZ2loDaGAGE2BwFL3URv+nelWHVy/2SNCtA5UqBoHCAVaop66C4YJK/QcU+gCS4zYvAo0iw652CzsWumDTKxeUIvlNxXwS9+aGqhZvTGDMLviDqyW8DpjW0IQhHj8uiVJzncYhvKNaGNKfTBxWTsjDlen4qyqUB9u1VL8ckpVEToynEbhFOD4WXlKDGHL9jK8fznxVgm3N4QTPq7GO2GUwimVzd74k5ZK6WwYpBrtQLUNGC9jmeSW4jCKMN1OoejUW9JF2nCPmKMZs3iWrCHKHlKJ9TVYjqBuS0aPZS4FsRi2SxEQ96Gwv3ZKmYwcUhRk8s0CokaTVTluyVvwl7dDfs2K6A3ZtHB0WDAyVIIr6Mq3/vlukAhe9u4cL8Wi7wSO5KtczajzBjBOUg24X8FYcpcT1t9XmzH2crsnaQdlKLVujwxgP76nd6PbuvXdINAeGwTOVL9HPfMOByTP0U7yzbNv6o4nsjX45OV3sPlrkScvlYSlQEAlbzZayYRaEWmpOX7bLOuBO3+skjJ9zCU5yQbwTBT9AHw6uwDScgrX+3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199018)(966005)(478600001)(66556008)(66476007)(66946007)(4744005)(4326008)(6636002)(316002)(54906003)(7416002)(37006003)(5660300002)(82960400001)(41300700001)(6666004)(26005)(6512007)(6862004)(6506007)(8936002)(53546011)(8676002)(36756003)(2616005)(186003)(31696002)(6486002)(86362001)(38100700002)(2906002)(31686004)(45980500001)(43740500002)(376185003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU9JbGJoOHVJSXZTd2Q5a1cyaFNHalMzWlpHZTI4YVliTXBNSTNGRVJIZWpk?=
 =?utf-8?B?NjVRV2ZjYXF5R3JXMXZYVkNUSnFaTXFpMTNFTTNvN0hwOUhid1FPTkM2Wllq?=
 =?utf-8?B?d0xqVTBhNGdreUlOa0F6dXJpa05ZQ2JaeDVMM0p4aFJXbHE5N3ZuODhteEZp?=
 =?utf-8?B?UU80dVZJS2Vna2lVTTVSazdXeW9HVUVPQzNGd1hycytNbXB0QjBnYjhQRGNn?=
 =?utf-8?B?SHZ1V1hoa3BLR2tDUDkwZlNwdHZidE1sNHNZSnJzUXBPVnJXNGhaREtTaFg1?=
 =?utf-8?B?QnpQK0pxemZUK05lYWpMZVVvL1ZSZCt5djBrVFpDSk1yN1ltUnVFRG5mSFVK?=
 =?utf-8?B?VDV4L1ZxUDljN3g4VGtsS2t6ZmhuWEpadUU3cWFVZHJsTk0vYlRFaC9rT2pl?=
 =?utf-8?B?YnovS2hYY3gyeTBXVy9IWlZkRUw1TkdvNG5pNjY1MCtOVnpQVTdSUTczejgz?=
 =?utf-8?B?K1J3L3A4ZjRkQ1JDR3JaOXUzREMxTkJURzNnd1NFdnVZR2t6RGg5QkIza2xk?=
 =?utf-8?B?UlB0aWRXT0doRnJTTGtyek1OcWI1Y0VvUjNpOS9tcG1WR2dnVlN6S2k5UXdO?=
 =?utf-8?B?RzNiZkFmTzEwbGFjV3AyVU9lc0hFTUJybS84bHFWL0tZR3BQdk5xUWRzaGlS?=
 =?utf-8?B?dzYzazZJV1BtV053azJmanNiS3NJaWFOdzdZZ1ZXNWtGaFZaRUhGcmRRTzVG?=
 =?utf-8?B?Z3UyakdrekZjWmMwRWRHMmVRd2M0bnd6Z2FRako2Ym5SclNOMldyaHZLT0xO?=
 =?utf-8?B?NkN3OW1ydVVITDdtNzQyRmI3eUVuOEV3ZE5PWU91eG82Tk8wRDMwYm5KNkND?=
 =?utf-8?B?cUlxUXRJeUEzNW9zUzlGa1Y0bXBSNG5maHJ1bXRjT0NFb1JqU0ZvckVXaEVC?=
 =?utf-8?B?ZGtmS3hVVEIrV3hSYUJRYWVnQitDUzM5UWNPaTVUYjJ3Zjd6L1NDMXZ0ejJx?=
 =?utf-8?B?cTl6MWdjaFoxSlV6R2VId3pBQ0tubzJaSDN0bzkrUmdCUkIxdW9xb0xCWG9u?=
 =?utf-8?B?UHBXcTYzYTNKb0d5R1kyZXEyR1EzMHF6blErZVV3WE02L1E3dkwyQlViYkQ5?=
 =?utf-8?B?ZWpCNWR0NDJFdDVXWk5xcjZBTndmWmMyMGRPcXVlcXRXN3M3WnRFanZXY1Rk?=
 =?utf-8?B?akNCaVFOUnJMVVZ1NFlBdGJpTDd5bHM2QSsrNzVwYzN3R3VCMTFNM1owT3JO?=
 =?utf-8?B?YVFvRkhZQmlocENNWlNqSFltMWk3YWYrcHlHTVgvK1RucndWSU1DMFlpa2R1?=
 =?utf-8?B?ODJNb0VUbXhzS05jeDVsSWwrMGJkQkNzWFpWbDI2MnMveVpTSy9vcmc0cmNz?=
 =?utf-8?B?R2c3V3FOMkJGQmtrK1ZieFJ2UzlIbDNPajl4Umw3My9jci9STFJ5OEFscEFZ?=
 =?utf-8?B?ZzVGVVFZRnB5ZmxieDl6QmpOZ3hsZUZCTWlUUjFyU0RnUUFYc25OdVJaYjBw?=
 =?utf-8?B?bGEzRFo1TXFjUUliL2JZMlh0RkRlY2E5SjdLNXBIMlRCbDNkYXJZT0N3Z2VZ?=
 =?utf-8?B?eUZHT0ljcklnd3pPaFdoUW1RdzZTM2xIaTUxNGZoOHpmVU1GWHNtQSttcGNG?=
 =?utf-8?B?cFgwM0dqdkZZVTNyRDczYzNxazFUdGNnMExsaFZQS2tCQWJRU2xacHVSdkxH?=
 =?utf-8?B?dDdEQ24ybTVWVlh6NzFvRFVvWkVpMFBkblYyT2cxYUhyeWNXNE5URUFvMnNY?=
 =?utf-8?B?UTZQdFRyd200eWx6T3UvR2kxdUQ0Zms5S3dJMjhMK3pDVWJBSTg2SDcreC9M?=
 =?utf-8?B?dmk4aGVJUjBRMW8vYzdwN3RIc0dKd2tQd0c3MW9hVFhRZThTOTl1aW1wQXhp?=
 =?utf-8?B?VGNsejVYNWY4RXJWc2xMMjMzWnFKaDU4b09YdTdYWWZoSlh3L3N6MWpPYnph?=
 =?utf-8?B?MXZuSzl3UUt3V1lmWE9OcXk4KzhsTGlqVVlacVdEUUQ5SUFqQld6eFNzc1NY?=
 =?utf-8?B?MWl0WjdZc0xLek5sYkpQdGZONmlSVGZkblg1WjNxYzJ6K1BtNjNrbmlYUDNE?=
 =?utf-8?B?OU1NUGhxMmU1K3psNkhOSDdob2doV0tsZFUvcVJwQ3EwNWFwTmdOUFFKeU9u?=
 =?utf-8?B?SS9oc2NCL2hkdEZiSXZmUjlpcGFkTkFlckx1ZnZ0d0dNQkpMcG1DbkJpSXds?=
 =?utf-8?B?VWNPY0IxSU14S0hMclJYQ0JmbU9LVkxTTE1HdzltQVpOTFl4Rmt0TWl1MTBj?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?SklUY1VPL3FJeHo1REV0T1p1bTU1cTJTcmFGTy9zb0hDSFphY21JWGYvN01O?=
 =?utf-8?B?bFZSaVRKeUh2TXJLRGVWZDhJMytjSmJVTWJNbkpkZU1YZWUzRjE0OFdpWlM1?=
 =?utf-8?B?MFhURFdMOWdXRnhCMVdBdkpNeVdsTERvNmpiRmtaT2MxdHd2S2R5Q20rb1NY?=
 =?utf-8?B?UWF3cUp6M1RKM1Z6TzlHSVRaNXR5bGRpWkRFd0Y2MEhqcW5wdytGdHNBam5X?=
 =?utf-8?B?c1ZldXRpUXNZVEhIRXF3VlpaMDI0RjhRbmcwSWdVVWE4TndlZU9SVy9QRDhI?=
 =?utf-8?B?cC84QmZrdWNKcnpES2p6UkNYbkVSM2puWUVMOCtudDIycldWTm9SN3VhWGl6?=
 =?utf-8?B?TGhUUCtNeGN1dUdUV2IvQ0xneTN6bFNWSVR4MmVsa1BBRVVuT1JMZGpaVHFU?=
 =?utf-8?B?dGdlakhDYlR5REZ2ZFZKaHhHYXdnYS9ha2dCV1E1MEdNUmR5b05uUHg4NWRj?=
 =?utf-8?B?dlN2YWVqa1ZnaHhmVjlvQ2Y0WmErejJHY29QNzRTZ3JFZUs1alRJTE9MdWF3?=
 =?utf-8?B?a3laNGE1QlFHTVZsN2Jhb01yRTUvcm9lcVRxc1JEYVRmM3lYRm9EeGVSNS9Q?=
 =?utf-8?B?S0tBYjFRRHplNkE4RDEybHcvbUo2R1luZmZBUXJDNXdGeHlFeEF6dW01Tzhv?=
 =?utf-8?B?UHpDbVYvQ2pjMWNFSjFGUWE2NFFZbVVEamFjL1V0dHZZZjhxSGQvZmtrMjgv?=
 =?utf-8?B?cUl2NExiMTFNQ2xPbW1XaENad1dSaG5mRVZDZjd5WS90bWhnSE9qdUh3T1RB?=
 =?utf-8?B?SmF5VFNhUFJoRTBUUTRpVEJOUjg3WXM3anh2YlB0MDh6bjYvdkJwQzJDRmpN?=
 =?utf-8?B?bEpxanRYR2VSN0hKMzg0UkQ5d2VVcnozOUhHMDNUMCtHc3JmZEFCSk1wc1No?=
 =?utf-8?B?cjRncHpNaFh5MXF5dktCUG54WFRMQkx2SlFBM255dVFHOXFOWkswVHZseG1P?=
 =?utf-8?B?MEVZeTJ2R2lPOUJqL0NLRUE1dzN5R3pkUVduSjNWSzdtaUV3eVFvalVGeU1t?=
 =?utf-8?B?TXJpNG45ZlpsckphTGVwbFBWd2FPZm94NENpNUlzZjdwaWpRdFlWM1VMSzNE?=
 =?utf-8?B?MlpqTldKQ2twc1I1TVNoS29OMy9iNlN4QTQyUkhSRTJDbDJGenlKRUpCcGpu?=
 =?utf-8?B?RXlWMkZQUHhTamRZWW5ETEhvYzVpSVVROGNGSkZjcWFPNmp6U2xlQVlDRXQz?=
 =?utf-8?B?c3ROcHRmT21FNmNtNkMrck5KbnZ5ZUgwNnhFZzBZcnJtU3VkWG5CbEpKdFBB?=
 =?utf-8?B?eGZ1L1lhV1dyQTRYV2JQZEtzN08wRHRucFNjUVdjVGM2TE8vMzBHVnVYTy96?=
 =?utf-8?Q?WOm5mgtfWO7lgLvOWUhgsJcAniv9z6KqLb?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f15ade6-1edb-4122-b357-08db2c863453
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 16:38:32.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J926h2YKEjkxfL+aUmIMRE70FOoy7MJrCLvzUUKo3OSCoAenKWcRRfoAOeqStw5RoTrHCf/9A8nUjy897tSQatlQh8fvy16xhnKVYvh/Nco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6436

On 24/03/2023 4:37 pm, Anthony PERARD wrote:
> On Wed, Mar 22, 2023 at 08:37:43AM +0000, Andrew Cooper wrote:
>> On 21/03/2023 5:33 pm, Demi Marie Obenour wrote:
>>> Demi Marie Obenour (5):
>>>   Use HTTPS for all xenbits.xen.org Git repos
>>>   Change remaining xenbits.xen.org link to HTTPS
>>>   Build system: Do not try to use broken links
>>>   Build system: Replace git:// and http:// with https://
>>>   Automation and CI: Replace git:// and http:// with https://
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/813510934 from
>> patchew, so I think we're good now on the containers.
>>
>>>  Config.mk                                   | 20 ++++---------
>>>  README                                      |  4 +--
>>>  automation/build/debian/stretch-llvm-8.list |  4 +--
>> Except for this, where I thought we'd already dropped it...
> We dropped llvm-8 on the unstable container, I don't think there's been
> patch for the stretch container.

Yeah, I was just figuring that out.

I'm going to commit Demi's series as is, and fix the container afterwards.

~Andrew

