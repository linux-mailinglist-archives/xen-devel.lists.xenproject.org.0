Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111B3763261
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570251.891923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOavR-0006Ig-RW; Wed, 26 Jul 2023 09:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570251.891923; Wed, 26 Jul 2023 09:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOavR-0006G0-OY; Wed, 26 Jul 2023 09:35:21 +0000
Received: by outflank-mailman (input) for mailman id 570251;
 Wed, 26 Jul 2023 09:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOavQ-0006Fo-De
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:35:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9cf4dad-2b97-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 11:35:17 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 05:35:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7265.namprd03.prod.outlook.com (2603:10b6:510:24c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 09:35:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 09:35:11 +0000
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
X-Inumbo-ID: b9cf4dad-2b97-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690364117;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jNmmY+NO2EhkOFX7iHrNJPZ6no1mtsrD7TGuLC2I3RI=;
  b=AnMXHsA6elLCz3vz1EDH9iHP80nAqSNw8zoVf8wDeFI4hefs+4i4esAr
   RwTMgmBmiBFOE1qqCg5FlXhfN+tQh1+2edCqwrppqNXwrh0NIqg2+dtEw
   H5WKEWM7ClNwsLlU4S+mFC8R5oIe8ZbTD6H0lWW/V/rqt6GiEVsM05oji
   I=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 117498820
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MCDAp6BsLasNVBVW//niw5YqxClBgxIJ4kV8jS/XYbTApDIqg2FWz
 msWCGyEbP6Na2L2cttxOYSxpBkGv5fXyt9nQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3Lp0IEFi5
 aUiEy0yakncusiqn46lY7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDa7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqy3w17+fx3uTtIQ6GqG6ytpvnxqq/EMBEEUvd0CSmsOXhRvrMz5YA
 wlOksY0loAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVq68rqXtjq0NTIiBGkOfzIfTQAF7t/gp6k+lhvKCN1kFcadjNf4BDXxy
 DCitzUlivMYistj6kmg1VXOgjbprJ6ZSAcwv1/TRjj8sV0/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:aBW52qFGJCcr0ng7pLqFiJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD/nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MC40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFvLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/blpgR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZOfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIWiYcLQTOvNSSy5uwJzviUK1/NHwgFi/suq6SRg4eMBYYCaka4ORUTe8jJmYRsPiSUYY
 f2BHtsOY6SEYLfI/c24+TAYegiFZA/arxghj9pYSP4nuv7bqvXi8f8TNH/YJLQLBdMYBKNPp
 JEZkm/GPl9
X-Talos-CUID: 9a23:vnjzDW/m479Hl8An+tyVv2hIGeEFXm2E9kzNHEvhVltDVOKpV3bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AGwSQTAwARjdyOWKSaZBRLzYBlvuaqKqyCnwplIp?=
 =?us-ascii?q?BgvOrJzQoAhWGpQ+NbIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,231,1684814400"; 
   d="scan'208";a="117498820"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXUWoi6tbJOaNlTr9y4/NUwy1AwRzefJWA5kTuP+QybgYbd8vRfngoTYoPP0VPL2POhCPWCsmNnzdsvzHRxtIjQqs55OiD+YgUliiuJqr1riqm5GpdLZaCALUCpj5oi48HbrjakZFYieOlpAMLrmVM88u/xXrlsi6TdKOzIgNHt8n1b8+3UcLQgj3DDLt8fqzufgPLc6RrFYwJeJGPmxlefxLpiTHxGNCan/yJeCp4c+Lqli1VFZ+YFsWAXfZDbNbsaJLl5r0Qu4fJhU3TmoxvFf0iE5dN54M+qqRMZN0leTRzeVMIDt3SB6Hmf3dhtVKJi8XV6NSPj9Iv0xRPzEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCLsC0ku5B5hltACDy8oGZ1tmwawrdHwzTyCTqtUdq0=;
 b=JIWPR+47mjVlYnV6l+yVIXgGpO5xOUHSGtQ0RXEPS1vkJMzc1gSaUMfNeaMUki9hjyvCZLYs/UlhLM1zxknoNs0Tblg5D0+iaMsiDpwqbZMsxwzdOwwuU5TNXCBF1macJyNd++xz027Q4nroKC+WT3jrFUvX+8irxf5ogfgQFlOMR+qlw9XqN1Ty0hKLNXMpIAVisRt1uGva1LSS0Lp9V+6kdy2CUiN034VBMSXDSSLwPnF1vV6e72e6FGs3UcR8Qv3wq0pavrALwpmNro4RncV1kb1IwtHFkZGLXIopBJw/J6+kGgMiyI4c8IQpPxki86TmdAbl4mFuHX/gCU91Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCLsC0ku5B5hltACDy8oGZ1tmwawrdHwzTyCTqtUdq0=;
 b=BNXSKomkkGdfzpQIEqgvlHJPPIeqtn02WRRoWshk8XZdUlB8vjyEL7OFUOMRGZKKH1FveEmqmdxzBLZ2j9J1MRUz1hkz3gyqefMAPDpPuruGHN7toO0tlZo8s/+RdxG8L3/MKbIl9r0r+n1azIDDNFd16AD+/gF1znB2SQ0BO5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Jul 2023 11:35:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
 <87ila7cvy2.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ila7cvy2.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0514.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 739b906e-0e3e-492d-d747-08db8dbb9b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s+Kkl+PrRBNxqDqYM3TVV7ESgPy3T7QeZ350tjvWXxpEdkPeZ8w66BH5TbuFi99gsOItQhWz5AHC+dbIhxxCv/BICfyZKzcURymIn1q3z9zGP/xfUxXm9uHVYniWs3OOpoGN1LCYF5Vcx9PWLBNHlhRvSeeCE2si40v5ucPw1D4VK+wKXH4seqY3YWkZkgAmuFX5YRU2QiQbGLSmpOS4Gg8HwFX2Iyvti6sSfkkTWm8GH6YkVnqWi8DW18rREedYIJwAbKKVq9F7fx+d0DF1c/3/BZEcZ9vdMR4MDgLAkbQohlWM9Nd2/3+RcM4YrcMyqTxn2JiCshXjauH6g+3X5mVIG3ES2FzKoX88OIEOmC8eRFJ0k+9/Fhmpzd5RAksTtwq0h4RV4CZfH9g7lpdFDPxbvMMLX7hpfrHFcVSSiCBNiA2j2ymHajRySW6z/rZuizyMud7P68YGRfUkYpvH4/r6G98/VvMW2wLOeWUb5ATCW6apULdzDpDeX/8eRX0WARb/94r4HvAzHmIF1qiDz0MXAURVr5YWMZK6VTanp/Ym2FSvqRs9MHWOrTxbQb+h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(186003)(6506007)(26005)(83380400001)(5660300002)(66946007)(4326008)(66556008)(6916009)(8936002)(316002)(41300700001)(66476007)(8676002)(9686003)(6512007)(6666004)(6486002)(54906003)(478600001)(2906002)(38100700002)(82960400001)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJyNWd3QlJWNVNjWjB3bzNjVHdBRzk0dTlEUEMzcEpONllVWVVtMlA1eFhm?=
 =?utf-8?B?VVc3QURiamRhL0FEOUx0Ny92c21BZHJvb3prMlZTcS9vRVhCOFk2ejUrNkNs?=
 =?utf-8?B?RDNoc1FTT0xWZWVkZnFFdldjWnR5bEsrKzlCQUlsSm9uZk0xM3ArMGFCUWx1?=
 =?utf-8?B?T01ZNC81bm9GaUFnamxpcHlxNTErNGVGdW9WL3Y0bklvUEtrWXBCN0s4SFdM?=
 =?utf-8?B?czZBWmQxUW0yczQ4dEJkczVRc3RFdXVGY3p2K005Rnk2ZDZlSms4MXAwUlM5?=
 =?utf-8?B?SThpWEpEU3RPL2YvVG1LWHlCc1Q5d0h6cmFRdHphYnZiSzBWZnU2c29sSDAx?=
 =?utf-8?B?S1cydnoxTzJNbkVRb0o0amgzR1FIeEFKT3cyUXdPUEpweG8yQ1RwSjlDT282?=
 =?utf-8?B?dVVTcVY2VnJvcEwyOGxuZ2NjVlphVmpMNmxPUUxDb3NWQ3ZpZ2Qrbi9ZeVJV?=
 =?utf-8?B?M3orYkloKzNQRUJ5WFVlbXdyM0Y5NTRlTXk2b3Z2eXJOODVoOHBYZUZGSmg0?=
 =?utf-8?B?ay9UUVFVVGcyZW8vMU9zT2Qyb3ZrYWVRaHdZYnZ4S284N0F0bUNycC9ucDFt?=
 =?utf-8?B?MFZhOStyRldTZmNWczdmWW5XcjhVZnI0OU5WS2RNaGxTdlJ5NFcwS09JZXAz?=
 =?utf-8?B?dXlKa0x0eERPSk5GVlFjeW9RejJ0OG9Yb3JyYklOT2I5T0l3YnhCcklyeWZR?=
 =?utf-8?B?REd6M0J1dlNkRHJ2ZTNiOHNSOE9aVys3dlVxMU8zb0lUdjRsZlo4RTlmZk5x?=
 =?utf-8?B?b0kzSTNTYlVOVVZDOFpwallzVVNOQmpYWVl1b3RqbmZhZFZVNWJaWGNSVW5z?=
 =?utf-8?B?by9TQ3lyN3NMbkF2Qnl6bm82SXI4b0ZobGV6ejE2dVVRejQ1a1VLcUhpMm9q?=
 =?utf-8?B?Zk1welQzLzVNcXpFbDVYOE9hSnRuZEZoa2VYd1FaMGNLVEI4REM2RnRneWJW?=
 =?utf-8?B?Z1ZTb2tuQyt4SEgzU2J4UUR3MWUydmxmZS9weUE3MWw1TC9QMFE5M3NvckVX?=
 =?utf-8?B?eVdYY0hkT0hPM2J0T1JQd2xiajBURDIyZlZCTDNDcGZyU0xoMTVSVWhmeG1u?=
 =?utf-8?B?MEx0cFlOUGVvbnJvY0hkMXBDTitwUXJoV3gzU25MQWhUTEp6UWZZUnQ0Y2J5?=
 =?utf-8?B?WDJYODREMlEyQjBnaWdjRk14bEJhcmpoaDk1elhZYjlOcGI2WUMzdDRaZjUw?=
 =?utf-8?B?OUdiTnVUVHk5eFUzNXZRb0x6OTZYcGdXNXdpOVZJYlpTazhDMU1FOXNZcXV5?=
 =?utf-8?B?UG1lTTc1eWVNelprZUNER0pYYTR4Q2pOL0FodGpnelJ6em5HYUVMY0ZKY01B?=
 =?utf-8?B?MmN1ZjlaeHJBRVVaemNmU0k3TE5jU01NTGlGVXMzRlFIdnNkd2FtbTQzajJx?=
 =?utf-8?B?TlB3MmNKeUN1d2hlMlhMREVvaW9VSmpkTm1Hbll3dE1xaEJUTjYyOHBzZUZJ?=
 =?utf-8?B?ZnNENUtxa3hoMGsrdE1lYkpqZXhwRDRodThFMFYxbHBUSXdFK2RxT2l6am92?=
 =?utf-8?B?a0xRSHA0QmpncDFIRWtlVWgyMFJDa2I2ZThndHNLa3YvcEQwdjJDa082cTVw?=
 =?utf-8?B?ZWdnMFFWajd3NUw2T2lWSGxHU3FzakhFdWt2TjhtS3BkRUJtYmpuWjZ0bXBi?=
 =?utf-8?B?eVNDbzJ2TW03Nkt5SU1NQXFSUEFqZTdCR1BacFk4eFBEZXY0Mng1MCtaWnJE?=
 =?utf-8?B?SmNmdTVyUXM0MjJBUThWVXhmYi9kVEpjMXdOZmd4UC9QT1hncER1Qy9WZXVi?=
 =?utf-8?B?ZWlZa04wSE1aa2hPdERvREZYa1psN2ZTaW9EcjJwZkxHcUdjQjdoUzJob1pw?=
 =?utf-8?B?a2ovU2dOQWVMZlZvT2hSWTlLbHgxTitOTlppQ3FMRDJyeTNudGlGM1d0Y3d3?=
 =?utf-8?B?NFgrUWtoUkl3WUhJR3FFRlBBTEZlazE4Nm1oV1ZSRm9OcEdIRWV1U1kwMEJJ?=
 =?utf-8?B?ZlRsV1lESmVqWGtsVW44c1VPbC9od2xoVnFHTzJ1NzJpUXgwRGk5cktYMlJI?=
 =?utf-8?B?aytHNFkzUnJwSXRNL0JKR3dlUCtmbWo0bjFRZjljN3ZBSWtPUnZLRHljOWda?=
 =?utf-8?B?Y0Y0RHBVZkFsbUZJYkVycFVhb1JTdUZ5aitMeXFrU21pbnIrM1hCT0lPNFJm?=
 =?utf-8?B?NkJpNEdGRDNTQi9UMEJJdjhUSFBUbENZNmxnNHQzdmN0djNobzd3Y0d6U2Nw?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GiAlaQEjtpEcsNyxpdQjp4TSv39u2IyKUgVkRrD3bJZhDlp1AJ4b73L5Rm0LZrJ49jrGdF7+F4mKZSTfEkhOiH0r58hg5UNYZuigvXyxBR+nDNfyn6NBpQvs0LJGAEkL+5P6EemQQFYIeHfDccohz1IF8ndje/Ysi6jQb2MdOJMN8t2DNT0B0h98Esg5D5jAtguKgze6ltj6p+am3W0dxUwXi5unudLNznEO8p+my53aCI/XXqWwhhOx3hSz09FHp2ChakRF1OFbpSURl6ss1PimVjCR0oryT4PVhS7kY9kuFtVyC/Quazs8qLvW/08F2VrYRW0f6a5QNvfi1jQ0nrOlqZaWOaF/7FwC61FSoYXHIF0oQAEg62E21Y0bijTpf6+uC9hqJV4MOPWVjgjhjb1WzH906iuS4k4Hd3QzS7YtmE4cUimhi2bv4NnJlP9U2XgTpe2Pk9wSqkBzmVoi8lMkktBx1ce45O+BNhPT73WFE+I8VqY0cEe3nah/+ne8Ri5Ey0qMoh9zaObQyU/ZFkPGiyk5iVJSmIUe9Uotv9CMk+Q+MqKz72/ZN8JirA7VnsOEOjLlpUcF6E7s2kM8Mql2UgUJj2s4F9bgcbbGba+gyrsk7fiOYOeggiuT2EPgIkaNaXTfA/lH1MSQmTjypDuCSuZdsjfd3kclpyx5oICyauJEJ6wxrOo5Zwjve2iL90mo6tJlUQ3SCYQ3U/aHBQMzdcDeaxSXbbwPV3iUYNQ0+skcy0TcjFANHPICPacJLQ6Ug/Wx8xkoiScO09OxQc2UJFz+wghcOSrXMcFfgN0X3I6jODh0AZFzIH6ApE3kr1ICnFtIsz3wpaVT8IiG4A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 739b906e-0e3e-492d-d747-08db8dbb9b5b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:35:11.3092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pH99//EslV0OfDghoJHt+l0scqketwqVIy/iplB1Ao3v0KOq6wAbtfWc/nRegZoN5n0K8yaRNAydRFhtEb9VDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7265

On Wed, Jul 26, 2023 at 01:17:58AM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> @@ -498,6 +537,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>          ASSERT(data_offset < size);
> >>      }
> >>      spin_unlock(&pdev->vpci->lock);
> >> +    unlock_locks(d);
> >
> > There's one issue here, some handlers will cal pcidevs_lock(), which
> > will result in a lock over inversion, as in the previous patch we
> > agreed that the locking order was pcidevs_lock first, d->pci_lock
> > after.
> >
> > For example the MSI control_write() handler will call
> > vpci_msi_arch_enable() which takes the pcidevs lock.  I think I will
> > have to look into using a dedicated lock for MSI related handling, as
> > that's the only place where I think we have this pattern of taking the
> > pcidevs_lock after the d->pci_lock.
> 
> I'll mention this in the commit message. Is there something else that I
> should do right now?

Well, I don't think we want to commit this as-is with a known lock
inversion.

The functions that require the pcidevs lock are:

pt_irq_{create,destroy}_bind()
unmap_domain_pirq()

AFAICT those functions require the lock in order to assert that the
underlying device doesn't go away, as they do also use d->event_lock
in order to get exclusive access to the data fields.  Please double
check that I'm not mistaken.

If that's accurate you will have to check the call tree that spawns
from those functions in order to modify the asserts to check for
either the pcidevs or the per-domain pci_list lock being taken.

Thanks, Roger.

