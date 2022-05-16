Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93938528734
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 16:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329932.553225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbpP-0007Ng-1Q; Mon, 16 May 2022 14:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329932.553225; Mon, 16 May 2022 14:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbpO-0007Kd-Tr; Mon, 16 May 2022 14:36:06 +0000
Received: by outflank-mailman (input) for mailman id 329932;
 Mon, 16 May 2022 14:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1taX=VY=citrix.com=prvs=128915162=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqbpN-0007KV-9P
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 14:36:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 823f94a1-d525-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 16:36:03 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 10:36:00 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3276.namprd03.prod.outlook.com (2603:10b6:4:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 16 May
 2022 14:35:55 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 14:35:55 +0000
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
X-Inumbo-ID: 823f94a1-d525-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652711763;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VelAr16gQkdS2h7+lXd/Jx3r+OjUQ+LTIR0LUrSWmnY=;
  b=TTZa4nzkDdbbluqtMVF/pLMrXIbq/rCBmDqbFWqzgBdhmsIUZt0fuqTf
   2zWgoWAL8d7QyA/NVQyvMlx1yG2M5xL55GdekUhbff6+YM/WymR/RfNEq
   398PR7xLYAhQ2c2G9uXKt+hlMopCTZGra5JJri9UpWOIofC/9EZGdYOen
   w=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 71416133
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tKzvF6qUxJwwKNuZinketUPhH1xeBmJsZBIvgKrLsJaIsI4StFCzt
 garIBnQP67fYGDyKo91ao/n8kJUuZLXy4A3GlA5+So3QywW9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 I2q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHpDXt+48SgtiNzxYYvZh2qebPHOmiJnGp6HGWyOEL/RGKmgTZNRd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp2Z0m8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK/PZuvTGIl2Sd1pDwasfRfIe3SPlK3WeAt
 3Li4GrCCEwzYYn3JT2ttyjEavX0tTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiGGAlg4RXZxXCeJS1e2W4q/d4gLcDG5USDdEMYUirJVvGmFs0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poad9e3Yq
 9xSkBUDug==
IronPort-HdrOrdr: A9a23:RmSecq/fpsK+7Yi9quhuk+AoI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HIoB1/73XJYVkqN03I9ervBEDEewK+yXcX2/h0AV7BZmnbUQKTRekP0WKh+UyDJ8SXzIVgPM
 xbAs1D4bPLbGSTjazBkXWF+9RL+qj5zEh/792usUuETmtRGtBdBx8SMHf8LqXvLjM2f6bQEv
 Cnl7N6jgvlQ1s7ROKhCEIIWuDSzue76a4PMXY9dmYaABDlt0LS1ILH
X-IronPort-AV: E=Sophos;i="5.91,230,1647316800"; 
   d="scan'208";a="71416133"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3dsy33Fp1G96kQyxL68JdnIDyFnvnkg0W7uIieKplZg83x9wtyGs4PK3MqOMzBfPUoIO9W/tVRQHFFU+HSaP34lvqdfWTOn1vU7fwzgtK5XnYhj4AClhoXr06/8JvscrXptw4ChvC5BJPvG2B99b0t/avK+iaPfeRuux3zjpEL8EeciYF6s/CE40399EVrUknTE/LHa/bt+62uPyXnChwmHO/8yPKilUNPerm1xPa2Nczq9plUro3LhNl5bObFxvmw2HKJSQiW+iqazvBXg/1TbsUPW3GpAG57MBHgqIuSfbjvJvuKjpZqQ9N7kDWl/98QRaGrDDV+Wo78OxrqJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYwSixQBsJZHpMQPn0fIJRbLojA7zqoX+KlqNPLdMAc=;
 b=cPlqcVRkLlWRnqsInv+eyqW9veegDUiFpLEVH5BGk0OMyfshNsIBeTrOMMx3zNrh1lovv4iaLumv41AVS6KSA78ff3H37kMQTJdoMybpfl4M0nUGGLvHjcXidVW2v0ybJUvydlpnHuuUIFqeTPRJ10xbWYq1+C11ZVOMqDtWJMQ1n5RosZh/yS8u31LrZx6fVeusUA5FwQOrCaBKyY0p3iECfJg3H2f508kHDCA87pX468ls5XpXliyjuwmqWMMG5uPWrnlfKRGrjA8C3Yd5hxlJ1G0ukWkOb/0NsFVrCKV7sjettX12COUKDT59Q+ld9iW4h3u0nxxIEx5nd2uduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYwSixQBsJZHpMQPn0fIJRbLojA7zqoX+KlqNPLdMAc=;
 b=vPtbJtrC2pIUf+DPFCFrhQxs+E2lL63sHeAnAkhJDdKKBl4Lu53h6l8vcbAQvn481DtoYbXNGiJBujcdXt6++ifovOYn2xqzBQrqLrFz00wYvPaEBhfcC6FSuETk3w83qx0wvJVoRqERbYyBnnISOGA1KyzWArEHPV1Q1r+jR5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 May 2022 16:35:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/setup: delay setting SYS_STATE_smp_boot
Message-ID: <YoJhR/cehrHan/I6@Air-de-Roger>
References: <20220516111203.26463-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220516111203.26463-1-roger.pau@citrix.com>
X-ClientProxiedBy: LO4P123CA0114.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d9a54a-4932-47d7-7d11-08da37496254
X-MS-TrafficTypeDiagnostic: DM5PR03MB3276:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB3276E2C47B7839AF17106C218FCF9@DM5PR03MB3276.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k/2xpPMZDyk41PlErEX2/s5vASeUyeu4E5NI3r4ZiLzYsCFYZcjI8fTRsJ7PUKuljbdyP0nDirUyIypt6pjuYjSiDmJCBUAv+UbcAcXzlJhwq6QagGQs7xL76ETf+loekD5few2CIGYzIBsQRABeTFv0yFM35LgoKiDmXdVeBizjWCSnXxkELgbh+RQtijDoceqJteJaHJFlq/3ospNAm8h4NB7fw/LnZK67TZEHJLahHXRT83RQt7edp8k4xxsOSjFyabFD4vZPX7Va9fUIiSpVC5ZwyNCyG6XOQ19f/IMXxnGPlB+qoIDDUdCvQY0lEGafBNqeOYJ8wuMgugxxgWJcuIO5RJlj2b/Wc5HdnjfTr0fXSozmzqfIA6RIyb8ES6cau5jN7PMyAMyojTHBXNwxTOcwlRGxLBMamqtOCdivEwnwf5hOpBPG/Tt/Hk5HF2gU5ObLpvuWwEG3lqFx+f7tv05z/YXvu8sJG1u1U+jOfnMOULj2HD4Bno58qcGG2LiFhidbOG5gXOnAS4MvyhSVpCixG4NMY0TMsoMXCheZvpo/eth9piSGdVZ046ZS3dURSi4QSIqG813D1q1EFWXxGQUxpLj6eBTYZ7SNBMgTAf6vME4upW3kBRBDAnhT3Qxu93EnB7b1S0KEpT8IxyQ9vZSmM78e9Sdjt+bThaV+Yg98RVlfplL1yP74MtDoHWc1bymtTJMFTG+JMDKqTRrleNs+F7yTTJ9eaH5JQPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(6506007)(6512007)(38100700002)(2906002)(82960400001)(9686003)(33716001)(26005)(66556008)(6862004)(66946007)(6486002)(966005)(508600001)(6666004)(5660300002)(54906003)(8936002)(316002)(6200100001)(186003)(86362001)(66476007)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0lPSkcvVkhBYmVVM0RJbWxBWDhCZU1kdnVMUHN1TFBGRnZKc0NuMVBJcWVt?=
 =?utf-8?B?blJEQ0R5dFlyMmx1ODlLV29RYmlVb1ZBVElWOVlrY1I4Q0crc3BiYUE1RFVH?=
 =?utf-8?B?eE8rQ0hKVWtRR2svZkx3ZVMzSmI5ZlFKbVIxdDRCcEtHbHQ2Q0ZGSVh4cnAv?=
 =?utf-8?B?N2ZDakZlZHpKZ2h2cStKZWdZNVJvUmJmcTlxQjJESzdzbWRQMnBXZzFkVDBw?=
 =?utf-8?B?OVNSS1VLdDJTdVFVNzYxTXNvQXdNbktxZ3IwYTc0Tklqa0tDUDU5aVdFZVE0?=
 =?utf-8?B?dmVYcko3anlSVzFndVJHWVhmMVhKNjJxOEkzL2hnWWRxNHRWUEpXUGdUR1hr?=
 =?utf-8?B?YlNCMHI0eHNZZ1l3T0hBOVZxRmpuSHBVSVZjY3RKQTNvS1FmakwrVzhSUlB6?=
 =?utf-8?B?Q01rQ3JrT1BHTlBlcU1yNDJSOE1wZm52aGNFeEZXb2FFZUh1Mk0rODdMOUVK?=
 =?utf-8?B?L1BFUVZKU05VWmFTQ3Ayd0Z5Zm1QS1BWRmROaWY3eTRLZkU1Y0dOWjRtN240?=
 =?utf-8?B?ZTFhVFlnWHovZ000a0wvb1hZU0JoNnpPTzhNMlNFVW9yd1pLbXJ4WjZSd05o?=
 =?utf-8?B?cUF3by8xclBQL2U1Sk9GaE9BamVwTjRyVTlCOWtkWGxVSWFVcU91TkEwN1ps?=
 =?utf-8?B?RnBka1FnL3JLczI1Q1Z0N2wwSEtzWE1KM0dBS3Z4YWMzWTRtYitlUEM4MTNW?=
 =?utf-8?B?QXRmcXNOWWtUV0l3Yk83elVaWm5OVXBxbVNWKzBPWjlmODAvN0VmQnBLOGpq?=
 =?utf-8?B?UjNmZG1rSVJsWXY1SnJJNmtmcjBTd3dBODd4U09za2lyUnphUTlyZHZIKzR3?=
 =?utf-8?B?SDltU1JmQll3L1M5MDk2ektRMGsyMVZnS21hQWc3YTYzMlhzS0RxWXdQQjZJ?=
 =?utf-8?B?ZVNzakZSQi92N0tpSmh5UjRia2h4K29PcmNQc0k0dkduSnVMYVJHN0l4MExZ?=
 =?utf-8?B?RHdHREQrRjJvaE9zRG1HNHJ2MjRPQnVHYTVwRXhTZVUxRXpmNC9LdzBwTFVZ?=
 =?utf-8?B?WTJJSHMxWUVBWWJFWkpTS0dPcWN1YlN2ZGFBWnAxVE1KaVM5Q0ZWZ0tESmwr?=
 =?utf-8?B?eVkrdFRjakZYTTN5REplU1BkQWdnbWpyTHJGT21oQzF5T2IzdXI5blBCRTNB?=
 =?utf-8?B?RmgyL0xtZUtKeHZqNFk0Qnd6NS9aMnNyQTRyVTVMQ3lCQWl0MmE5K29WVytm?=
 =?utf-8?B?b1o4UkJOYWJqYkFteHhjY1MrcnhocHhJcFdtbjVlcmlDN2lEQ2VnaXNQYVYw?=
 =?utf-8?B?aWpEL0lURHVjeHhLY0hqQWhENDh5N3F4T3VXc2Q0ZGRPUEUyb0NrQXVDVVl4?=
 =?utf-8?B?SVJxUGc4TUhxcHVSVVlZMjhlVlNmamhLRG1paUtJM3ZKSE9TTkVnTnRLMHZW?=
 =?utf-8?B?dWwxT2NZbkJLZU54SjR4RXVkNlFGUUh4NElkaVAxZnljdWkvcEhramMvREtv?=
 =?utf-8?B?Y0p5Y2gxQ0FYTjI3Qi9POXl1Z1laV2tyOG1td0VGdkR4UDN1WGZSRWkvczZk?=
 =?utf-8?B?bWtJNWNjTVhTeTNld2dXS3FuUlphRjlXMkF0VEZxUldlSmVDd2dzMXQzZWNH?=
 =?utf-8?B?eUNzTWN2a0dSSXNUV2I4YnJIUU1HTGNOUkZUTnIzWXhGQnlkbFZVUGR2UjZ3?=
 =?utf-8?B?WWFadndocGhBSHUvbEdNQmRoenV0dWF3cUlqOFFjcFN3Wmo2RWpyVkowdHpk?=
 =?utf-8?B?Rm51dVo0L0NPUkkyN3hrajRwQlhPanY4MWNvNnk4S0JWOUJ2SVU5V2Q1V2FJ?=
 =?utf-8?B?SmEwUXI1VjV5a011ZFBQd2hwMThjenFuNi9BZ3k5S3hieEk4eUYyU2NQYzRD?=
 =?utf-8?B?bzFmdm5LTGlaTlRiY0tIZHB3aGp1RlhMMmp5aGw0Rjd3ay9WYnBldVVCdXpw?=
 =?utf-8?B?WUUzQjF1TW81Y1p6UHZTSDFuWW5vbmNxWWtsdUtPZXZOQXdrbTBiMUJwQjJw?=
 =?utf-8?B?dTZLb1ZGWEFIcnp3KzhZTTl1SWlhbkJxanBqbC9WOURlVUhIeTlpemVGV0du?=
 =?utf-8?B?L21pdTF4eEY0cTdkZWVyODNTTEZjMkVJS2szNUo1RUhHTGRYMWo3ZzVMWGZo?=
 =?utf-8?B?Y2x2SWp5ZlNxTGhVK3N1LzhHTFA3blFrM2VGbjFNUEVKMHpDY0t5czNXRERh?=
 =?utf-8?B?UTdKcjFFdHpZVWxpajRkUkcyRVV0ZExDbE1kcmxsT1pYWUc4T1IvUHVUbXFj?=
 =?utf-8?B?d3lSTE5aYXpiUEJkMTBRdENhYS85NEZQaFBUWlJRNk5pQk0yTnJreDd1ZXo4?=
 =?utf-8?B?WE5lcElVRnhnUTliT3ZuSkhJU1d6SmpiMWFZRmlOc3Fxby9IejlwYlhmTmZG?=
 =?utf-8?B?N2M3L1JaVEhNbHdBODJwa1NYc295TW9ERU5nZ2xGaTNESHVOdHIrcldlVGVC?=
 =?utf-8?Q?GfouBF0dSecSpXYU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d9a54a-4932-47d7-7d11-08da37496254
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 14:35:55.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7VWn2dTdKJuIVNuFj4glrZhrLn6+DSpGPL7wT3HvRwaWTq9XOzmM4wkE078mJjJQ1KyxnVu5jOjNknZHaw6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3276

On Mon, May 16, 2022 at 01:12:03PM +0200, Roger Pau Monne wrote:
> Booting with Shadow Stacks leads to the following assert on a debug
> hypervisor:
> 
> (XEN) [   11.625166] Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> (XEN) [   11.629410] ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
> (XEN) [   11.633679] CPU:    0
> (XEN) [   11.637834] RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
> [...]
> (XEN) [   11.806158] Xen call trace:
> (XEN) [   11.811255]    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
> (XEN) [   11.816459]    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
> (XEN) [   11.821689]    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
> (XEN) [   11.827053]    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
> (XEN) [   11.832416]    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
> (XEN) [   11.837809]    [<ffff82d040203344>] F __high_start+0x94/0xa0
> 
> Fix this by switching to state SYS_STATE_smp_boot after alternatives
> have been applied.

Consider this patch superseded by:

https://lore.kernel.org/xen-devel/20220516143116.28602-1-roger.pau@citrix.com

Thanks, Roger.

