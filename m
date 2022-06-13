Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEFD548294
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 11:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347897.574224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0fzb-0001wg-N4; Mon, 13 Jun 2022 09:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347897.574224; Mon, 13 Jun 2022 09:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0fzb-0001tn-JH; Mon, 13 Jun 2022 09:04:15 +0000
Received: by outflank-mailman (input) for mailman id 347897;
 Mon, 13 Jun 2022 09:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6zz=WU=citrix.com=prvs=156a1e8c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o0fzZ-0001th-TC
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 09:04:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9981a13-eaf7-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 11:04:12 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2022 05:04:09 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6240.namprd03.prod.outlook.com (2603:10b6:a03:3ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 09:04:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 09:04:06 +0000
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
X-Inumbo-ID: c9981a13-eaf7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655111052;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kk9tJ6f6m+yGfPG7jBVYmX/Zf+6fB4ldfa/OCis3ydk=;
  b=f/GTfk7p2TbdEGm5x9RJjSzbWNA4pJlqidgXlRgV56kLUGOGAAOQrmWo
   wOrMAWVlPFz3IHZ74Dxp0zZGI8tuobp3cvGQbwBELA6RvBVX594kKivkT
   IPRTvTRdiYMfGAQZUyQ3VW3qdNRGnXygWr0o8EttOstsfu+fyNm+JHEcW
   w=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 73454490
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8WobJKwE7lY2XerrDSV6t+crxyrEfRIJ4+MujC+fZmUNrF6WrkVRz
 jEYUT+BMqmPamTxctBxPY+/pE4PuMKDzNUxHFBv/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY22ILhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7qGuGTYiD6fwkv0wbhAAPz85MZZH5+qSSZS/mZT7I0zuVVLJmq8rIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeEuOTuoMwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKGEF9A7E/cLb5UDewiFQ6Km0PeHQJMKLZ+AKn0mdl
 0PvqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWR22gSBRs+RVa95/6jhSaWQMlDI
 kYZ/i4vq6ka90GxSNT5GRqirxasoRo0S9dWVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2IB5UlqY/7aQ6D+3Zy4cKDZYYTdeFFRZpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2NNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:3TayZKHv4v4bEPBGpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,296,1647316800"; 
   d="scan'208";a="73454490"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxJIN6Q6nHtVbW24UhkD5ACeuad+VSrbKVNJ+A1pGE574/rrLdpdozQuooMRKM1EPiACvj5pdvM2+DtWxH8icJjsiIVN3DLpjDCWBBw8JxDGWs0Hhc4dtb1EjFdrzBnG7OgM1wmzgKGImaJzmGyYo/7uyeaGVlNv8c1UI/bybaDsfs5arAoxCc6MpYWwgfSXx6J9iKjr+EvxUfl3flgjGLuwUY4pB3ZEHNt9ZzGFGCHcDJBjjvhsQ2wbWAk+6MrUlWfdfkDBaWIyB6jGygUn0OcA+UOjqaXc919FiLeoY6Qe5NLCOEITW76Og36TWbd8VfHix109p3ouAzEp+fe8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aulyOgJ/83gI91Krg7GWsSZGCdYRXUdsEplI7xr1EYI=;
 b=XOjjFup8tQ8+6qMd4JV7Uxb3igf92E0IyB2c+cVZAnLI1rxt3VxaVOgCPCoVp9VRWbhqxCjA2z0VLFp8MQ4Qb+U40qFXB8dh9abbhm+rEKAnvtIajfs22aIyl0RuIMUXM/sIlNqlwTELmAfUeFcTS4FqB2kGgj/MZECfvL/uBbWFQy2aAFxlnsFmJazh9C3sk0Tn7asgIPX9sGSfoTDF9aL+BRKoSrQMv68pSbJfijcrPDI7B9RevpRvDYKe7fC1MvW2/0Cgch63DLQKMdNmiuI0v9kya7k9UczjmI+0fifbJnimCW1/NGs31z4dwEAokX5sElni9p//h0B8gtcCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aulyOgJ/83gI91Krg7GWsSZGCdYRXUdsEplI7xr1EYI=;
 b=e6tO329XXiFy1NNQOs82II2SsLjrANQXN5GQqb0yDfdq2sUFbyQtxkfTCISrSblRsD04c2gDGdS6LQ4gjGEalgOUoy614vS3xegHZu9HGfVH5YNEHR3FgrRpeZESqN0/JsjMQOmi6t1wPeS91tNdmguB7SDLVch7/NVCA/RrmUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Jun 2022 11:04:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <Yqb9gKUMokLAots7@Air-de-Roger>
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
X-ClientProxiedBy: LO4P123CA0543.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ba607a1-4780-4a60-f264-08da4d1baba2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6240:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB6240E02903B8B931B375C3DA8FAB9@SJ0PR03MB6240.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	scMUKQ3+zuCiTweuL+3Y7tHKn3Y1U5XELjwSlcEZdoFGtPVXeOmGb8tnduhxIpWWMh/R+ipogVaw5+CxLqDzRhekO23bXiUDXqpXLY54xZcJaCH/doWxzkn0acDUXLvnSmv8T0+Mp5cR//I/Q3sy5ZqHLOOmXkMipkUne+jc5gKLvVS6z7BTGE8AE/w+9Zn1vSnJjJORUvgE8AM66y6fc12XSu32rJpAA+Tdbwgy/q9cHVJ1ZADOsJs6RcGFescclvY6h89F0109eWjMCJ8w5gPNcpgAqsEeBgAWuj0qPfMoiDuahrYh/LMSM/dS+WY3TLFeKh3RTV2dJakAtTAIj2lovjsUePxtykK06Ebnm5TJLXQvi0pNw5bBBr5R1fdTRO/hg9K8x3oMnmWK3aAv71cbc0ZT6EnjOgHkPNBpfOfMVA0uESPqd/EW1dV73HgwYDrnVw8iVfRJdkuuY141X9c78fWvcIW82lcELWewdc24e1IvSfv1LWETJRu3j2h128lURXCTOSpashE3RCmsC9wk7GpmdnsCHbnyKniW/WIcdMtPikEc4IZd8JmIVxyDnA1329uNRFzDQn8VwbsEMjeOp7hIwVVtBteH0i4DblSPO9GuH6CTIvMog8IGl1EUwWGc/ANLMSpz5/D5D2I0jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(83380400001)(82960400001)(66946007)(8676002)(508600001)(4326008)(66476007)(86362001)(2906002)(33716001)(6916009)(316002)(6486002)(186003)(66556008)(54906003)(53546011)(6506007)(38100700002)(6666004)(26005)(9686003)(85182001)(6512007)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVpXdnlKV3pDRHQrc0lkUlFpN3h1TVBqLytiQVJlNll3ZE9hN3hKdkRGdGl1?=
 =?utf-8?B?VmJDRmxrMlpncklRREJxZm9tQmVHK2VrWGI5TGdaaGo0MmJHci9Zb1FlNFZR?=
 =?utf-8?B?YU9YZmNYdE5uL1RGRkk2RW90ajVRa04rVWdjdTVOeC9VRFdxUklpZDBKQmlJ?=
 =?utf-8?B?MnQ1ak5UZE1nUGNZUXkvbmVaL3JjK1NiN0xLR3dvQUY2TjlZdUY3N3lSdkVJ?=
 =?utf-8?B?bFFjcCtmYXBEemZ2Rzd2S1doMGM5QjhyTFJZandmVnVEbGIvdWcwQ0ZyZkRv?=
 =?utf-8?B?UFYreGUzQ2ZNYU9hWWU5VlVpQTNWMlJPZFo5WEFkQ1NFSmhLVVFYUGlTZ3Ez?=
 =?utf-8?B?Z0dkN2RnWTgzQ3AxbGx4dGQzSFcycUpRV3VKdHd3V2thazZXTjRzblA3cTNJ?=
 =?utf-8?B?MzlEZVFXYWdtRWtUOTBJUHloTlFFSGE0TG9KbmlxOEJmTnZERTB3VE43THpS?=
 =?utf-8?B?eXZ1MjFGTTRQNitoeUMrYWNMSWxBbzVvR3d0S2lKZ3ZVa3Z1MnA2M3UvVzF5?=
 =?utf-8?B?ZTZKcDlUQzEzcnRoeVQ5bWZ4SGNpREovZTVpNStxY2szQkg2cnBPZDJjREkz?=
 =?utf-8?B?V2hiSmRaUVhyV3JPRkVOT2xsQkhadCszNTZTbk56NUZPZVhFSitjRnV6bzM2?=
 =?utf-8?B?Nk80MUxiOW94endrSk5TdVVQTnVHSWw0cjhucFZmS1NjeHNkVm95MG9lZFN3?=
 =?utf-8?B?UXRYNVVNZS9KaVk3SlR1VEVFbnZENmVSODRtTXE5VktBbTh1Um1aenVHYzFR?=
 =?utf-8?B?Wnh4NVBiQmtDUFF4cXVyT3VBT2VQZmhSVU1UUzVMZStCSDhjcmNicDA0TFlV?=
 =?utf-8?B?US85NVpNbEVkQ0FTbS9PTXlTZmRaZ0FEVDJvSEhlcjQ5M1VoZC94UVU1SzJI?=
 =?utf-8?B?TVRhZEhJUVgwZFlZNlQ2TU5sRU9PMFp5OXpueEN3M29Ka0xwWVZPMUtnMnFZ?=
 =?utf-8?B?b1N2azV1VVlWWGUzdTN5dDE4eEJCc2NsWnV1OTVwajlYYlpqanFmSzBkczcv?=
 =?utf-8?B?cHo0cUJDUFdHSWdWaXRldWpNSlpxM3FzMzQrZ25MVXcvVHpDcnVzY04yclk3?=
 =?utf-8?B?QVJtb283bkt0L0hNWVNwRUdYNVlpemlQMTdqMlRMbFYzVXhwa1JZZlVXUUtV?=
 =?utf-8?B?WTd0d214cUl0Z0h5d0RxdDhEeVlDa1YxU2hZbWE3ZUcvTW54REhuMjExS1Zr?=
 =?utf-8?B?UktaU3FISHMyYzg3YmUyK1pXdnRjRUU4cVhaTk1yS1JDVjVzZldkeTdwVGRG?=
 =?utf-8?B?TmdBTnlmeVNLazNZcm5yd09RZmJGV3BBSHYwcFFHdkVKTXhxc1VYczZtRVMz?=
 =?utf-8?B?d2RpV3R5S2lWcEg2ZXZnT2RwbkRnQmFxTHlzb1plQ045bmxmSDU2TkU1TFhh?=
 =?utf-8?B?bUUvdlMvT2FYbitQaGNmY0J4Qjd0Z3FaQitFRmNicm1tWlRNeTZleGsrd2FV?=
 =?utf-8?B?Y3g2K3kvbEhSNDNIeklwdmcvWXdZYkM5S3NKeGtYMnFmRzdZdkhoZEV5eW5V?=
 =?utf-8?B?aHdRalRLbXVUeHh5L2FZVlRYZmQrQld6cTRNSmN1N2l3UzE1ZmRGd2FNeDRS?=
 =?utf-8?B?RTJmTHAvK3ZRZldvVmQ5d0dDeGlOQ0REaS83VWVMcEp1WFQrTk9tQThuMk1h?=
 =?utf-8?B?ZEordFFKTk9wamJHNmxaQ09ZdWF5U0ZkcDkyZVZRQzlTU0RIQ3FCeUE4RlFK?=
 =?utf-8?B?UUNpU2poVWl6dmIwSDc3YjBHQUVGSkpiSnhuVFF6cENxTDdrNm9VTktwZHcy?=
 =?utf-8?B?RVhDOHN4UUk3ZzVmL2s4YmJwN3J2djdhanVBKzZ4MDRWdFZkcC9uT3BMTWRC?=
 =?utf-8?B?M2hrVzg3M2JHVWRkbUZHU1ZORjNGNUtOTDVPcWFIZXZtcktlbDlUdTV6cDlt?=
 =?utf-8?B?cVNyWVN2ay9tdEoxSVhIOHdraHFwZEFpVExGNjdaVTVzNjkwK0RsWS94cnZp?=
 =?utf-8?B?UUlweWRFUVpNVFE3c3dwYTNjSjgrMDFsU29GeW01eTFLRGZ0VDFockdJTENj?=
 =?utf-8?B?bFJZSnZLWmlKM2dsY2NGaVZOS3hyWjYxWkpqWDdWcWJyV3FXNmV5YTdNSUFT?=
 =?utf-8?B?WE5zcG16bmU1UWlIVlk0UjVtM0VFWWZPM0U2WXlRSzgwR1VCK2xFTS9HZCsv?=
 =?utf-8?B?V3dwUjE0TEVRd3FaTWlwWHA0NFc1YTIzbzFDOGlyTVpFRS9nMW12SGFEUWVu?=
 =?utf-8?B?aGg5WWRZekpEWmUyaGVlU0lVU215eDJYZkxZdHFMYTAxdUtpVS8wTk9zMjd1?=
 =?utf-8?B?QS9QK0dFWkp5SnRaUy9vZlVYM3NGeERhUUkvZDMxSmcwOXJXYzFxUzBOaFJz?=
 =?utf-8?B?TlR0Qm5HQUFOalJ4T2tjcjJCTFNnMVF3akVxRjVZU1FXSGpXWnJseEZuRlVa?=
 =?utf-8?Q?+Y+bb6a7MZkezPHs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba607a1-4780-4a60-f264-08da4d1baba2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 09:04:06.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYbs/xY8PpyCh8SOaWMjaVYuCcPkzFsEcIR02UPiqnQKQmSSA4n2Mc6sNNZeJEEjNiYnt+7noyH08OCHEf/Jdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6240

On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> On 13.06.2022 10:21, Roger Pau Monné wrote:
> > On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>> Prevent dropping console output from the hardware domain, since it's
> >>> likely important to have all the output if the boot fails without
> >>> having to resort to sync_console (which also affects the output from
> >>> other guests).
> >>>
> >>> Do so by pairing the console_serial_puts() with
> >>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>
> >> While I can see the goal, why would Dom0 output be (effectively) more
> >> important than Xen's own one (which isn't "forced")? And with this
> >> aiming at boot output only, wouldn't you want to stop the overriding
> >> once boot has completed (of which, if I'm not mistaken, we don't
> >> really have any signal coming from Dom0)? And even during boot I'm
> >> not convinced we'd want to let through everything, but perhaps just
> >> Dom0's kernel messages?
> > 
> > I normally use sync_console on all the boxes I'm doing dev work, so
> > this request is something that come up internally.
> > 
> > Didn't realize Xen output wasn't forced, since we already have rate
> > limiting based on log levels I was assuming that non-ratelimited
> > messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> > triggered) output shouldn't be rate limited either.
> 
> Which would raise the question of why we have log levels for non-guest
> messages.

Hm, maybe I'm confused, but I don't see a direct relation between log
levels and rate limiting.  If I set log level to WARNING I would
expect to not loose _any_ non-guest log messages with level WARNING or
above.  It's still useful to have log levels for non-guest messages,
since user might want to filter out DEBUG non-guest messages for
example.

> >  Also that would give the xenstore domain a way to trigger
> > DoS attacks.
> 
> I guess a Xenstore domain can do so anyway, by simply refusing to
> fulfill its job.

Right, but that's IMO a DoS strictly related to the purpose of the
domain.

Thanks, Roger.

