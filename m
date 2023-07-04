Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2FF7477EB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 19:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558591.872827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjvR-0007oe-3M; Tue, 04 Jul 2023 17:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558591.872827; Tue, 04 Jul 2023 17:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjvQ-0007lj-W0; Tue, 04 Jul 2023 17:34:52 +0000
Received: by outflank-mailman (input) for mailman id 558591;
 Tue, 04 Jul 2023 17:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvOH=CW=citrix.com=prvs=5429f199a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qGjvP-0007ld-Em
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 17:34:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12f0de73-1a91-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 19:34:49 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 13:34:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5041.namprd03.prod.outlook.com (2603:10b6:408:d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Tue, 4 Jul
 2023 17:34:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 17:34:45 +0000
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
X-Inumbo-ID: 12f0de73-1a91-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688492089;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u4qgwxa2HSWQ0Voqd+25mTXU+RkPx4kBj3JVpHJvbhw=;
  b=GOfhfA8unFC1RVCQdLqJ/p8LDNov4SCeblwy8Gx3NvD1cm0m88LAPeM4
   oG3c7ybDQDNQ2SIYJWjdfJZKWWC73fYdkYxEzZRUT4dh8EgqVDBDbnNUo
   m2JjKvdRAHBpkRaGsG36MmiDCyeNaDBJ9aQ4KL02ed/ndCBuTru/GgkZ+
   4=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 114445133
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7q2HAahxLMgyuWn3qWXI1tzWX161mBEKZh0ujC45NGQN5FlHY01je
 htvWWmEPqqDNzTyfNx+YN+xoU1SvpfVz4U1SwVp+XoyHnsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4weCzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRbbyoSME2+utmQybOEVqoxisQ8BZHSadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGya7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTkqqI32QbIroAVIDMYSUeE+8mTtlSjZskAe
 1wM1XcFlrdnoSRHSfG4BXVUukWssRMbQdVdVeEn7gWE0oLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9IWELaiAFSg8Ey8L+u4x1hRXKJv5hGqOoitz+GRnr3
 iuH6iM5gt07j9MP1qi91UDKhXSrvJehZhUu+gzdU2ah7wV4TI2ofYql7R7c9/koBJmdZkmMu
 j4Dgcf20QwVJZSElSjISuNdGrisvqyBKGeF3gUpGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:WgYICqkdaHsN1DSzdQRUxVF4sb7pDfKD3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBED4ewK4yXcW2+ks1MaZPTUO41HYSL2KhLGKq1eMJ8SZzJ8+6U
 4KSdkcNDSfNykHse/KpCGzH9MkzJ2s+KSwjefRyDNMQGhRGsZdxjY8IgyWF0h7ACNbH4c+EJ
 aGoupLzgDQAEg/X4CSDHUBWuSGg9HQjprpbVonCnccmXGzpALtwLT3Fh2Vmi0TVD5Oxrlny2
 TfjADjooWv2svLsSP05iv65ZhSndek8MdJHsaWisMYMXHNh2+TFeJccozHkDcpoPy+rHYG+e
 O83CvI5v4DkU85qFvF3CfQ5w==
X-Talos-CUID: 9a23:b7EaXWHTFtdc9sdHqmIks1QLRJ0YT0b7xXbvPwzlBWZ2YeWsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AbY5tPwxoNvNKaAVUw/IehyYXHZyaqIqgFFwyy6U?=
 =?us-ascii?q?sh9OZCDcvayeFo2mceZByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,181,1684814400"; 
   d="scan'208";a="114445133"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsvUS0JPFzQ/OvkSsj0b56AfmVp05fpFsxPy/Z9tM90WVQjOBW18ygGOM/C42D0eFRNIZ5vaLPEH4usgtDt8Z59o9V5HwqH3it8z6WgJRxnCjFEsxOMqEgFhKqUXowV4okir1kB1su+xVEP2Drf4Z25lF3aAGzxh7q+FYR3sJQdV+pVS5nS94E9vJg/ZgavgpVQXoMA8PBL1PRJbVqtYt1jU4ifLpBqkH4euRWeG8zPBBFUm580wFDorAMzDqBav7Jjg9XfA2dKNjU+YMarqT+B2OjDfZlrgUUmaak4BoF3TYUV/jIVXUl4Jck6w8ls7+o9e9/Y3wjuVTwVcvyg11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewONuJ2//BWQUIeHAtHVinAG9ujjLQ7OFAniG1+xqgU=;
 b=g0Nw46L+ikvldbCX1efqKucQ/hYGYFFw5sPAwtBZwrUSIzUY+raVREj7jnqt7k9MtOXRbUkOQPVPtCf8yNkZrglmpITeWPcbMfwdvfMrEwncVwPE5vCrqymelOw8c1A+Qfd2HeAmGTErZFEEbbPVTQoHcicdlauNBJas4qpe96UOuwrtT4E9IaMO45R7PwP0KT+WTIDRwvLGmFEG25xqcMODg4tP7tKcAirwJroxgoj4nyA15vCAhyfyL2yIp9PLLHqooF7FxfdeM7XVafs2XbemfPDS9ezGxocZ4y3K+wRWe+ZcQUwsVMeZcaT5Xik5pmP7PlMf4r0VlyyIHDOTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewONuJ2//BWQUIeHAtHVinAG9ujjLQ7OFAniG1+xqgU=;
 b=o5VfdNuDkxWT7pyXH4EqNJvUVqhVXfAEhJDyWb6L5PXGL9PI9ymV+4wLWGhG15pYupmBjG7jh89XkGjtF6N9oB5xNRj4MZ2es1O6TVMVyY1CYC/2nJ/XImDw0xWcTROPUzYYn8UdXr1qqkuwUTXz4TUhmX3hjCIGD1xaZEW2/9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b046ddf8-d70b-e2db-f996-32e6a7164cd8@citrix.com>
Date: Tue, 4 Jul 2023 18:34:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230630113756.672607-1-george.dunlap@cloud.com>
In-Reply-To: <20230630113756.672607-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: b0331d0b-b7bf-42cb-fdb1-08db7cb4f4db
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvNtdYhn/pG6w4Wuvpr6HgqgJmTPPV+mZPFPcS/QE74rsrBbm7+zFCDMfqYsqq7q1b4k6l3itagVCEIvhourd/VEbnY57ExtpmT/0bIIlrIrVyVfnFLTpKHxxUj/7albZaTsxw/6pOjSnL3/bN95X5P4YU6u3q3Vc+ynWoMsTTqT3eRKTMGa3whDPEYIZB62UqFUcIlIEdFmq22LGpx5FdLvYcBar71GMZ4TZPsvbYq+VVFXyDiuqlgUpDHP0SejU8KKtsvr3RZs3X+SiruwtIUOwqJItMITH8Vnasg24YqH5ChP0HNCok5fOh+kn5vjuf5XOzlnc5m2fJdwcybRcJ1pphA0gJEub7iSaIxZ0dDrxj2K/G1ADUZl+vxOkm5PhTuE7OJ5xIytrhogU5riiAS26Lke/7gmsfNsWRgSMFyhkjswN6nb5P3s568OB+bL9BJQHCGdOG9uinlAkUMXe5oREP6ACjywRTdh7lpMSoWbFypVGDof0JaL3uGf43Z4Nb3ta+ghaztrzh6lX6oMlUefmBTrZJM7clfLu+OULaJ3g1d5yLHHhiL7/tNUq6ACtEoRZPOqluugDRMSB/ozoEFqqx2payG8FHd1b67fIU9WP0cCKFIGe8nww5DTb+aXcI+GHseGFkdyBa83i051tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(41300700001)(8936002)(31686004)(8676002)(54906003)(36756003)(6486002)(316002)(5660300002)(2906002)(4326008)(66476007)(66556008)(6666004)(6512007)(478600001)(82960400001)(38100700002)(186003)(86362001)(31696002)(66946007)(2616005)(83380400001)(53546011)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjgzUDV3ZHZsTEQwMnJCVGJrWUZiUVFxcDAwZnh1S1NqNS9KQndYS1RQY2l4?=
 =?utf-8?B?VC9qdDRRZVlWb090SzM1V2lZOFNVZTdZNG9lTGduRkJ4RTZOb0F3RDNSeWg4?=
 =?utf-8?B?dXJ2Mzlwa01zU2YwZlBLSmw0RzBCZmtjS3BmbjRmNGtxSE4zNkV6UVltUzl1?=
 =?utf-8?B?clZKL0tJZHgzU3ZOMUIvSUs2c3hVWUcxRGNGL1J2cHZoK1ZQNENmS29vdUJv?=
 =?utf-8?B?TTZLNDRScFhDUkNaazZkdkdxTSt2YVUxZUppSDF0YUh4QWRWTEJyWlJUTFNW?=
 =?utf-8?B?NmxzbXh1VVBneFN6M3BKWmJhVWFNTDNQSWZhampNMDZDWGFPQm5vTGhQZDZN?=
 =?utf-8?B?RlRKeE1Mc01OQXBkM1BPSStkWkphVTNKenM2Tmxjd1VuczNNU3hLR0JuU2s5?=
 =?utf-8?B?NVNHVk8vdzhneUxESTFFM1BoS0FsUkJHcXNYNFI3TE5KbVY0SFpQanVrb0Ur?=
 =?utf-8?B?QVBoNlkwT1pYaVFDR1d3TytzcjJMdmJ1T1VpU1pIQTYxUW1zM2lYWmV6Rmpm?=
 =?utf-8?B?VDc4Vm95TFcxN24zUGNOaGs4bUMrOFB0eFM0ZXNtSENnMXRnd01kRWc0V1Fr?=
 =?utf-8?B?ajNvdnl4RlQ4THJPUzRKOHdSUGtRU3FWQVVhUFBnM1RuOHNUUys3ZVF6N0xG?=
 =?utf-8?B?MDBMT25wbHU1RmgyaGpTWUpHY0lvdmNVcjVlZDU4cVVNMWJwWHNKaXVZTERt?=
 =?utf-8?B?Rkx6ZG9OTzBrZ3NDSTlkbnpxSG9TM3JjUUlWUklIMDhCR2V3eUFwUG14bDRw?=
 =?utf-8?B?b3hzQTVMTjF3SFBSaENuOUM1ZDlvdWFVVzQwQmlNYk5ScGwvQ3dXcGg1M2E4?=
 =?utf-8?B?UGlGaGg1bzBNUTNhRFpRTWVNb2w4a2k2emVpRWlPWUZoSjFxZGhCY1F4NVZK?=
 =?utf-8?B?dEVrdklxN29DRkFKdmtGWkc1NnprMzZic1BESUpoUzZneXhsUHlDSkc3RjA1?=
 =?utf-8?B?QVVmUUJyTzNJbkZETVNtOVptS0dJZnQ0cEh2d1Vnc0hNSFM3Rmx0TlhYVHNj?=
 =?utf-8?B?QlM4WlhXV3UwN3Qrd24zTzN1U25hczRjUzVpWklPSE5Ka1ArMGp2UGpma09C?=
 =?utf-8?B?RHNCcFVYTkdpaEtleGg3bi9VTWNNSDRSSm0yT3JTQldxeUlYdk43YnVFMnBu?=
 =?utf-8?B?K09QcExCTTZaenN0bVNPTDJiYStTL3pKbTF1UmZvYWd4N2VjRmV4YUVxY2or?=
 =?utf-8?B?eFR2aWlzZy9CNWpPT0F0c3N3MDNFYTFTZTFFaUw1YWZGNFIwOUJSL3k5NW1z?=
 =?utf-8?B?eXY1Uzg4dDFBNEFmT2lVcjdmekxONk9WTWNmSlB4QzNqaXNzQTQ5NXdHeXVx?=
 =?utf-8?B?d2I5dXJreDR3M3FmVTJvcElyTlQ1VHRRd3dPQkV6WXNxSWh2cU1laFoyL1NE?=
 =?utf-8?B?b2k0WW8zZ3pLM1J4UVBTWFBWekNidkN6Vm12MHg3Wk1lWlJ0Z1VqU2k5eHE0?=
 =?utf-8?B?MzdBZmsyU2tCaFB4K3dYQi8xTSttRWtJbDAwUmU0MXZEVmQ0dit2MGRGSGM3?=
 =?utf-8?B?eHBHYThrK2RtdERPaHRJbkZlU2twNVJvWmRxK3l6Q0hFWXI3enVnaENMZW1H?=
 =?utf-8?B?N1hpMXZGazc3U2FwemFnaHZMamo5QVcwME5LWTQ4dzE2SWZteUdlQzdYcEMr?=
 =?utf-8?B?YitVZkdZZmtIMHNZQ0E0bE5rNy9ZS3FkM2NSVmRyRWZDM0NyYU1pbTgrczhV?=
 =?utf-8?B?R3FnWDR2cW9TdU5OQ3RsN1RyQ0VUajFsTUc0K0RxbS9VTFRVZUFRWjYrTUti?=
 =?utf-8?B?TWdBUnQwK1pXYUFad3lhcDZHdXkwd0x1NTN1RldRRzdxY1RWV3RPK0phdWdj?=
 =?utf-8?B?SzgzWjJXbUdPL25WOWtPTWE5ZUFDUFgrZHA5QzB2VzFVbWJEczB6RjVHbGF2?=
 =?utf-8?B?cWRxeVlzdDdBWlpTbGM1QVh4dEZicndQYU55aDF3RDZhTU52ZFlUWU44Q29D?=
 =?utf-8?B?Z2g3TnFGODV3bHJiK0tHaUtuR2ZsMjBaYTNuK3YxWFZoZlV0VFZYNCtwdXgv?=
 =?utf-8?B?bng3U2kwZ2RaQldCcFUrQ25mazZCMEQvOS9GdWNuditkU0pjVXVEbm13RFk5?=
 =?utf-8?B?WUVKSFR0WUE5NkRZNHBlWCtrN2ZnU04xS004alY4VjZoK2NXZ0wyNzd0UnZl?=
 =?utf-8?B?VVZidGFjc1A2S3R1RVFyeDA2Um4wK1FmNUF2VE9CR1ZEbk1NcUI1c3lSU2xT?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SAeR20lYq0RnIXqzkSAYob8ogL9z6KSZirON0WLNm9qHRQRFUZ9QVTD5/RFlDvk/WX79y36ljU1D0CSsKJcm3vLg3bSE+W8J9ejdlB+5tm15kWPAU++cLUuKLL8Ftab0hBai6ns33oQu2jyx3iZYzV3AWJmcsEHwwkPBt/gZ5bO8gn5227w8TLQTCxsvCk4HGNuPuPyNVTZhb1UwvooV90RmR7cx73oIhIpuBSIwUfxnrCIhEau9n+DmQXWR09/gWzXZYoop+xmifas/nSZ2JoLurkZ3Nx2tt/mh6fP9FwPLDfmd6CQSVuzKnHFRaLHMJGo960hs/gvqZx3QdoE7/22QVTUlfceizYH+QjYwTSu4pwRtk1bnUKmvl5OCPPFHMGW0Kbw9zq36it7xh3l4H34WtjeGGw2ddyC5kciLLg2uOP9GFmJWcPxbHwwlmAM3dh8ntldoirVS8RhIaBI/jhP5DMTN4GR/2pvEawid2OHA3w2OUChI2H+zGu4C0CDnuZiBU6sLTgfr7tHpSq7BK6aCPR5qzavfW3b6dR3yrT1sTQLeU38fk2RQjGHDEsL00GgYmkfSNTu+CMbIUsdpOeS1h3lvEBnpI57I11QUIFrFWWF9GxJByUm+//NvrrULi6Gl4jblcoK0RaWZ8GpzrVW2mUuAWeoHg0UUeb89IpHrFfXd6Thm23ek/vVQhLkUUOjZrlPOhG2Y0qhuKzJA0iAA7GPloVqnIQt9vlOMwqpb/+M9aDUS76kq8jwOAwwhaOgvb9Zyucn+57dc51vYtxXwGZvvZ94yjhe4wyi3OdedibLHgp5HHALdCXor9kkgVy/kZAB+NWtE7enKH1I+Pe3rfK0NIARH1OSeB1SASzm/etzOoZWEejpGXKu9jdUA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0331d0b-b7bf-42cb-fdb1-08db7cb4f4db
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 17:34:44.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8utdcEM1tFUn3nI+Hj19YrwRPiFux7oTQT4ZOyfjCAfgoXO7zHvK9SmVwAdE2fIOcu60+b/oV85kFHQWNxPIl7xx5OV0FyilY1UpKsaM9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5041

On 30/06/2023 12:37 pm, George Dunlap wrote:
> The credit scheduler tries as hard as it can to ensure that it always
> runs scheduling units with positive credit (PRI_TS_UNDER) before
> running those with negative credit (PRI_TS_OVER).  If the next
> runnable scheduling unit is of priority OVER, it will always run the
> load balancer, which will scour the system looking for another
> scheduling unit of the UNDER priority.
>
> Unfortunately, as the number of cores on a system has grown, the cost
> of the work-stealing algorithm has dramatically increased; a recent
> trace on a system with 128 cores showed this taking over 50
> microseconds.
>
> Add a parameter, load_balance_ratelimit, to limit the frequency of
> load balance operations on a given pcpu.  Default this to 1
> millisecond.
>
> Invert the load balancing conditional to make it more clear, and line
> up more closely with the comment above it.
>
> Overall it might be cleaner to have the last_load_balance checking
> happen inside csched_load_balance(), but that would require either
> passing both now and spc into the function, or looking them up again;
> both of which seemed to be worse than simply checking and setting the
> values before calling it.
>
> Without this patch, on a system with a vcpu:pcpu ratio of 2:1, running
> Windows guests (which will end up calling YIELD during spinlock
> contention), this patch increased performance significantly.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> CC: Dario Faggioli <dfaggioli@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> ---
>  docs/misc/xen-command-line.pandoc |  6 +++++
>  xen/common/sched/credit.c         | 40 ++++++++++++++++++++++++++-----
>  xen/include/public/sysctl.h       |  6 +++++

Given this filelist, why the sysctl change?

There's no logic to drive this parameter in the xc/libxl param get/set.

The only two in-tree users I can see are xenpm, along with an
unconditional print to stderr saying it's deprecated and to use xl, and xl.

> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 4060ebdc5d..369557020f 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1856,6 +1856,12 @@ By default, Xen will use the INVPCID instruction for TLB management if
>  it is available.  This option can be used to cause Xen to fall back to
>  older mechanisms, which are generally slower.
>  
> +### load-balance-ratelimit
> +> `= <integer>`
> +
> +The minimum interval between load balancing events on a given pcpu.
> +At the moment only credit honors this parameter.

So this is intended to be a global scheduler parameter?

> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index f2cd3d9da3..b8bdfd5f6a 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -1267,7 +1272,8 @@ csched_sys_cntl(const struct scheduler *ops,
>                   && (params->ratelimit_us > XEN_SYSCTL_SCHED_RATELIMIT_MAX
>                       || params->ratelimit_us < XEN_SYSCTL_SCHED_RATELIMIT_MIN))
>               || MICROSECS(params->ratelimit_us) > MILLISECS(params->tslice_ms)
> -             || params->vcpu_migr_delay_us > XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US )
> +             || params->vcpu_migr_delay_us > XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US
> +             || params->load_balance_ratelimit_us > XEN_SYSCTL_CSCHED_LB_RATE_MAX_US)

Style (give or take this hunk being with some logic to drive the new
sysctl).

> @@ -1963,10 +1979,12 @@ static void cf_check csched_schedule(
>           * urgent work... If not, csched_load_balance() will return snext, but
>           * already removed from the runq.
>           */
> -        if ( snext->pri > CSCHED_PRI_TS_OVER )
> -            __runq_remove(snext);
> -        else
> +        if ( snext->pri <= CSCHED_PRI_TS_OVER
> +             && now - spc->last_load_balance > prv->load_balance_ratelimit) {
> +            spc->last_load_balance = now;
>              snext = csched_load_balance(prv, sched_cpu, snext, &migrated);
> +        } else
> +            __runq_remove(snext);

Style.

~Andrew

