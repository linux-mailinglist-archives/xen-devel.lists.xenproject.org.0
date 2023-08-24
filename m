Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E4786D58
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 13:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589962.922043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ872-0006mA-4r; Thu, 24 Aug 2023 11:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589962.922043; Thu, 24 Aug 2023 11:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ872-0006j6-0k; Thu, 24 Aug 2023 11:02:52 +0000
Received: by outflank-mailman (input) for mailman id 589962;
 Thu, 24 Aug 2023 11:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+mH=EJ=citrix.com=prvs=593bb07b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qZ870-0006j0-FV
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 11:02:50 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1fe509c-426d-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 13:02:48 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2023 07:02:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6967.namprd03.prod.outlook.com (2603:10b6:303:1a6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 11:02:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 11:02:31 +0000
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
X-Inumbo-ID: c1fe509c-426d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692874968;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P/2AkuRE9cfYesEq2StOKC9TQCCHfa2YSQFW7aDoc2s=;
  b=fEQTV24UKamEHcPUNQrNiMllXEUlI2Q2tXQXD76mw9PWYw54K0BndkxH
   doR8prtXK+31rVYnND7WMZVZ72TYPF2Ow0RxJBNfDsALFqn1QWXlWIKpR
   X2qmTD/iy9+5JMfO+UXC+4SMeiC9C4XjK14nfBjHTJWnMAGCC2hDet0oY
   8=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 119772062
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jduU/Ks2WACEaEYvwrNb19OQUOfnVGBfMUV32f8akzHdYApBsoF/q
 tZmKTrUMvjZYDT2Ko9zb9vn8khS78CHzIQ1QFNs+CA3FykR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+EzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCy40QhmNou2M8quqR+pPm9sPfMXTM9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xbbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTpqaEw2APJroAVIDYqdkTl+tqosXavGPZyF
 0ko8Tguo6dnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQh3
 0WFmN7BDjV1vLqYD3ma89+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXryos1LFae0ipjwBmv2y
 jXT9iwm3e1P0IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:gi8fOqqrqdh7qXg+wBfUgywaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-Talos-CUID: 9a23:ODhrG23dU3nvpHJgtTGY2LxfOd4cXnTT6XjqEVapBGVKVaK5GVOo9/Yx
X-Talos-MUID: 9a23:rQ/HEwjybU7BvNx+IUhjx8MpH/tL/Pr1K1E2qYRFn+S4MBB7KTeTg2Hi
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="119772062"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4kYaIMDImswENCq6faipPkUweA5k5DoHyDuvoZHPQLM/U1GXDOZ4zLgtWUNIFNsPuZwkT9Sw5M4NCtqshrip/NOInJs6I+/dTBq+Y3ZO95Pdons3hTz4Rg7KvWrv6VRDS7/rh/p79YCeVH+aZrGmG1g79HqWmgeblGHcVhdyReyhPxZvAoKU1wMtcNzDnjv4oHflBYOvjzRcXTwCmM1fe3AkSdIpVux9swMJnxYFGuNHwA2VFaPy2OFGJF9UzvV2JtAbG5dzySHcoGUQyPQD8DQfukD1vxzr2xQStC0gWuk6KD7fsAd2QIH3VPGzoPcYCIQQIgM4FGNTvC5IgMwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX/hIreYGsxXtN68ZiAGbsu5dMdperP/Tp6jCd1TKRk=;
 b=Vff2KG6c4n0STqIQpTo7KqjRgmxZ3aS7PHggxhEpWLPXURCQnf8EcdOT9iNebOon76KiMMM8izTs8m2cFYb//h7DtEls6shvSiGbZcy0gKkkFIobVIGyMato+kx2vcuGg4Q+X+mxYI+CT4RMUB8eL4utOOHG9j7lb3WXkyXYsoAZVVEkSyHuu3BLkuYfPdwYEBNzYddmU5sfe1QdcjLvw2OM11c7ECM1Nh2OB8OAJZOVL0DwirGO6qQCeDMaFfc7rC+MhVwZXtLz4WnFFmI8QbjnMbruWbqmiF+1M8FOpUs3u3g+zGPIHvMZw8RHTNSqTO5BEgWsGlqT2dH614J8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX/hIreYGsxXtN68ZiAGbsu5dMdperP/Tp6jCd1TKRk=;
 b=pcLL0Ro1qgui97f8Xyu78v/ytGViT++6ak5Lz9R5BVTlPgSQOkgy307ujiFaJZqDb07SGmThQwA6qDUc38go0aW388mgDsdK0WA6+4j9HiLZ0guGonhf1fsHN0PlTzQ9GPb15tpjRuO4oHLCuPLWkWO8KDlZBCjnFSe1Q1Nuo/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ed0e2fec-41b9-c66a-2b49-b308fd4c09e6@citrix.com>
Date: Thu, 24 Aug 2023 12:02:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] CI: Always move the bisect build log back
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230823152334.8867-1-anthony.perard@citrix.com>
 <59a39677-5959-82cc-804f-4642d2cb2041@citrix.com>
 <f300fec6-9139-4ab9-959e-35397967446d@perard>
 <3d1a3638-603a-b918-596c-03557f139d6e@citrix.com>
 <e244560c-301f-411c-a490-c26364f3ef96@perard>
In-Reply-To: <e244560c-301f-411c-a490-c26364f3ef96@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0672.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 814f57e1-8640-45d7-4ebf-08dba4919ce2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MXdlt57G4R/fXpWW+wneb1CLl0/fdRb3OyBKKekgLO6R+DqcFH03XP2W9unj4dUPCPvBG2YFY9Z1ItVO62VcdpTxsOj4tw/fwhaRX80NeGIIuOmhgATHNQbNp6ryZmRjjR/PPcx1IxxROw0DanBQb//FumqshtPF+KVnKTWRHxSTJzlPiSsINvIG5ds71EMmqk5GndX0jq55B/v/N4Pr4FkW7NI7zLTigbCK8tyCxSn53LNdUGlN4qV3CpS+wAkwxsE/rt9/U0LoSTtgaiPpEuK3IWqFH188PTNxM0NCUX5e2qj/UNbIJRwZ3mDm5aVrCY/nAWnQqa/ktw3vSwlb6E/p+ql2WYUimNyREZffwuM9AF2YhpqAJLwh2Nen36YNH6Js8s4Zh5tCHxvfVki1XKxmAomNRBD8zndRsTXb/8bpBNhE9THL1/sHmmYyPyzIOy1iWLV3so953ZRU7YPPHKmb60WsoenL8YipOHDPy0O7rlFDFuQABVDUD4On3bM+DM+pfl81RrkYqS5u7CHjTSpNW4wq7+u8BHBqGpUAmmybXrwDZBhm9W67aLWbHrlI4qu00MJTBgK5Q60Z7A566enwkCzSx4KNRwZuu/Sic84ByQ5M1bfRw0scRye6aHQaFVHoJ354feFXf3vAit7Qkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(1800799009)(186009)(451199024)(2616005)(4326008)(6862004)(8676002)(8936002)(83380400001)(5660300002)(36756003)(26005)(6666004)(38100700002)(82960400001)(37006003)(66946007)(66556008)(66476007)(54906003)(6636002)(316002)(478600001)(31686004)(41300700001)(2906002)(6512007)(6486002)(53546011)(31696002)(86362001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdESGc5UzdDYnExR1JKWnlyL1BvU0kvM0RhOFAyUmIyS3BzamN2ajkzUTIx?=
 =?utf-8?B?VmdrR0RyaWV5QmVCeFpKS0ZPWHA1eUFTQ3M5cEEyaG8zMHd1c0Y0Mm9pV1FF?=
 =?utf-8?B?MUEwQzBWeG1iM0JIYkJKMEp2L0NXS3dxNC9XTFpYckZ4Y0pmNU8xZXVxSnRl?=
 =?utf-8?B?aVBDQWx4RUViSXBQYUpOOVFVTGJIR0RyRndBNytJV0IrS1RieDlOSGtuRWpq?=
 =?utf-8?B?QkgxK2Ywbk4xdE4yOElXcC90WnhmeHp2aEM1Y01GRElrVnlpNnJiOS9oZnEv?=
 =?utf-8?B?d1c4RFhhaVI4Zjl1NjJkTnB4Q3liNmdEbVE0WmhRRGlYeWFMUzZlOHJFT2VP?=
 =?utf-8?B?OE5jMHZCVDk5QTllNnBNdlJXZ2hSdmNITHp5dlY4cnVHYjJVL1ZOQ0IwanAw?=
 =?utf-8?B?ZEhkMXVjZHVBODV6dWMyd3REWG45OWhHcmNkZjdZOUJGV0lmQ1BjcEpGcjRu?=
 =?utf-8?B?akVoRHc0SFZvcGtvY3hLSWNxR0VhMVk0bHNVeWl6a1NEM3RRUDkrSEc5MHIx?=
 =?utf-8?B?ZnY1YXhOQ3dNaWd0U2tQenl4d1FpU1lSd0grYlVvU2g5OTdNcTV5clFUZFBW?=
 =?utf-8?B?Z21hRTlDNUJwcFdaMFpkZEhPeTAwU0JqZGJwZ1FLUW9vUnZrSmNRWTA4eFdI?=
 =?utf-8?B?bmJhZU04RUVXdWVwU1E5blkzYXgvZFliOHU1OHBFSDZYbFdqYjZTZm1OQzg4?=
 =?utf-8?B?WHNYeFVLbFVVVEdUeWVFeWlBUFBmWWZEd293NVJlcEJyTVFJSGdWK2NxUnhY?=
 =?utf-8?B?dFM4R1oxa0duaWN2NXJZaThWTyttYk85ZGxDN1k0aHlCSG0zcEZGa3hEUStJ?=
 =?utf-8?B?SHBqTjVCYnhyTm4ycVd6TTZrRWVMRXFERUJBQk5JR3RYL0Z3RUJKeWtaRlZl?=
 =?utf-8?B?VzlOdmZGQnpNaXc3NmRsRDB1Sk1GYXg5T20yd1NyMUQ4Rko1UllCRThvbzQ3?=
 =?utf-8?B?a04rSkxsZVlXU2pTQW04dDlJb1pQc25WRm1yL2NWdFhYQ05BYmhDWWNNVUYz?=
 =?utf-8?B?OUZYZ05XTWREQ2RGUVlRM2l0V0F3bFZTZFVPNnB2L0VDb3V5NEl2TzNMZnRl?=
 =?utf-8?B?WXdoWlh3RHFVek1Hd1VnbzExWi92UmFydjBySVV5eUdkR3hTUERlbzc3aVNx?=
 =?utf-8?B?SmliSkh1bkNGYTNVVHF1TTd3WFB3SERVeGR0b0pxcG4rbGt4cmdzSS94TlZJ?=
 =?utf-8?B?SUZKbUtVTk5RcDlFLzEwQlVuQ3c1ZWdYaDJreWJQWDRDdHpKb0pSbHFJbWZI?=
 =?utf-8?B?cWpJREVtbEJPK2RlaXZ0cFMwWHZlaGxhcWRLQmFXdTRmZmljcXQzSVo3LzF5?=
 =?utf-8?B?enQ1YkptNVQ3bzJxalMxaHN4dlJISjJoTCs0dk1KWkJZZmFueWh4WnBsMm4x?=
 =?utf-8?B?WllNMk1TMzVLYlFYOElVRStMZVFTVDZ5ZlVxTW8wS2Y4RTQ2ODI4WWlPTGFU?=
 =?utf-8?B?SzhjdTRDVWM4Ri9FeXpQaG53MGZJcEdVZ3JkM2ZHMlhZTHZHMlgxSjJad0wx?=
 =?utf-8?B?MTRBMjlzbUNvK2hVSFFONnltQlVwcDJNMGE2WlFhb090VFM1TWVNeVcrV3Fi?=
 =?utf-8?B?RXlTa0M1TDdwUlpYTml3clk3Kys4K09CNk1NV0MvRVhObmR4eXowS3NydnRF?=
 =?utf-8?B?QzVFVnhhYll4alJEenVaS2xUdVppb2JLYUc0U2tUMlhOT0diSEM0d0Y5dWVx?=
 =?utf-8?B?MHVOZHhWbS9IcW9LdjdmelpacHo3WklQYkczcVN3Y251OFBuWUVBWTN2TGg2?=
 =?utf-8?B?bmdGamk1KzByMTlYTmJYYkNEWTlUbi83QkRURm15VGRQS0UyUHFVcllOY3Zu?=
 =?utf-8?B?V2V6c2d2c1BhTStZdjNKdkFtYnU0ME5jN0NLdWJjOU1kdEd3eE9uODRyUG5r?=
 =?utf-8?B?RExVSDZzOWduVVEwbWlDQ3N1eXlLUUNxWC9LSDZqUzVBVUVUc1Z3UnpOd0lX?=
 =?utf-8?B?K0Vrc0pscmhCOWhIV1NsNzFzNC9ZZDZiTUQ2QVBROWZsK3h2Q2hvVXlBZ2lQ?=
 =?utf-8?B?QnE5K1UzaU9rM2FtMUNrMkRMTzJEZ1cvTmY4RDI3UUpXYWNncTlZOWFMem50?=
 =?utf-8?B?aTlJa2NDZzhFYzRkVFBKYUxNVmVwblczcmMzUHAxNEtzempFUmoxQzhXK3Ra?=
 =?utf-8?B?WVRSUkdmK0pHTVJhU3h0ZnV3bE04WGdYWjhGQ1h3OUFObEViWDFFVjdIVTBl?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HicnCTwl23s12+Ev+hL9l53j3B1elnGRo3WxuKZ5MCtPIHS3zFBOowz6DeLqXbu0GhE/QhhdYTxw3DpGu7EYUBRG4fA6JSU5n55KuDBrGawEDh2wZyzIU6nff+tYUVqv0Vjm1usE+qgQ2pFqDds6dAunXdC84gjr7ukJACWqf1/Nn6sy6pKhajV+9zGd5TmvXkpLebURSMx+c7hv5rWCTj4Awpv/zcsUsE1MJ6Z8lzTfHN8YgcJfTZD1yyYcKPDSgWViraqM3LJCg/rNsdaMuIFCNZUOhiuWf+FXNdAuhw1KahOdS2iZi6OMdNomroYk6SPWvMLtl/S63BwGMSTPfhuyPUzhp1rzRPF66NFCWk31aEl2KuAc90UYQcJmkno8+5na1FBXIgdOLQPpvTki7JIT8XcTk4jdloXbWcbqIJ6b3qLyy0EqwNs4XJbEEiwvx6s5H/tK1dwp8wW6fkvNPTtewV3ujM7uh331Ambt40+iJUDLlNiE8eoCPo2Glb6O/S6AhHKbo3pDcd/D+P5KX4Kgyzi4A3Zy/pBIJIm+WJf1sWTPAvv67KaSJpGC42l+SXRhlvzNJi9V6vNowQv+dRtqZFw2BYZKty7lQ88Qt97+JDh9zyHQOjuQKbPA+AVrlhw4SJp6HbzfJOV73OIB8WkA82kZ2GoS+ewR1S30Xtf4r/tJhFPDpodgIBeytf56RlRKkC1S488PpKssDFS32jMgJKUhzXaCwpQPKQgHwaFDwbSrkwrL9oN+PSJcYAsz1PURYJgNqoZBsAWQtf6mke3TevQcbimKYjY6FK5qDrpAqUySEpBAssvcGyj3eYYHOWQe8cr2ICSsVEhgYsSrZg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814f57e1-8640-45d7-4ebf-08dba4919ce2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 11:02:31.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: On6x1JzAPhWk674KmpwLq3Je+KYTGnnTGdKb7zDa8G2NoVFx8lUH0R8GOAJvXduXSQiwyzqYfn0s3E9hy5xl9o4jRwH3PKB/Qz9T1VAsTuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6967

On 24/08/2023 11:48 am, Anthony PERARD wrote:
> On Thu, Aug 24, 2023 at 10:51:20AM +0100, Andrew Cooper wrote:
>> On 24/08/2023 9:52 am, Anthony PERARD wrote:
>>> On Wed, Aug 23, 2023 at 07:05:56PM +0100, Andrew Cooper wrote:
>>>> On 23/08/2023 4:23 pm, Anthony PERARD wrote:
>>>>> On failure of "build"-each-commit script, the next command that move
>>>>> the log back into the build directory isn't executed. Fix that by
>>>>> using "after_script" which is always executed even if the main
>>>>> "script" fails. (We would still miss the log when the jobs times out.)
>>>>>
>>>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>>>> ---
>>>>>  automation/gitlab-ci/test.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>>>> index 810631bc46..5099f2e6b6 100644
>>>>> --- a/automation/gitlab-ci/test.yaml
>>>>> +++ b/automation/gitlab-ci/test.yaml
>>>>> @@ -140,6 +140,7 @@ build-each-commit-gcc:
>>>>>      CC: gcc
>>>>>    script:
>>>>>      - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
>>>>> +  after_script:
>>>>>      - mv ../build-each-commit-gcc.log .
>>>>>    artifacts:
>>>>>      paths:
>>>> Thanks for looking into this, and yeah that is dumb, but why play games
>>>> with the parent directory?
>>> `git clean -ffdx` has the tendency to remove everything that's not
>>> committed, that's why. But maybe we can teach ./build-each-commit.sh to
>>> ignore that logfile.
>> Oh, right.  Yeah, lets not lose the log file like that.
>>
>> I'd say that teaching `git clean` to leave the file interacted and not
>> copying it is going to be a more robust option.
> Yep, just tried that. But "Tree is dirty, aborted" :'(
>
> ./build-test.sh refuses to run if there's something in the git worktree.
>
> This test is going to need more rework to be useful in the gitlab-ci.

Urgh fine.  Lets just go with your fix in the short term.  It's
definitely better than nothing.

~Andrew

