Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F009B6E20DA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 12:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521093.809397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnGiw-0007Bs-TP; Fri, 14 Apr 2023 10:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521093.809397; Fri, 14 Apr 2023 10:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnGiw-00078p-Op; Fri, 14 Apr 2023 10:32:10 +0000
Received: by outflank-mailman (input) for mailman id 521093;
 Fri, 14 Apr 2023 10:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClDU=AF=citrix.com=prvs=4618bebc7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pnGiu-00078j-QM
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 10:32:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9947ba08-daaf-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 12:32:05 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2023 06:32:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5018.namprd03.prod.outlook.com (2603:10b6:5:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:31:59 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee%3]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 10:31:59 +0000
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
X-Inumbo-ID: 9947ba08-daaf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681468325;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MGhRUNn4CpD1xmpI3DHftaQwUI7WuO46fEFASjxcWZk=;
  b=AzgWtX3u1mrMIv/nFRwOiHvWjEABMxTBi809BFhg8h5+am9u5BEjwLjR
   huie9gjtJyHeqSKfHS4YFjhtzqieoyh0ZXf3bEIadYTXXQU6jkhYsfIWJ
   3hpxycoLF8JApU1TQQ0AamUrvz1N8pN2Kl7WWeKW0MxjHzWxRx2F9CYyB
   8=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 105912536
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aMdQK6hQCGCtLtFdFTEJsSxdX161RhEKZh0ujC45NGQN5FlHY01je
 htvD2yGa6qOMDemeNolaITjoExSsMXTzIdhSlM/+SFkEiMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRfDSwAQSuBoNu/g+yGRvlzntt8PO3CadZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1YLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjBdNLTuDjqJaGhnW14GxKEi00CmeqsL6D0V6BB9hZB
 R09r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+8pog210rLVow6SP7zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:wAS3KqgA5aTuM/n9KelGZ6MbXXBQXuUji2hC6mlwRA09TyVXrb
 HWoB17726NtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3AeXK6JWkvgMnl2A6tSRfzkRyNdmXXOTr40Hr/GE2?=
 =?us-ascii?q?fMG8qFoCZWUCI5/x0t+M7zg=3D=3D?=
X-Talos-MUID: 9a23:GQfEfAVZqu+X7k/q/BnKhGh4BOU337W/T3pWgapasc+qZAUlbg==
X-IronPort-AV: E=Sophos;i="5.99,195,1677560400"; 
   d="scan'208";a="105912536"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA8372tFLxdBw9dvXiFgrmUuUpE7D1PuptSaIK0Dwq4/3HZ4s1utowIdWu7AT0ExnebK7xdzejjjgApmjhh7vGDUvRfGzzSAxy+3lLpK/FoZDsnKASPusLQc/H6jrw6gfi0UrrTlrqJ+NfcVuHbXqSnRr2yv96sxvYqwF6xRvnIkojLhnhenbEd8Bn4E1oMYOXlg5obnsJ2QZBvKgRjK53Rx5rbYvTZW77Gvlp1PAkLrt4fsFVUKWQe7g4hT4r0g5CwaAlyQKPakx3oHmfC27XQNaP6fpa0GjSMKDt5SQRuYIEG65tn/pRqr3xLt2b8GCuObXb9CqzaWYXxg6IluRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98vGd4J/+VAnQ78DBVa6BYMBArs4WMIxEMx+E+g17Cw=;
 b=cyJO+sxM6SaEcpatI7P5rLL95HXHncd3ov3BkMRpi9VpJby1uMGjP1cBBUZ2vu+BmqJ1AQkgoedIZxuwZIzNMOsekWIzBUcdo4P+Stla3ACL7ZIMrkNeNshrwEd27Pa/SWfGCehy+2ShVqHB/ZJ9GzuvJuLuBFbeEyjgvZgTA0MOt4whKU3UaqD6+N4BYUNE/cd5KcP8caPhy2a+WcMz/p0GiONh/rfPbVMTnElRMcCtDYav5b5vTovZ5tq7ZNHTXr5KVsOqQNXpWaXGjytrh7p5OxPiWCrtywfS0WF6bB5TNhucQqFYqTde7g3ePtNkHnyN5EJPprA971onsY9ttA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98vGd4J/+VAnQ78DBVa6BYMBArs4WMIxEMx+E+g17Cw=;
 b=e/wT+9qWF4A6IkLh+1uGqn7K1XVnuji4EfWTf8MPteU5LnEI96c6PBgBasG3uPNuvmwSBbIIBzAs35oPwi7X0Q8k8mBMxXkwkjhGPjCfpnc2Fe8ChuizoF5gWKMbH3pmGSwWRTk2MB8DwnaaF+ieT5HPvDLvBtg8TWuJF9KGbIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Apr 2023 12:31:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/hvm: Disallow CR0.PG 1->0 transitions when CS.L=1
Message-ID: <ZDkrmbn84X26X0qt@Air-de-Roger>
References: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
 <20230413150009.3145462-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230413150009.3145462-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: bacdc4b9-6734-4b26-278d-08db3cd37a6f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fc4yjXWFDGufRcIQ8LrMb2Gq77JSIja0QRG/4aK6CVVlWC58y+6fhwpLwYsRAKbyS8ufXnlPMNnBpIE0FUBv6WYudM1ggXMWO8JITRXRnCbncMwZ2FSuKTZ8UDFeuUyPZrsiUgdTQt9StzrSd9s5TzT9IYKUviz2zEijbdNG2UMq2dT41uD/8n5Qy2Mdq/O9WX4qPIB4JcWYs3wtvvwrGVsL/gnDnbF6+sAbifHOaRmR1vBPRJJkvCeVTloGFnnTxe394SJcyqvKtoAqYthZs4o/tmx3/wALhbT6R1xE8itcOjqY4evTld1FogBSMkeD+5LMA09YvO46OZ8HcLqAKJGOTR6WuFfpoJqClde/66fAB83wKNErEuZeELEl4fcICB2SWB+N2Hd74aegMQ3pZaHRbeanWl1qQtk6nZBvy6dbjpTgYsKmw0AXc6GxbCe16byNIdWf7WTCLi+X9uXyBug7Z2oJ4LCtC3hW68nW1cToaYVauBp8dAguVilwSmXqgpK+1BJgWG1ysvOIUWmfrJZIqALAZz60V/I0GO1Yxexq2BJxnK7J5oZbgFbEc4s4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(33716001)(85182001)(478600001)(54906003)(6636002)(6486002)(6666004)(41300700001)(82960400001)(8936002)(6862004)(8676002)(38100700002)(66946007)(316002)(4326008)(83380400001)(66476007)(66556008)(6512007)(186003)(6506007)(9686003)(26005)(86362001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWtVanFGTk5PbWNUbWFLZVpTTmM5Vk9WcklBVllaTmk2YUtUekNxK3QxY3Ux?=
 =?utf-8?B?SGFaVVpSR2tRTUJrWkZaN3NWbUVRK05La2xpdm96VzRmeWJoRHMxYUdIaW50?=
 =?utf-8?B?eWtDT21WVTJ0R0Q2M1JaYys1T0xmaG1WNitXVTg1RTVWV3h3T3dJMm82ejU4?=
 =?utf-8?B?T2kvQXYxd0RsRDdOejBiSjZBZ1lnQ05nMXUzZ3I1OFFrN29FQkxqVjlsdG13?=
 =?utf-8?B?K3l0YWppRWo4MVdyZ2w4aHAzTHprVjNsaE52N3FlNjhGb2hHN0hzR051TXRH?=
 =?utf-8?B?Rnl6Rmxjem1GMzAxbi8xejhncXBlajBYUHd6NUtLVFhsNUNrWkVkMm5EYWpr?=
 =?utf-8?B?V1dZOExHaVpyVzN1YTllNlNMSlJsQ1JXUmtqMktmMC9ubnNRK215cUdVTURU?=
 =?utf-8?B?WVJ5Ymd4Nmk5WGJrK09lazVXOFNYS2h1SVErN05Gd0hTMkhVaEdmNzlmY09O?=
 =?utf-8?B?cHg5MUowbHVLK1NFcFpSa1VEdzdXM0ozZ3NOWUo2VnNqNlFFekkwNFlsZmJ2?=
 =?utf-8?B?UjZVODJmeVQvTGh0UGV1eDF1WTJNTzMvQm4wb1czMGJ1SUJ3R2RtSlBHK2c5?=
 =?utf-8?B?TnJ3V1RLQ2RBVWF5NmxIS0lTZDlxczkxTnVFYVdKekdhRmdMZHgrbWVkVlZX?=
 =?utf-8?B?ZmpHb0NMeXFTQURMTFVia0JlQUxOaDhnM3ozeXc2YW95ZFhNVkx5NjB0anVl?=
 =?utf-8?B?TS93NTYvQmtiY01vRmNlWWtNdnpTc1NRdUViSHcxVFVEK1JjYWdLeVM0anJp?=
 =?utf-8?B?RDh2d1g3c2RscmpRSXZiRzBETkQ5T21PZnBHVU9tZjUycHVSejhyays3aWl2?=
 =?utf-8?B?Uzg1MndHODBSMU1FZFJZYkFpMzN6YmhHdEtXdnVQR0YyYXBJdEt6a1RjYkdB?=
 =?utf-8?B?bG5IQldoTURQdnBqRjdWUTRaMGRUbTgzOUxxWno5VFFyV3JqSVZsS2grVUNh?=
 =?utf-8?B?T3RtLzZLb040WEFncFc2QnY3Z0tBZUN6bUdVSFNEQ0dRZ3BmRWlQNWJVUkNY?=
 =?utf-8?B?Uy8xUCtIUUVoNjdHS3h0NER6WTJnZG1mT1ZPZ2oraEdiL1p3N21xQUoxL2tZ?=
 =?utf-8?B?ZWlySi9paURJUVc3aVhSejJPV2FSTENJcmlqZXVOWTR5emZQZmN0TmJ5SWxn?=
 =?utf-8?B?K0NZbFFjQTZzR0ZvdFluWDNjNTc3SnVxYnI2K1R2WW5VN3hJSEVUODZxUkJv?=
 =?utf-8?B?NGlxZ29tRHF5TjNpK1Y0UFd2dGkrcmpIOTZnK0ZiZXZqL1Q3UnhPQWFnSmt5?=
 =?utf-8?B?RjIybmVraXkxZXJRekU2RENoVloyN0Vaa2VmcjB3clpFdFlFQjdQMjVRUkJO?=
 =?utf-8?B?ZFpxaDloRGtqNTJVUS9LdkwzODJyY1k3NTdkYUFoaHFNMllvdG5iSy85ajJ1?=
 =?utf-8?B?UFdFVWpGeG9iT001TlNXSG9pWkJFdFFKTnY1eWwxekh6QWxrRExRdmVDaHFw?=
 =?utf-8?B?M2tISXZBWDk5ZjhYWmJEendSUVFJU0JSTkZEWFJUc3JFZXN4dkJ4cTZHY1Nz?=
 =?utf-8?B?YnJhUWFla0VCTzJqRDduMm5Oa3JLMlg4S3RnZlBrYzVhNEduTWVaQXBWNFdz?=
 =?utf-8?B?NUhqY1JYbDdrNnJXYlI4R1FCRXNIMDI3NEVQYkg5SCtiY2ZRTExBSG1tM3ZZ?=
 =?utf-8?B?Q05zS2NCOGRtNW5nWjl2cHdSM3ZLSXYvbDZIbzNmTzZzTG1Vc3p0R0FhbjV6?=
 =?utf-8?B?RHFSVjErRVhYQ2ZvQTJxOVFYd0tHbkp2Q25PdlFRa0t5cEtyQzZBVURLL0Fu?=
 =?utf-8?B?blJCcmhrcExqbTZQMVNWUTZDUU9HSW9TeWcybWMvMWJ6SC9JWDRUSzVHRmJM?=
 =?utf-8?B?ZFNSandqV2xydTJLZlZPV3Z5ODJvS001OXpIR0xralpYbEJyWmZUZGwrRmRJ?=
 =?utf-8?B?eTBUcXBPSmtIcERLaXBjN2pITkc3MFBXOFhhQWpxOURpSUdOdktlcnN1WEJV?=
 =?utf-8?B?Z1prTkV0MStEN1VYcURrZjg4amNKcEw2WSttOE1DUE5WZ2l3cWFiZUlyT3Vr?=
 =?utf-8?B?UTY5QXplVk4yTEJKTGFyQWdHTmlLY1BGUUZvenJmNXZBbFY5ZG5nbFZBMU44?=
 =?utf-8?B?TmVYWjA4VGMrQkxFWk5qZkxsYTNjdTVBM1FpRXdSS012MGZ2UVJOdHdaenBu?=
 =?utf-8?B?UjgvNU1FeGthRFR6YXJsYzY5aUtYR2FlMXZDM2t5VUcwZXdyN1BKK2VHTHk3?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	InxyOcUt/WNUc9tMmw1XcwtSg8X/lTdI97ThXGiovOojTz4diAc1KnXfl2nrzi48I7Bej25pwykRORoh0S1hpVRSyX10WwikqqGsfVBt171/+/bevXBHeI9u5FRie6m9B4jyMQVfykVS+V125RP7xt99ydmDvyzLbCn000ppo1O+yxE8S3X25Nn/9BtBbogvq921JOPVvnlRpzZimbmmp9fnu8fmCtoB2vOHOrOvKS8QgzEJzGsgwOXdgv2JfXJO2BC9IsMSR3ttWmbC1SNuT5rI3DJrdaRK8Brgp+331fyQEnlwyF/W7S3dEfdVWM4IjmwIGBqVmL09ae3L8i85ml8O5teqJEaUWgm5ellEBB2vPOy1DX10Eynr8A47m6lmcQwWn2n+KdIhYQGBiJm2XL5w++2Ba/cjRl0iJwfLaqLGCZ6kPBHYX+AhOa26cenrd4ZFjT0EmNXQlIC8lipK/CaPNBcaEItaAIjWFeroJPfYYfd6+6ZwmN3v7PnBYV94J7vK+DjHxBSQBoFksP0JoQFtiNtXIUvvsyhArwSNDQTivdasjETP2O6o8JIzJ4NXAuBmBXs8ADs7e7iihVYmoXeZ/H83M37Sk4VFOowbXmYQ7IIkjsuN3ykDtpzrkHTvcVFey2kVt5MO2swDq4YPd8H7TUpDSmPTup0yEOw/fn+Pnj4FqqtOYrILrF6dI6rLB88h74CDQmaEJbQewQDoKEcmVDpj0oqFOLGghLpSFXK79T8JH+aeH362DFaqzlML5LpyV481p4VJ9jv0yPZ1K47dfhWK7zqH5mK4ja8MVmui+RIZqDEpm3W1DkG4STSQMLeNynKYkzedHEq3t0DY0Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bacdc4b9-6734-4b26-278d-08db3cd37a6f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:31:59.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1tDuMUN5yoiphQhHDAYGoL5E+rhAgcpiPN39iJx6uJ4rtLB1+tWMF04bL09JhOzW0uQxhOEfarf+cyJ4s1CJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5018

On Thu, Apr 13, 2023 at 04:00:09PM +0100, Andrew Cooper wrote:
> The Long Mode consistency checks exist to "ensure that the processor does not
> enter an undefined mode or state that results in unpredictable behavior".  APM
> Vol2 Table 14-5 "Long-Mode Consistency Checks" lists them, but there is no row
> preventing the OS from trying to exit Long mode while in 64bit mode.  This
> could leave the CPU in Protected Mode with an %rip above the 4G boundary.
> 
> Experimentally, AMD CPUs really do permit this state transition.  An OS which
> tries it hits an instant SHUTDOWN, even in cases where the truncation I expect
> to be going on behind the scenes ought to result in sane continued execution.
> 
> Furthermore, right from the very outset, the APM Vol2 14.7 "Leaving Long Mode"
> section instructs peoples to switch to a compatibility mode segment first
> before clearing CR0.PG, which does clear out the upper bits in %rip.  This is
> further backed up by Vol2 Figure 1-6 "Operating Modes of the AMD64
> Architecture".
> 
> Either way, this appears to have been a genuine oversight in the AMD64 spec.
> 
> Intel, on the other hand, rejects this state transition with #GP.
> 
> Between revision 71 (Nov 2019) and 72 (May 2020) of SDM Vol3, a footnote to
> 4.1.2 "Paging-Mode Enable" was altered from:
> 
>   If CR4.PCIDE= 1, an attempt to clear CR0.PG causes a general-protection
>   exception (#GP); software should clear CR4.PCIDE before attempting to
>   disable paging.
> 
> to
> 
>   If the logical processor is in 64-bit mode or if CR4.PCIDE= 1, an attempt to
>   clear CR0.PG causes a general-protection exception (#GP). Software should
>   transition to compatibility mode and clear CR4.PCIDE before attempting to
>   disable paging.
> 
> which acknowledges this corner case, but there doesn't appear to be any other
> discussion even in the relevant Long Mode sections.
> 
> So it appears that Intel spotted and addressed the corner case in IA-32e mode,
> but were 15 years late to document it.
> 
> Xen was written to the AMD spec, and misses the check.  Follow the Intel
> behaviour, because it is more sensible and avoids hitting a VMEntry failure.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> v2:
>  * Restrict to when Long Mode is enabled.

Maybe the subject also needs to be slightly edited to mention CS.L=1
and Long Mode enabled?  Or just mention long mode instead of the code
segment status?

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

