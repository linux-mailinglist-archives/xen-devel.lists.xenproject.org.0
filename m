Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093916F03BF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 11:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526920.818997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryJz-0001rp-T9; Thu, 27 Apr 2023 09:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526920.818997; Thu, 27 Apr 2023 09:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryJz-0001oT-Pg; Thu, 27 Apr 2023 09:53:51 +0000
Received: by outflank-mailman (input) for mailman id 526920;
 Thu, 27 Apr 2023 09:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pryJy-0001oJ-Ey
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 09:53:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 679b6bd9-e4e1-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 11:53:49 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 05:53:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 09:53:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 09:53:40 +0000
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
X-Inumbo-ID: 679b6bd9-e4e1-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682589229;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qAOe1aIyzpSn91DRLcDRcRftC0dcXMadusU1TNYFK+c=;
  b=RNDU13PYge1avhOq5hNremY430tvLQKLuL6M26QfIuf9oCfM65DrX/xG
   QkznRaCCQFYNRsO7BsOdlLxrRsvqFBBkI8pEC51kprkoVLEGLCJGaD8TG
   wX7QcuFpT/yEAufEV+9AiXHze9maEWdRBU/Eklto0zczgwh61DmNegg5C
   w=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 105818692
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QmMGRq7CEGOR1OJOcQ55dgxRtP7GchMFZxGqfqrLsTDasY5as4F+v
 mdKXjzTbPbfMzb1KIpwOo239UkHuZeHx9JhTwBuqHtgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPawR4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mq
 P0GGhlVViy/ifu/+pOhbeNqr9pkBZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOmF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKSe3hpqA72jV/wEQRGDAyRX2Si8W9k2S/YvB7E
 FA58G0X+P1aGEuDC4OVsweDiHeAsxwVXdZKFKsk4QWJx6jTyw2dAXUICDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcdYQcUQA1D5MPsyKkxgQjIVc1LC7Oug5v+HjSY/
 tyRhC03hrFWh8hU0ay+pAjDm2j1/smPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOvBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:DjjAgK15/32CD7NbAKXNNgqjBIgkLtp133Aq2lEZdPUzSKClfq
 GV88jzsCWetN9/Yh8dcLy7WZVoI0mslqKdkLNwAV7KZmCP0gaVxepZnOnfKlPbakrD398Y+a
 B8c7VvTP3cZGIK6/oSOTPIdurIFuP3lJyVuQ==
X-Talos-CUID: 9a23:YHSGKGxE1EesznAxpQ0pBgVJG94XWyXl8EveOkaCKHxOQru8Vxi5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ArKeFqQ57tKgl+60V1CyELeXWxoxq84mKGGYku6k?=
 =?us-ascii?q?CouOFDA5UACuwhnOOF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="105818692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIROtLFGVcvUIfhD8n2f3vVOkFb01LGbOL906wTwI3WRPREy9UNvtbQyFFWBcaYHSi294+Mdo+zV1Tv8VAYdGrcpu3e92m/RabLfPlaztnvCpk0gigAido3jJfGK2w9DibRfto8z65/kJ+NiVNFJxo1kSvDDQ115kYvL+BYP8Go1aImaNlYjWOQitiOHBpq2feHhyao+r0JMxLocePY+WWiPbKhFjxyujuNJQO+6orHmokNKtCUKFiKf8zxUIQs0XTlrS71KwnhxfKFOqdzcN0W5OO8EVP9+//9BYzXJSsvg+nBfF3jbTonnTRaU5QKAZFUE180sREIsIhn+cTDfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hxBeI8ESlA1z5ElHS4zF+BjfYcILnTjOYa7geTM/DA=;
 b=kBIHsMogI/hCfQOGg+Wdi0/yIKHzNM/hFcHngw/Z4URZBDH2hCjcz4H25LSfiTmCR2FVPsH1cTn+aNmcvoa1CERHIH+vLBNgurptg8TCdkio7XDpvPoY4RRc060rjhAletVqQvhW5nD8OFV6C2Hxp1ygxvWQfu+ay343ukZmL04oIWr9Q2Tbu+QxDzatWGiBP+V+KNOzDAop6XHj680GSzy1JWqoHu4RUuvEsNtRwPIW2NwACb0+IWiR78wh9jzDDz8XcPfqV+7IGdtVK6oZOO40/7vtlLcYXKo4fFIQjfvflWHV7qgyEyFAWEfmwho39zX0ib/JFRaJ8cB36MiGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hxBeI8ESlA1z5ElHS4zF+BjfYcILnTjOYa7geTM/DA=;
 b=QqLZcGhNoKrjS786xc/aZNj4Im7HQk0KGrryfBAfmQJG20VPunwxK4T4OTNy0I5wXmjn4SmBGL/MkHPeEe/91stN5DsGAepxD+GJQwbC1art45a2NaPPKVo6oCvFF3/8BIuMZO4Y6fbmEyEWsupFXUAHaBjUEJwH+pRCdYfx718=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a32fb66f-ac9e-e6f1-04a7-1345ab7f9805@citrix.com>
Date: Thu, 27 Apr 2023 10:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] tools: Create xc_domain_getinfo_single()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-3-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: a79058ba-0520-45d8-3ef5-08db4705479b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EArXKni+XRnsTWtoTqKIaXgUZ2FdKxnD2fLXQ+1q94TTl6iqdQncutWtTqQDtJR93/RYUus+s3oZG8d7GfDVc1rVpJyoo4a3fdJvKqn+n1v7xSIJNiRES2ZUn2itOPbGKPh9bbQF83U+gl8NN1GZf7++k4W4M0KcrHe4IGQpj0q3iBrMri761EOYtAYfgcxV8wXXv0xS3yt+MWK9Haw8F9e+Vw97X4fr0vAzrOZzgzQJlfKAIIKcbScukfBS8M6tM7U285PcgjETdb22xK4uuv8AmOCu3UotIeWAk/P3/4UTuG5/+fyJrlWdHvFfYMaCq6vjspQ89eIH4J21AqjWmR2l0Y/gtoY0/Udghr1NaSDZmAin6ULWkN2P+FMnxrDI6KL6UAqZV4RdaqTcJBOTvX1mhCf1o5zT1ABz+iCLJyUxPLpO3Ejblt0aQYWc2cHcFoaETP9xHmv3XVmP7HcTVnZdXeaofaMPH3qYboMuugwzdAnPt94oaqM4/5ZZSGOlNjJrXy2NUKqLqNmzSkjp0BdCVuFw1svaXAKKt53pQnjuAIjUGEdi6qGX/YI9wgvXFxo+WTTw76KBZnPkwgJe1bKrEOclWy/o/EPgYMBjJU54q7gghPfsLXkMSfkWMnwH3Tcb/+uDgymoecba3S6edA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(86362001)(53546011)(41300700001)(26005)(6512007)(6506007)(2906002)(5660300002)(8676002)(8936002)(36756003)(31696002)(478600001)(83380400001)(38100700002)(54906003)(186003)(6486002)(110136005)(6666004)(82960400001)(31686004)(66476007)(66556008)(4326008)(316002)(2616005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU5DRnFVRUhFd0lLaEVHcExSdHptM2RQNHNrSnZPNTZQU2EvdXNVbmZqMVp0?=
 =?utf-8?B?Qk5YbHVYK0dqOXZKQUI2YTMrdStJeXN6UWxqRGZnSERYbGo1WTA4RWhhTGdC?=
 =?utf-8?B?RG05dWs3M1FwcnFvemZOVGFoSWt2N1JHTlRvb0phdDk5VnZBczFHMEpieWNk?=
 =?utf-8?B?eFlYOXlWZDFKSS9WY001bEhnbmRxenN5NWU0NnRkSE5pUnEyQmJPdW8xY3Nl?=
 =?utf-8?B?VkgzbjZQQmgrVmM0akl2YjB3ejR3R3Y4OU5HZDRIdFdoaU9oYTdoTnhXQlFl?=
 =?utf-8?B?d3V0M2NxWExYSEEzOTQrMU43ZVI1L01Mb1ZLS1hRNkFOTWRoNFVOMUlwUXVy?=
 =?utf-8?B?aWYwNWJ3ZEI2cHl0cjQydEdIRzVVZUhHQmlhU2V6VkRudnh1OVpuZ2RRSkFl?=
 =?utf-8?B?bFdNdGZKNk9hUDRoM2c1R1BmOFNsZ1ZsWW81cDVSQzR6Z29kUnlTVjJITWM4?=
 =?utf-8?B?UFE2Zzd0V01IOEJYaENZU0ZZQ1YwYWFNQXpiVEV3NHhNdGloRjl3SG8zU0hY?=
 =?utf-8?B?WTFTY1RwKzZOL3Q2M0hKQThxVzB3aGthVHFIRjVrS3Y1WVorSW9vWmRTQmVD?=
 =?utf-8?B?QW8yRUFMb2g5ZXJNTStKdTFuVVBZUnlsOFJnMFlQbjVMZXN2NGphR1h1Y3Y2?=
 =?utf-8?B?YmJBOGU4MEtGRXJvVmt5RFVrbU5EVk1JdjJSeS8yczc5MzB0bllpdGticTVO?=
 =?utf-8?B?MlBSdnpSemlVS1pvVElTVGZiNGNVZE50dDRDLzJhcGhMcjB2SGlZeVZvT1NU?=
 =?utf-8?B?dlJUVTRYdERWN3BhZjhucnN2ZVFGTXNzWHpMY0wvamkrdkZ0TXhsdWluVk13?=
 =?utf-8?B?ZHZJeG1FcHM4QlVmWGxlcXNFZ1k4Q00rVlViK2dPY1FRb2plTEpIb2pKa0cv?=
 =?utf-8?B?dnY3K1RBTUp4b01uSkhKc1JzSm80RmsrTE8wWkJVQVNaS0szbTJacjRpWkl1?=
 =?utf-8?B?YzV0WlFBRVBodTdhRGx1MU8yRURuSVFBMW1FUGIxZmE5ajJiWTNjYURWb092?=
 =?utf-8?B?NWpRVXNud01kQTJpUTJSWTI4MktYZjNHY3MzVW9XVFI1ckJxWXh1SER2eEdV?=
 =?utf-8?B?UTA2UEFLSEV3OGFKUk1XRFlpU3lXTm9xdlV0ekdjOWpJV0kwZ3lsN1hSODdN?=
 =?utf-8?B?WS9OT3ZZa2lreTRMVTNiOVhyOVVtUTM5MWhDVk9mZ3R1WWtnMEQwS1gxdnJn?=
 =?utf-8?B?RC9UelpkdzVBaG5NdHY5UnpDUWtnT1BpSVQyT1pkZkUwV20yZTQyWEx5eG54?=
 =?utf-8?B?S3ppOHQyRkN6ZTIxL2ZNdnhSZS9ELy9RYklaRUZDeWovdjUrU3RUeENmRWJG?=
 =?utf-8?B?cDI1cERxNVBNN3Bub1RRTzd2NVh0cUkxT1hmdDdQWWJsdG5keU1GdTRBbi8x?=
 =?utf-8?B?VlFHOC9Xb0dQY3NZYjdiTmtzR0wwRHlqYmJ3SFVYcTY1bVZQcVpNaTdFdXRk?=
 =?utf-8?B?S0tCa2gzYXBYMFRLVW0wbHJxZWlBeFk2ZFlPcGF2K1NINTdGM21scm41Y1E5?=
 =?utf-8?B?VSt2VHJxZzVNQzFZbGRySE1OT3NQRktYam4xS3F3OTdPZE5SOFM2TjAzdkRa?=
 =?utf-8?B?eWlEbW9VakUvTWJqVytpY01scFl3RTM3MHZ6N2ZNeXJyUXIyN1IxWGIxSUEv?=
 =?utf-8?B?czBNUGRFbzdHM3d4UjJQalRRdUVuTzBCL2dWcXNaQlpPTm9ZN0lPTzBoLzdD?=
 =?utf-8?B?aE9jVWNiVUFyanBRSlVobUo0TnR1ekdFRDdjTXFVRnVIU2RYYzhneDF6eUhi?=
 =?utf-8?B?TWIyMnY4R2NZWkdZWFZORHB1UjRreU1iR0RnTmVpUVRQK0Nad2RMYkgzZ3Ex?=
 =?utf-8?B?Q0tiVy9IdDJHQUZDcjVUOEdtaHMyNHJ4WjcvZUR3dW5IeE0vWDh6WkVSUWFV?=
 =?utf-8?B?eS9sN3BaR2dlZ0dpdDhXQmtHT1JvTjJrMS9tcVYvZy9mSnFyOWhVN0lsRXU2?=
 =?utf-8?B?K3ROdUNERHloL0tWZ1lLNVZPUXpSRVRmcThYNXdQMS9WSlpINGxlZUZvRXZv?=
 =?utf-8?B?TjNJWDBlUVkyV0Y3dWMvTUJuK2FDMHNtUUtrSlA3MklaU1Bkb3Jwbm1yZVda?=
 =?utf-8?B?SHgzT3NjUnUvdWNpWS9HN1IvbWlNdXZ6dEp0RU9PLzBrY3FOU1Fhb2JnQU5s?=
 =?utf-8?B?NW5HUzM3OVlGWVVSRWNhbzVNMy9DYU5oRGtTTWlSRkdaNkJHVHY5M0N2cXNx?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VJmspOsUI+ujXzOE8WivhJXYWsgsYbADhyPgyPDPI+QuZc1DLtFpDSm2cjh0xJCJKLLRN0AsPny6TUYVDAyOmOy7Y1ZfQ42zuFAzK/OH19U+i21PPjBqdAAkkDsaGgOWAZKxKIG07u8WxRBLJBhliwPd4cPymQl1UB89oOdboAcibVrxvEb0ZCkZqauM6bE7ua7cpvcdzXNm1x/GaIsX++LlPySCRt1uAtcgf8YCW9kJ1wNEOIx0cbqNk35eR4B3eS5FvEvMqxJMJIwlNPnup0NpwyXpTfbG63rar9Rp+a2J9Km7Ftz3YKr2+5u+eR0Qe/Ku8XtRB6E7ZDK1ghyvSh224JZefYMPdOXrx8T5G/Elwy1Fe2L7361kkPSxrr6pYYuuUZxCBNrqZfk2I6QPuR1uM8hgWhqt/MNKsJyQrrDPRJpr2DaxwKJW79h/5k9OJWPyWvK/0PhlF/aUsbHJwdexEtFd/mPg32xG87efUwyJwOxve/rU4lLI2M+pjxpQ0zbU3OIDFXkWr+yZphR47/gXz4ojr/4l/VhY28KI7/L4vIQ4aeozK+r6A/hDPHOLWyJztfx+cvFcG1ExN/2KhytwKSkmwiGwjr/BpJ3CqNIbyAB7XyCOuKtfrf4yZu902iopn54b/LF/6QknzAE6e/3p5/TtoeapQsHrOt8kymmtcca+9yXgmiohABlGbmsoDlT0giBHS1N/umADqzOVHerxVHjQ30X0itF1J3hwbG8bKop+1zF1crwgLnIP8ro/6fN6Wam4XSxRhqjubwa/iKqL1ihvZeO8w0RdtCNSCP3yAwkoEgLbBZg74sXRxz75fxdDSRmWRKdvgj3SfJQsMqcVjDKHRmTe65akJFlU8E4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79058ba-0520-45d8-3ef5-08db4705479b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 09:53:40.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMv5LEwY9QHlSnTppvtiiXw+AX4i2Voyo/J94mAJKVISVj08vA9uy2XG/32bS6OKu9lz4RzSXagwv5CXARmqh9Yy7PoVbdGCPzVqpkWrP88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920

On 26/04/2023 3:59 pm, Alejandro Vallejo wrote:
> It's a stricter version of xc_domain_getinfo() where the returned domid
> always matches the requested domid or the error code shows an error instead.
> A few patches ahead usages of xc_domain_getinfo() are removed until only
> xc_domain_getinfo_single() and xc_domain_getinfolist() remain.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Juergen Gross <jgross@suse.com>
> ---
>  tools/include/xenctrl.h     | 16 ++++++++++++++++
>  tools/libs/ctrl/xc_domain.c | 22 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 90b33aa3a7..73b07955c6 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -696,6 +696,22 @@ int xc_vcpu_getaffinity(xc_interface *xch,
>  int xc_domain_get_guest_width(xc_interface *xch, uint32_t domid,
>                                unsigned int *guest_width);
>  
> +/**
> + * This function will return information about a single domain. It looks
> + * up the domain by the provided domid and succeeds if the domain exists
> + * and is accesible by the current domain, or fails otherwise. A buffer
> + * may optionally passed on the `info` parameter in order to retrieve
> + * information about the domain. The buffer is ignored if NULL is
> + * passed instead.
> + *
> + * @parm xch a handle to an open hypervisor interface
> + * @parm domid domid to lookup
> + * @parm info Optional domain information buffer (may be NULL)
> + * @return 0 on success, otherwise the call failed and info is undefined
> + */
> +int xc_domain_getinfo_single(xc_interface *xch,
> +                             uint32_t domid,
> +                             xc_domaininfo_t *info);
>  
>  /**
>   * This function will return information about one or more domains. It is
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index e939d07157..3ff91023bf 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -345,6 +345,28 @@ int xc_dom_vuart_init(xc_interface *xch,
>      return rc;
>  }
>  
> +int xc_domain_getinfo_single(xc_interface *xch,
> +                             uint32_t domid,
> +                             xc_domaininfo_t *info)
> +{
> +    struct xen_domctl domctl = {
> +        .cmd = XEN_DOMCTL_getdomaininfo,
> +        .domain = domid,
> +    };
> +
> +    int rc = do_domctl(xch, &domctl);

Minor style.  Should have a newline here, and drop the one 2 lines up.

By and large, this library is mostly Xen style and we're trying to make
it more consistent than it is, so we want extra spaces in the if
conditions below.

Otherwise, LGTM.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +    if (rc < 0)
> +        return rc;
> +
> +    if (domctl.u.getdomaininfo.domain != domid)
> +        return -ESRCH;
> +
> +    if (info)
> +        *info = domctl.u.getdomaininfo;
> +
> +    return rc;
> +}
> +
>  int xc_domain_getinfo(xc_interface *xch,
>                        uint32_t first_domid,
>                        unsigned int max_doms,


