Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E43B52A33A
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330859.554264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9V-0003GR-Li; Tue, 17 May 2022 13:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330859.554264; Tue, 17 May 2022 13:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9V-0003EV-IW; Tue, 17 May 2022 13:22:17 +0000
Received: by outflank-mailman (input) for mailman id 330859;
 Tue, 17 May 2022 13:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqx9U-0003EP-4r
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:22:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf0d629-d5e4-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:22:14 +0200 (CEST)
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 09:22:04 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2863.namprd03.prod.outlook.com (2603:10b6:300:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 13:22:02 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 13:22:02 +0000
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
X-Inumbo-ID: 5cf0d629-d5e4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652793734;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=lrbKR/eASyOKoQqAK4lVjmym1N/PKpOb0FZaPhSCNN8=;
  b=e5tsgXsj6xRuGpgDsUMRTlsAiTKdU+vHtrzMPoP3o6UMG/7uWy68eWyx
   yJhP2wzYWbj6Wd30sCcZYpDDIc/tmq9uv7q0VHZ4Q7Vh2ru+l5uz6KHNM
   CNCqJuGW0ylO+7yu6NW4uNZvrvox1UQOJxP6YPCDbdv6/d/Jid7elQy/8
   M=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 73990232
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A8tBQq+Juc9VBQYD2Ww/DrUDQn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WEeUWmFPqqMZGH1fN12YNy/pksO7JLQmtdgQQE+/Cg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHmW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ28eAouEIDupMcmcTsHIgI9NvddpoaSdBBTseTLp6HHW13F5q00SXoQZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvqMuYAwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKGwJ8AjO/8Lb5UDRlzdw1/vqL+HEf/fSHc8Op0vEp
 mT/qjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiFO4HdRWK
 EUW+y8nhak06EGvCNL6WnWQo3OavxhaR9tZFcU77h2Azuzf5APxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 Fi3QDMWgrwSiYsQ0fyy+1nC22iovsKRElFz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6zt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:FHl8na1KG4B4vHT81TMkDwqjBR1yeYIsimQD101hICG9Lfb1qy
 n+ppkmPEHP4gr5AEtQ4exoS5PwOk80lKQFqbX5Uo3SODUO1FHIEGgm1/qa/9SCIVy0ygc+79
 YGT0EWMrSZZjcVsS+52njfLz9J+qjDzEnCv5a8854Zd3AOV0gW1XYaNu/0KC1LbTgDKYshD5
 aH/OdGvTCkcXQSYt/TPAhCY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 L4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKvC/VXEO0a2SAWQR4Z
 fxSiQbToVOArTqDyGISC7WqkbdOfAVmjzfIBGj8DneSIfCNUgH4oJ69P9km13img4dleA56o
 hvtljp8Ka/RCmw4BjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklZ6voMRiKnbzPKt
 MeeP00JcwmAW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNAqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaDqAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7NjDlhCy87BrZbQQFO+oQoV4rSdSt0kc7zmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.91,232,1647316800"; 
   d="scan'208";a="73990232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVBxQ85Gj2rvfLA6i8A42jQruUOSiGbEwM/+aHqzxdGnlJD9Zl/ns9qbTizhWHBtBOJ/yWEaaOY6tZkpx0sIRu2wQ1EpLBU8t3aMTaTmItGvoTd1bhobDeWR+CJYFsOjMQRPTcAg+cD2E+7lcZgNNpApbeXPMOKcKpTHJAH3kuM39FY1JbDismpS3r2ivd+f07hCkx8oF9cf0tRH9i88wn5vg7FItCv2Exe/eXnfK9NFM10PQc6l8kFV7o9Jg7DzmzLrcPpQoE8vglN8PdoS+hnOxX2KvLEsJYyYnUm82EptxNkNN/TjatrYeQZ57JSZEJCUMLubMjvRMRTYseTRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aK06sWeBw8v0FMu6ocWdptyMHWl4Fc/+SrQ/l2E6g4=;
 b=d26kdOUaYWFDcC6h7XvccyRkX6w7jea3Ii8lhxf9zvhNwMYIBmCTDrHwc5Lz2wGD1fJalTHGR04LWcNPGwzI9kz6dh0OejKs/227niKjt7UuPh0FjSN5GRwOvswEmDpede6q8z6AJ0coOfs/Jdn6OV3Hc/fgu1wmdtJ1nPwrwd/A0EdiMpWKYrwoW1toCTw0oCNxLI8ZBWTv704UleH0NKDnKWiPuI8SP2SW6Vn5KcNE+M+lSrmSweuaGjt3XsIG1smFn3JvaZCgd5pPYPh17StDcD4Y1GwIwF6reMH6KZWckF4HFcVuBfiK9t5HdLqW1f8VjLJSZKTwf9SQ9xAz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aK06sWeBw8v0FMu6ocWdptyMHWl4Fc/+SrQ/l2E6g4=;
 b=evU7x4wKU/E1pkX3T9H4D1ObUh4P9XAhxIprAUnWWrpxs7S8f3624p64/0F+HfWPxtZAqTclhOgbrLUvEOliYzNNw/5rGErJpYHO6YrZRjOJChVlm//AYJxQVzsTKQ6Jgtn6nuRY1fbDsmc9fM7KNMZ42dlpceD5+xMYs9tow1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] x86/vmx: implement Bus Lock and VM Notify
Date: Tue, 17 May 2022 15:21:28 +0200
Message-Id: <20220517132130.38185-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7489a23b-6ad5-44d3-5608-08da38083aa8
X-MS-TrafficTypeDiagnostic: MWHPR03MB2863:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2863E21F485AD8A2586D7FF78FCE9@MWHPR03MB2863.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jO48oE39nH0Yn8LsLYOVznbOiZE0TjAvghTOIYKRyaoCLoHHORsvnYsc6mWInAFDkVhALtW4sEqSBioiIA1tbWCSEaVS9JwEMi/eIpeGi9uho+GYBaZJdK6VKaJj0GkW2GirxYuat/Os1SXrJC8ziqsQnoF+xTr+f/OAuoggX9D5LxcCrPgZLk2EXIfTK6tj5har9a0SVrxxJd5pIXQx2GG1nlfAOLG6GLlcOSoW7egs1Ugk9jZ0+X8qSJRZAMXWWgbS7ox04IUMjoPx5dBKXjoOhUaAQZ0GLBXFnq7jWx3vUGrFd5O5pEX7TdZv15MLAaiRDzoczjmO72oi6i8mzpcBU0SOynlBxlJijJbvT6NZTWyHXFnPJzjmzBH3LIbPkehrg3iP87OTRQMFceyd67UTrhbdivYyDn4o7s9+oO4JjHoUNsxg1SM+BGBFmfAzPKy/IVqCJ4MCVcoT9AzOVrSOI7bunopj4DUIAh06uP8Lh+gPgKPNQ5Y+bpgfH7wGimfWMRJ6wGxz2+jME+jfcaCeiHOdYnTfvyLB8WvbtP5uxqCxc349xLt9cqXqhn7NgSgGmzi8Df+4D+9RPLHVfcdHqz0diQmUi6R+mIFHs2c6AZ3cXZ/e4rUC4YxI5wvcloSQIo72B41SKSStESBb1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6512007)(82960400001)(36756003)(66476007)(508600001)(54906003)(6486002)(6916009)(6506007)(86362001)(4744005)(38100700002)(83380400001)(2906002)(316002)(5660300002)(6666004)(8936002)(2616005)(186003)(66946007)(66556008)(1076003)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejljdFZvZE9PcTJPYjVhTmVkNmZoVlRFeFROT09NK1dJMjBrZXA1YjI0aC8x?=
 =?utf-8?B?Q1FkcDRCa3hIanZKbDFpcmVsL0FOY3BrYXo0dEw4emFYWW5IUVFvazFqVnpJ?=
 =?utf-8?B?VUFjQXZ4TmU3MFdoQ1FCamE4SUwyeHJSbE5KbnJiVkpXMldqMEFRaGVkd05Q?=
 =?utf-8?B?NjJoT05vUStmVWZIVTdvTnRPMkpMNHczOVFhNVJLWmNyLzVVZ1lCSFZ2UWpS?=
 =?utf-8?B?RHJtSW1WcVkzbzVMaE5rekduQi9VUzJRS0xHSVlPUkEzVGcvNEVBVmhnTjNl?=
 =?utf-8?B?K0FjbmNDcjV4dmxaSUR0YzA0eEZ4QWIzd3I2TzZDVVhOMmVsRXQ1aTVJdHli?=
 =?utf-8?B?NGtFRkxMNU5Uc3Q2NVBJS0dQZ3dFNUFSaFlhRkJsL25xWGViODJMdmphdWdL?=
 =?utf-8?B?NTUxdkRNZlF4M011V3JxeWN5UitodHZNY3o4WWdsVkZuZ0VEamtvQ29LZVpq?=
 =?utf-8?B?bXlQV2ovTjY5dTdtNVZMRlU2bVNVeVF2MlZYa1dONnVLc3NGR2dvUEpRaTU2?=
 =?utf-8?B?T1JRUnRxYVpERWFKSXoxa2IzTVZqSHJJVEl3UWJaQ0tNdW9OOURXRmp4VVRF?=
 =?utf-8?B?UXhVNDk5VDdOUy9QU1lBejFhMzVJQkMzaFM2SmxCWUNXUXFwNTJpUlpGTlBu?=
 =?utf-8?B?U2RyM3k4UjR3S0lGT01Sd3FPSThwbGREeFdIYmlZUEFVVjlsWkYxSWxqMUFS?=
 =?utf-8?B?bmRUcTlKQWtMSUVVbU5tcVRxVmwwNzVneWpaYVhqdWNUTFpWcHhvaHRwNjNW?=
 =?utf-8?B?U3RYQXkxWXdzZFdtaU5YenZWY3JBV0wzSDUwTlhZMTBSdkdNK3J1czV4Zis2?=
 =?utf-8?B?bW9QUkNJd0hTN25aTUJGeEU3bHYrdU5aYWQ4UGxJKzErVHdzaXZxMTJGTzZS?=
 =?utf-8?B?WXIyR0pjR0x6ZVg2ZlptUjhPNFhMcFhtT1pZQmxFV25oVVlPQVJRNXJzTCtn?=
 =?utf-8?B?elZuZllaVkRhMGdHbTdYVTFzNUpVUENxUCtIMW5nTm1vcEpHZk12S0pTcm1s?=
 =?utf-8?B?QWM4am9JVW8yNmtyaUl2YTNTc0FVV3c2eC9KY0pYQWZmTkc0MzJTU1p0Q0pQ?=
 =?utf-8?B?VUl0K0N2WktPZHB3VTBZRU5MQXg2bjh3WTZxNHo1ekZlbzljQ1E3QkFJTjBY?=
 =?utf-8?B?aFJMSGZpaFljQVE3Y0xuQWxQanlrVXZ0b0tZMlZsazJodU9ZdGEzQWVXc0E0?=
 =?utf-8?B?bzFBb0JXSW14U2ZZMWJsd1hlVlIzTVkxKzhQZEVETDFDN1ltSVBrQUpiUExp?=
 =?utf-8?B?dFk2VFFHOUQ5TVk4NnNDL3A0UWJ3b2czQmE2YkFBWCsxaHdGR1FaSkFYaHl6?=
 =?utf-8?B?d0dBL3hkOUg1dm1KajIxMGZIWGFsbkluSW9UejNVdmxXSVVUQVRIdDBHaW9t?=
 =?utf-8?B?NFJVUWVyYTJ1S25HUDJOTDBkTlVKc2ppYVJ6R1JTaHBzNHhHc01LazM1ZnJu?=
 =?utf-8?B?ZXRKREloQW5VUFRHK04wb3BYRTN4bVR5VEFWRWFmRmljOEtUSVgzZU82WlNi?=
 =?utf-8?B?SXBkZzErNzJPOEg0Y2ZjNm41dFJQaFlkUlhSR2h5ZFFtR2I5WVFXNUNQV1BZ?=
 =?utf-8?B?V0Q1SWprczRPak5XTUVBUEVENjB2ZmU1anhGcU9LSEcvd3BDZk9jZGZKT2Jn?=
 =?utf-8?B?QlNEbXRxV0Fpa0F3eXFVZ3Yyd21iTEVQNVZETUV3cmdRenBsQ0lMSnRxY0JW?=
 =?utf-8?B?d3dCVE5WRWtnK0JESFhza05jQWEvNVppODAvQitsWFBvaWNEbkE1ZGRQL3gy?=
 =?utf-8?B?UkRUMzlzVEZTL3YzWURQK3JRekpMaHBCZkYrZlJxT3k3ZW9ieVVoSmllYnpC?=
 =?utf-8?B?aGM1bmNFc1ZFTTJERUFoOHdtcjNEMmJ0emQ2NFZ0QkR2dDQ3MENIWHZvQzE0?=
 =?utf-8?B?MCtrdlluOXJpdVBpeERDVVBlb2krVmZhSmtkQnBRamZSTHlnMWtyYmNCdzBS?=
 =?utf-8?B?NVhjNjJGWTFSSkFIbnBhYU90WVVXZzZuTVhRL0E3dFZpbTdoRlo0NitQVHRp?=
 =?utf-8?B?aFRLbTh6ZXJhU3pZTjBETHZtczZCUUxDblB0R1RSRGNtVVVnYU5HSVZVYjZU?=
 =?utf-8?B?ZmtjWG8zQ29STmpHdVRaRldXLzBBbWlLTUFRRDdIMDZaZEp1TE5NKy9XcDJK?=
 =?utf-8?B?S0NkcDNxU3VMVjRBa3FPT0dVZTB4NHR4Slc0bktlTWZWd0FsenBPVERnN1Jh?=
 =?utf-8?B?T2ZDTkNuRTEzRStIeGlDaUMvS29LME5HZWJEMDd1bmJleHRJRWhuNmJFY05m?=
 =?utf-8?B?Uy9mVmtPU3JmZjFPOVA5RWRWM3UrYXZkallLUSszdUUycmtOaGp2RURUa2J4?=
 =?utf-8?B?VzFsK1BnU3pjVkx1eXNVU3UrV2pEOXNSSEp1U3h5ZlBQWjIwRkRxQmRMS2x6?=
 =?utf-8?Q?Ch4xgO/JFwclUr2Y=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7489a23b-6ad5-44d3-5608-08da38083aa8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:22:02.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qTPvQw9MYAeZl4BfHWlJQrrGvg0d6YiLOltWJgHI5giV4P8ps/SnDToGJXSk56AJ4BOkZKOoKpM4jPwiboyLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2863

Hello,

Following series implements support for bus lock and VM notify.

Patches are not really dependent, but I've developed them together by
virtue of both features being in Intel Instructions Set Extensions PR
Chapter 9.

Thanks, Roger.

Roger Pau Monne (2):
  x86/vmx: implement Bus Lock detection
  x86/vmx: implement Notify VM Exit

 docs/misc/xen-command-line.pandoc       | 11 +++++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 22 ++++++++++++-
 xen/arch/x86/hvm/vmx/vmx.c              | 42 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  7 +++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  8 +++++
 xen/arch/x86/include/asm/perfc_defn.h   |  5 ++-
 6 files changed, 93 insertions(+), 2 deletions(-)

-- 
2.36.0


