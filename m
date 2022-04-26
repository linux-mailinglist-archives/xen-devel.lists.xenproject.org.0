Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C750F1BF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 09:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313466.531001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFHh-0002yD-KB; Tue, 26 Apr 2022 07:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313466.531001; Tue, 26 Apr 2022 07:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFHh-0002vM-H5; Tue, 26 Apr 2022 07:06:53 +0000
Received: by outflank-mailman (input) for mailman id 313466;
 Tue, 26 Apr 2022 07:06:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU5=VE=citrix.com=prvs=10866150f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njFHf-0002vG-Of
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 07:06:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7024ae3a-c52f-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 09:06:49 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 03:06:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4838.namprd03.prod.outlook.com (2603:10b6:a03:131::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 07:06:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:06:43 +0000
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
X-Inumbo-ID: 7024ae3a-c52f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650956809;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mNKzBOORQKlziI4DJ7+vFlSWrz3yE7Flrx0i8KYJWws=;
  b=S0I5wTUl4OXbvVio/hnr1t8lkSlu9CNb9OoIknZYn0IZL4Yr8WQtiUEa
   79aLOoXAt2LMQxs9dx4cgwVlOKlKb2ffbRJRZEFPQNJfPFNOnvHyKT6Rb
   wSgJV6KIQsbOM03T2WEsrLq+hAaAxVDenyB3E4eOlGgSyn5qF72gniwJW
   k=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 69320574
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6nIhYqrPo2sfcCAt8Qjz7dcWKx5eBmJ4ZBIvgKrLsJaIsI4StFCzt
 garIBmPM/bbM2Lyfdt+YIW1oU9SuZGByoA1GVQ4qH00Ey5AopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 42q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBY4/1lNsiWgdkPGJYBqwB54XrIWCBmJnGp6HGWyOEL/RGKmgTZNRd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFg3Fp2Zwm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrL9PFtuzWMkGSd1pDmKeTbQNy7FfkE3U+jt
 z+ZvGjhBDwFYYn3JT2ttyjEavX0tS76XpkWGZWg9uZ2mlyDgGAeYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflhsVWt4VH+hk7giIk/PQ+1zAWTRCSSNdYts7ssNwXSYty
 lKCg9LuA3poraGRTnWesLyTqFteJBQoEIPLXgdcJSNt3jUpiNhbYs7nJjq7LJOIsw==
IronPort-HdrOrdr: A9a23:Ygb+Nq6WObQAaDH2pgPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.90,290,1643691600"; 
   d="scan'208";a="69320574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvEv63oGToaaibB+CFhYB4TDJiSOSieY2a6MWs9L2TpYnhRfzv+8/BcF5D2DbIDskL/1SqLFC3V7IyS1zSrNgRbEy+qYqLPaZY9ojFanAewfOC8Ciuq/iGJ8tgPQhSb+M06VPcTNuagIimVTbfvCuXJDXyy46s1e57XnSZkNu5t0UWG/dEKE1b0eMAEKbFWHRbk1/7gnwQJ5IzCFLobj4YhmK7/6a1F5rRvo3qxJ4b7LDnlyt7TqOYIZygvS26hVQqb/NmX5FXh5Nu1FLGfMFLWCsWBx3tHbyjMvaH5TsfUNwe9ECvPRLcAWgdBMMXYuo+eRif3hZThHmbxX0zS4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tb5knrh+daCPNrHN00hxV2sQj33vMgeL3TVFsgtYrPE=;
 b=XOv3aQCTSfMAy7BIJhqz0mrvQK/Eh38KMn6dLs9DqQiq2u4VQkMyqv0FtHi6dj47o9aIxuV1+33g+uGgjdgHinYfgm9KiPg8LEiBCJYPFgInCsJXG2si4cO6qlEvk4qgpxzUNFpJ2WOIKO0cEDsq+MFUTBIfn+0hzbCw5oM7F79W5qcKXH6f42WRdoVoOWpznxxbXZynuLiioHjW4RmIcfTDQ7Vic4ARPGuagoPn1MoBtPVxHzA6zdSfsbmEBHGfF6AP5AYgyjY6xWYfyL4tHJt/M0vff+Aob0FCF1lqxYn1RoZEV7vpKEZNGVTKrfzgZldE8SIwrjJ6tqAXaSmBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tb5knrh+daCPNrHN00hxV2sQj33vMgeL3TVFsgtYrPE=;
 b=M4h6bF4iwH34hdXYq/RDysQ4Xf+weuxV7+w8FDf/17zxWGlPj/EvrT1gtQTg44Wt6PCFdsCdY13SIX5LPKvjj3IkQ7Gyz+oOTPQ5kFWd4k+s9wmOQQZy/sHLPZpStbCJoxvV0JvwF90r29RXNTd2JvkY+9IquDmeTckn6wrBtfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Apr 2022 09:06:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Steffen Einsle <einsle@phptrix.de>
Cc: xen-devel@lists.xenproject.org
Subject: Re: DomU Windows Server Essentials crashes with xen 4.16 but works
 with xen 4.14
Message-ID: <YmeZ/8wtKJy7zzmS@Air-de-Roger>
References: <18bd542a-a649-c78b-b575-c62b4d533e44@phptrix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18bd542a-a649-c78b-b575-c62b4d533e44@phptrix.de>
X-ClientProxiedBy: MR1P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae1e054-b9bb-4453-139f-08da275351ce
X-MS-TrafficTypeDiagnostic: BYAPR03MB4838:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB48383E2EABB717647292B5E58FFB9@BYAPR03MB4838.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dek1hTQsXV+S1MsD9WGJpdFjS0q5gUVHChIOBNlscPCy84v57+NSpq5gZFWfKlIKleVuGfsqhZEGw5EkCfWDZa6ILpZBAaYhtPZdSdOtmN5a15WPY4q0W9uDJO50YbY0nZEGBr3JknWL86YbCfH/lYitEM1HZAu1nEkSTGbpVglfnYAUwLE3p3pyXpSfk0PR+PU80CE/oUAR7ykb8Twl9jLTgrDu07B19TlW7naCstSSSqe8Ug52NgyQ2hhvwbbyU0O+lxVvXIt8M9oVboH+R7Wx/Z65xBL6/86cnwnTwfMluBmKFg9Vqw1QIPu6PTe04HbfafYVDAU8ejyAzY3juXzuXCW+uRt0GqF8+kuBYMRoyYss49u3qtUJwFvgNk2ctlMuZ4V5LrSiU3J53J7BaxYF1pYUVyVeqvFyhc+AAvHw7osIR+dU5rUF3yH31sOmWYO89ujUsj7HMl69I3EJPdSrZ5wlTQ6c8u1TMG68+bYaWX4H1B3vmyWDdbRbimdiRGGfjzIZnoAqflbabtHD23Ap2vpjnwjl3n71Ds3U+heuGFkxbzk9oAAivEkicrOYX9nTALXNBHHblS6sQiGWJobh8bTwARW/UidZBfXGRhnD/LC3E/X0lHmn5+ofJC1kS//d7rYXNx1BbQLKcIV5uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(38100700002)(85182001)(8676002)(66946007)(66476007)(66556008)(5660300002)(4326008)(26005)(2906002)(186003)(6512007)(6666004)(6506007)(9686003)(83380400001)(6486002)(508600001)(316002)(6916009)(86362001)(82960400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDJGcllEZ1QzVGU1UlI0b1h5NGRXOXliOUhoeW42UWxCUlJUVnNpbGtYRS9n?=
 =?utf-8?B?R21peEdiOXptaGdNWlFoVUFjZFc0bUdlS3YrVHU4dURybExEWjd0MjhnTXQ0?=
 =?utf-8?B?Vnc4UmRRYjBYZlV5K1RsRXJrdGxGVFhiZlhBdDNTbVluNWhQSzd5NGtuaVBu?=
 =?utf-8?B?V1h1amh0L29EWW1xdUZ2L3RqYzF3Ui9TZk1LaWdyKzNxNmhWWC9VbHZldGxD?=
 =?utf-8?B?TjVRNXA4YWF1N1R6Q2kwaTg0a1FXdmUxcGlraEF4MWNsRXVqWHBxRFEreTJ0?=
 =?utf-8?B?YytCdHVVREFJVzZxeVFCYkcxb3lvWWx1QWx0OHR3N0czSnVySGtyOTdpek5Y?=
 =?utf-8?B?M2lqTkJ6cGcySEZZTE9qNTM5TU1rZmk4R2NyMEFUZjNZc1hFNXlIdUpPSVBL?=
 =?utf-8?B?K2o5UkQwSW16VWw5aXdYSTFCYXlQeERmWHFscys1NnEzYTRrc3VIL1BabkRt?=
 =?utf-8?B?WUlOd1BLT1Z6dldRTEZycGNqUlFDcld4dDduY00zSVB6TW9rMDFkNE1Id2tN?=
 =?utf-8?B?MmJ2Vi9UMWF1V3NHdm9zTGtYbmk1YUsrTm5wNCs5VmRnQmJLL1hYblA3WlR3?=
 =?utf-8?B?YjlKWjNGWkFPNTlQV2dnSGJDQ3Z1eTlNR2wzR3VEWTV1dmF0WURWYkhpTTFn?=
 =?utf-8?B?YkphZHI3UExQTkRodFRZZWF4emw0MUZkTzZwSi84cFJBU3c1c0lzeTQyR0sy?=
 =?utf-8?B?R25yMTlxcUNIYzNhSXhFaEdIK3Jpb2Y3UlRCYjEzdlJnTDNPQVpHYnFRdnRQ?=
 =?utf-8?B?dE53bEk3V3VzeEZzWXY2eFBqenc0alVseWtGclMxZXl2czFlNDAyTmY4V0Iy?=
 =?utf-8?B?dmRQTm9DM2x2RGhtZDh2V001N0x5NUJDUHh2NVpCeG96aFpGaFl5WWN6bzZ1?=
 =?utf-8?B?ZDI4RERORS9Kenc5UnNsVTd2VTZxc0kwUlFZOXVqblIxYkxqdmkwemFtMjJJ?=
 =?utf-8?B?MTgyYllJbUVzWUtac1d5bFNoeGFBaWtjUmlicTNUT3dTd2tNWW9aS3N1R0Ju?=
 =?utf-8?B?RkpXRDVwaTE5eVVRS2tuL0FHdjRoNFloaFFOSjRxMExTdGRiTGNQdFdVVHdL?=
 =?utf-8?B?bWlYNGFzSHZmaytsQXpGSEZYQXZaSTdSUU5xZGJLTVc4ZS9FeldQTTRqVUFC?=
 =?utf-8?B?L0VmYXJ3ME5OeDBaNUgyeWx4eWhWc2dPeTdXS2tZZE9Dd1lJNmNCMlNrajc5?=
 =?utf-8?B?V09ZYk1jYWxadCtXakdIcDFJUElhc29SM1Nyc0FHUW5KQU01MkZVSGp1MDVo?=
 =?utf-8?B?N0lZaWt0bVY1TENjRnBxT2JENmhPREIzUHorUitwOWJnam9BaTVGWTNWV21H?=
 =?utf-8?B?cGVaSldXcmNNWVFiN2tWL2RHeU16N1U3K2hBK1BvQ25KQ3lzdUdvNmlHT1hh?=
 =?utf-8?B?ZUpocWhyK0wzUXExUG9laXhNQ0tSTGc1Ti95Vk0rR0VFamxrTjdGdWhSWDg4?=
 =?utf-8?B?SC9Id2hCbDk0QU1lbCtFb3FhcFIrVnNwam1NYjFvTm40NTE0SVErTHZwYjUw?=
 =?utf-8?B?VHdzMXRnSDJrR2RoYW54ZFE3OWhXZlJvcWszTlduRzgra2VUWlpJd1FqZ3pi?=
 =?utf-8?B?dFpnVlIyQjk2cFNNcEQ3OVNwM1VpLzZxeXVyL09rSUZwSlEwQWZQeERvdVJ1?=
 =?utf-8?B?VVVLNzBsUk9DMmJJZENaaEF3NE9nWU96MllqU0hNV1F4ODRMTitaSHM3REla?=
 =?utf-8?B?eVRmN25qTitxaU80R01rbWlrVVE1MEhYUktoelpRQmw1MkVqaTVpZnZXcFNs?=
 =?utf-8?B?amVQTGw4ZUkvTDdsTjBlTWc3blY4RlM0ZzB5NER6M3VxUmY2bUxucXoxMERU?=
 =?utf-8?B?MG9WVDFjb3VYbkU5REhOb3FRRUVRTisyemZYakF2NjFqRVZ3dlhuSzFtVDNJ?=
 =?utf-8?B?WnRvcGtwSEtBRUNEWWYyeldDL1RDL2JGOHVEMjV2OWFQeUcwZzBlViswZFhC?=
 =?utf-8?B?UUZJeGdIOG0yUlZ1Vml2eGJFT0w5b1ZkL1FtWldodmdEUWJsS3FTQzIzSWhI?=
 =?utf-8?B?UDNJWnpiZVg5NDdGcktjMlJsUEVFdGl4cVB6TXZzT0xSVzNvditsNnd0Z3Fn?=
 =?utf-8?B?L2E0NFVrVUROYW5HWklSM3Zoa3lteTMrc0xZZUg2TUoweWVNT3l5cjVSYlZk?=
 =?utf-8?B?Tzd0dUFiNWUvWE9pbW1xQTdjNVBNVVNtNEM3aFJrTFpiYW5UZmt1VmJmZWxY?=
 =?utf-8?B?TllDVnFZdk5ZZzZHQlE3RFhlRFBJYW9TUFJuVE03T3pzNWpNNjBlazIvMGNX?=
 =?utf-8?B?V2YzbEFSVXVQZmlNOE5UY1NZdk04aWVEb0V3anBuMzhFZ3FmeFNyU3B3VkF5?=
 =?utf-8?B?ejBORVJDemlRRVRBMzJFTlEwODdUV3UwRzFwZ0Y3c294NFpVbUJCUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae1e054-b9bb-4453-139f-08da275351ce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 07:06:43.7855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMYHnaDiHQtjud+JSgMbzX8YsAc/2jd+fmmmGRc1GLHtUxG3uBgcWpoTeUYMaC6KFTr2J+96Do1gwzV08RfgXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4838

On Mon, Apr 25, 2022 at 07:19:08PM +0200, Steffen Einsle wrote:
> Hello Everyone,
> 
> I have some xen servers I recently tried to update from xen 4.14 to xen 4.16
> 
> Everything worked without problem, except for the Windows Server Essentials
> DomUs.
> 
> With xen 4.16 those domains crashed (reproducable) during boot -
> KMODE_EXCEPTION_NOT_HANDLED.
> 
> I tried to install a new DomU Windows Server 2019 Essentials - this VM
> crashed at the first reboot
> (still in the installation routine) with the same error. No PV-drivers
> installed yet.
> 
> I switched back to xen 4.14 and all VMs booted ok without problem.
> 
> All other VMs (Linux-PV, Windows-HVM (2008r2, 2012r2, 2016, 2019, 2022) 
> show no problems, only
> the Windows Server Essentials crashes with xen 4.16.
> 
> The system is a gentoo kernel 5.17.3, qemu-6.2.0-r4, xen-4.16.0-r5,
> xen-tools-4.16.0-r1
> 
> My working configuration is gentoo kernel 5.17.3, qemu-5.2.0-r2,
> xen-4.14.3-r2, xen-tools-4.14.3
> 
> My DomU config file looks like this
> 
> name = 'DC-Server'
> type = 'hvm'
> memory = '8192'
> vcpus = '6'
> vif = [ 'mac=00:16:3E:ab:cd:50,bridge=br0' ]
> disk = [ '/dev/vg1/ServerSys,raw,hda,rw',
>               '/dev/vg1/ServerData,raw,hdb,rw' ]
> viridian = 'all'
> localtime = '1'
> vnc = '1'
> keymap = 'de'
> vnclisten = '0.0.0.0:10,websocket'
> usb = '1'
> usbdevice = 'tablet'
> on_crash  = 'restart'
> boot = 'c'
> xen_platform_pci = '1'
> max_grant_frames = 128

Could you try adding:

msr_relaxed=1

And see if that makes a difference?

Thanks, Roger.

