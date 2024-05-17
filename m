Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3428C852E
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 13:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724042.1129235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vLV-00074S-GC; Fri, 17 May 2024 11:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724042.1129235; Fri, 17 May 2024 11:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vLV-000723-DP; Fri, 17 May 2024 11:01:53 +0000
Received: by outflank-mailman (input) for mailman id 724042;
 Fri, 17 May 2024 11:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7vLU-00071x-6Y
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 11:01:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc049559-143c-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 13:01:50 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB9242.namprd12.prod.outlook.com (2603:10b6:a03:56f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 11:01:46 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 11:01:46 +0000
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
X-Inumbo-ID: dc049559-143c-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiC8dxKe+RhjJZSdM7ctyKM+TMP5RbT2UF3kXDBfeFT8E1Sp2f1CfEfPg0SWig9rset6gA9Ae0U4ymGpn6C++McjiBBHKUvwrH2WvBtvndf9CUgPSW3D1kSoAZ5m8kJEVjDwmSxM+NoyG+1g87Dk+9vZ1BMfBp3ggIZV9krA8v1eJV4me/UAgh+0Wr5cwZTK5sBRksSUMrYvZPjHtVCGg6Kvyv8MSqbRzzdIq4N9C8ULsjPCt82fj0mvC5MHVbVJzw/KH7Cmr2fDgf3eMsnKBVz6EumCEaDHKOkyqPA3h2BBRjbjVWrc44z7A8mF0zksA3diHrHOz11Fav9Upoz+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXUspc/KmdqKgmU+4BNvCueklnSAmJrXNnaG2f1FFAA=;
 b=Gc1l/YMxc13wpZHl/835GVnnoVt80GN+wHha0F8+nkd6ty8u3ClbQ3nxkNyepPpugk9vfc9FqMzZTlwS6Rh82aM77DtWD+iOaBOst/9uLDtX1felTD+cznnI4iR7pJPjPKipwvj0cB+kUu+kM8fcr2nnCuQQIALe2zmI8Ao9P1Cn3For8klUdFuKZFb2/kw5aGouQ6JtBJHOcUtUJy8ev0Om7dPwGXEXSldI79wEiuJwFFRCsSvHxBPCZItwKp7i88C+KpDKtFymhd4RWhiPS21Z9+dduJ0UFlTUWZ0fqOX9fc38RufTZpnPiVlJK+xtn2tpTag0+ag6phjFP/Zsig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXUspc/KmdqKgmU+4BNvCueklnSAmJrXNnaG2f1FFAA=;
 b=xeWw63UTCOwm5KPUWGqSvOdeLzhdcgg/x++VzJJGpw6JaqUGNblxZUKXSMlNdvJoZJKqy7UZzcMOOiWEnrFazdlF/ctPcDqnT/Huf9+f+6OjPTY6oc68rbY40h2gx2vmStjXYJCmL6VZRx67FdxFRs8x25rRXjdrS5MfqTn2sT8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Index:
 AQHap3bYcGtlWtrcpEyRLTK5fjq5SLGZ1UMAgAFwSAD//9GPgIAAlWQA//+DzoCAAIa3gP//hO2AABFvioA=
Date: Fri, 17 May 2024 11:01:46 +0000
Message-ID:
 <BL1PR12MB584920177282E2F65C7A3DD9E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
 <BL1PR12MB5849CCF9A890A7DA969F6474E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <8d96e75d-5ca1-4276-9ddc-b46b11949fc6@suse.com>
In-Reply-To: <8d96e75d-5ca1-4276-9ddc-b46b11949fc6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB9242:EE_
x-ms-office365-filtering-correlation-id: 0d3e26b7-763a-430f-6324-08dc7660be74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|7416005|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VXlrYWxxZmZhOS9URUx3aDF2QXhRc2h4L1p4a2RFTVgvUEEwMGkyMTZhUnRz?=
 =?utf-8?B?UnBwdzdXK3hhMEVCbXRoUmxWQXlGWjh4RUNxSy9oNm5QRTk3Yk94Qktxam95?=
 =?utf-8?B?eWlkRmRYNjZ4SXV3dW95SVVEa0ZiNzN1ZkViMWN2UWxIQS9mYVNhZWJHN2cy?=
 =?utf-8?B?eVUvYy8rbUZyUVBuNS9hRHNucHBLUFJBM1Z1OGhuNmx4c3FmUlhOV25MQWJo?=
 =?utf-8?B?MWFMUlA3S1RuRVliZW1CNlJCWWk5MjBOSGdFRE1ycHB4KzVvbkw4b2F1NnVZ?=
 =?utf-8?B?TzcwaU9zaklYZ0JIdlh4ZnlJNDNhOVpSQ095YjY0TllKc0cvdlNqNFg4bCtT?=
 =?utf-8?B?UUwzcjZaaEc1R3FSRThqVHdIRGYrVC9jWjJVYkU1RnNhUnNwMWRyMnlmcXor?=
 =?utf-8?B?NWo3M0FjTHNNaWVqQk11amNZTGxhZEpNN1JOb1ZyNDlmVmlnbGpEQkdLVFkr?=
 =?utf-8?B?YjkvMVpVUjhzY2d1TGU5QkpsSE1uS29aUG1QdzhrTzFBUFBZYVU4NzEzR1d1?=
 =?utf-8?B?bEc4OWxpYzJ1YU1SNklndG5JU2VFcFdpNWxSbTRIQ2hVZDlKU29FR2pncHcv?=
 =?utf-8?B?UXd1OXliaTRwK08vdmxTZXhHb0JoSmtsdzEreVNrTFBsODJiWGV4K2tubVk1?=
 =?utf-8?B?MW5NaURlWVA1T0ErY3hSb2FsV21Fc2hlMjdkVk12c2VxU05RUGtrSHdWS1RK?=
 =?utf-8?B?VTk2RnVTZUwxSGpUd1RkRGQ5djQ0ZXVDK0NsTXhxeTVPaUp6MkJ5M29SdU04?=
 =?utf-8?B?NjBXZ0ZCbDB4NHd3bU03ZXBQRUpzQXRkNktRdXBaWjNMc1Y3eHFER1VQWGRz?=
 =?utf-8?B?ejc0bFp2RHp0MEpvMlp6c1RiTTlPdEkvcjF1bERLanJLWDJ6dzBpL1lhSFRs?=
 =?utf-8?B?cFdzbG5MSHIreXhJc3dxbjZyR3dlTE04ZXh5MjhEWGtwd2lsNC83RTcwdkFz?=
 =?utf-8?B?SEwrcC8xOU1va1VXQUZubUJVazlTOFVackZxTmhNVkxTS1RaZFlOWkwvKzRn?=
 =?utf-8?B?eUVpcjVnSFlvbHdkR1NhZVZQdU4wU0dBV1FtdjJWQ0JxdUEzZDJUUWsvTmRi?=
 =?utf-8?B?NkloRHhWVFBIQmsxTFlSLzY5ZE5JZ3NJQkpscjcvMHJuTFhVc3MxcnloK1Fs?=
 =?utf-8?B?aVVQeWxLR2wxZTlTZkVOVkF1VDVpNCt6V0ZIRmNSSG4wT3U4YTYrOWxNZmgx?=
 =?utf-8?B?ZG5sQjdWVzMrMzlsMGJENnNqVDRtWlZpdVB4bEZwMmpmZWprSnR0Q0V4eFk5?=
 =?utf-8?B?TEdtQnRFV0QzWUdtVi9kTW9LcWtvU2czZ0RDZ1M5MlVvNHB1VnZpclVGdUtI?=
 =?utf-8?B?ak1MUEw4cTVpWm5HYVlxS2QvWEsrTlZCWWRrTllpWjh2VGp5MDIzYmFzK1M2?=
 =?utf-8?B?K0lUM0t6WHhHNHkrRStJanBQZFhtWVV1VXBFelNPQitlcGw0QmpIVU5uSXFa?=
 =?utf-8?B?Y1VxQWVYdCtORy9ETGdZRWtZaU9za3FrQjEyc1hheG10TmdjRDFTUUJ2Tytp?=
 =?utf-8?B?SGVTbHM0R2dNQ0wyb2dFcGQrbUZqUC9Uczh1Zy9TcVdNbXhnYnlqNWMvMjNC?=
 =?utf-8?B?TWpmMU9aWldRS3A0ZTR1ajdiYVpadXFsQk4wTEdlNnpjWXBJQktWUHYzR0RT?=
 =?utf-8?B?eXFrdDBEVEZlMm1jeVNBb2J2UVJseC92WXZGZC9QYTc0V2NZUm42R0d3WUJs?=
 =?utf-8?B?TEZGa3ZQSlJVQUVweGpGWlp2dldIMU5takNOVWR1NWcyazF6VmxkUC9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0RsWWNXaUU1a3M1YVdtNWtTcGYwdnRvNzBYVnZtQytLWGlYV3JmQ1ljbEoz?=
 =?utf-8?B?MnVVT08zSk5oc0ZDNE04azA4ZmZiMWliVkI2Q200RWhpblpxVTJhcHAxb2tD?=
 =?utf-8?B?N1g0bWs3Y2l4dzNrQVJib3BTUm4zTVZpZlhoY2FZWTNGeVFVNUI0WEZ5SVRS?=
 =?utf-8?B?cHpucnh6TXFJSzgrSVRISXJ1VkhWemk2SVNzT2NkQWJJcGRYSWYrRC8xMGJz?=
 =?utf-8?B?b2FDeVpPR3dGTGdYaTU4dmpESGFXWU04RDlMeTkwMXBZOHRnb2RHdGNpbmlx?=
 =?utf-8?B?MVVIQmtmQXdieXMxTXBoYlAwMk9xMW1wRDBEY3kvYWd2WGkzSFlCQUNkYjBT?=
 =?utf-8?B?QVhnQm1hdXNITFdBREUwdTNid0VFMVF6bUFXMDdJcFJBem4xTkYxY0JJYmVL?=
 =?utf-8?B?ZmJTZlVwcm9oUGg3N2wvRlIzbXltN0luc2VGK2J0ZnhyT01ydEN6bmF0OFZR?=
 =?utf-8?B?ZEFjVCtTTlRTVFFpc2ZMcm5Sd055cFphUzlleW1ISjJhSDQ3NmV3R1p2bVZy?=
 =?utf-8?B?RTk5YVg3NzdZWnBsRG1hK1N4bWFUaXBJZm5GdmJNbWFJTnBiNG9WZXExY3ZZ?=
 =?utf-8?B?UXkzMDJyUEQzM3BIT1RPaHJWb21BZ3JQTUZVUmIwQVBpd1hNNFEwUGU2V21l?=
 =?utf-8?B?VmNwZVNaWENNbExJVVdhZ3BRaldZZkFYK3NJOHN5cTZxR0dOTE5DclppWWFH?=
 =?utf-8?B?ZC9XSXl2ZHVTbmpiTjJaVVEweFQ4MGF4bTk2UmtQSG9POUlHSnIwQ0JVU1hR?=
 =?utf-8?B?RXRQV1FhNHdWYUI4elhTejVOTmhNQWdKUk9pcjdvUnNMdGYyKzRTMWlLQjd1?=
 =?utf-8?B?M2t0TUlBUHJ1eWRFdDlwRm9BK0RuUU1xOTl5a3FQOUVTRE1NMEc4SUV3ZlpQ?=
 =?utf-8?B?cXNFS05ERXEvS2NMM3hISmpyb0tRZFVFQ3BERFVCc2JVZWJPN1VpU0JTMzdY?=
 =?utf-8?B?aXdNd0NFZ2FPa3c4akdlbWFoQ0tpUnlwMk1wM1FubEJSWXpXMHNZVFlCdmsz?=
 =?utf-8?B?OGpLZS8zckpsYUlOdC9mcC9KbUNhcmRaL1dxSFYzRzllc2dwdlNiemRobkNl?=
 =?utf-8?B?UEl5NFl3UmVOUVNyWUtIODBNalp3WERFVFYxSEd0azloOTRmaXpTeWRZQks5?=
 =?utf-8?B?clByZ1BiNVRQWklJdjhpNVFiYjI3NnBVdWZ5VktYNEtLQVE0ZFZteFYxNWNm?=
 =?utf-8?B?U0dzaVhVWWZldUlHTHhzelNQL2IwZmlYczlXQTNCYkEyQ1Jja1YwOHFOUjU4?=
 =?utf-8?B?d0E3RDZhdXVackd3aGVpbWZtaUF6TDg3MWNXQmRNaERBKzg2ckJzWnhCbkI5?=
 =?utf-8?B?c2I0MWg5VTVJcnMrQXlzeDV4VVNSOHIxMlk5eGdvMkV4aTdGVFBLKzZqNDNo?=
 =?utf-8?B?eHE3ZFZ0d1VydUgzQlBMVFpsVkZvYkZpdnBCNTRQVmlqL2NJSVlUVnVQOUd1?=
 =?utf-8?B?TFRxdVhKOUNYdk0rWHZFTVVLNDc5dnVGU0RRYzd4N2ZBRm5oSmo1eTV1MDky?=
 =?utf-8?B?b3NvcHh6UkJFSk53M2M0MTluSFlSS3BydytxZ1BqbGd1SWpHbVJuK2h3N1ov?=
 =?utf-8?B?cGVqREZiU3VsQVpObm5NQXpvbkN1MzBjUHVic1AxV1RuQzRwc0Q4V0ZFcEdi?=
 =?utf-8?B?cStHN2NLYU53eEp4MThDS251SUludk9FTmt2ZE1pQ1Z4eUJ4ZGQwUHVkS0pk?=
 =?utf-8?B?V3c1eUpwZGZJRWtHUHgyaWFsY1lEelZKbXVQeFJGZXNvY25WSUhYV25qTGpV?=
 =?utf-8?B?MG5IQXdlbzZoR1RBSFByV3BVdnFWTVZoYjNOMDBseGRpcmFzZ3R0L3czVjlF?=
 =?utf-8?B?cEhLbFcrbUpSdllHaDhEVWc5RGVSREVNS3Q2b0VTREVIbXNkMi9PdG0yZGhz?=
 =?utf-8?B?LzZ2dnBjZm44aWI0SG0yWERaTzBDRUl4RDNVWVMreTZ5a0RJU1pjZkV2OUNZ?=
 =?utf-8?B?ZDJCWXZuNlRJaUdsZFlDbiszL2FvOXNSS1BGOVN2VCttSnhTREY2YU9Pbk5l?=
 =?utf-8?B?R1ZFRTROWXVXRDgwV1JReENZYWhJRzhXR2ZWOTYva3hQMVFGbEl0VjhWSnRp?=
 =?utf-8?B?TVcvVkUwcU5DYnIvZUE4NUJvQUVBNENBWlZDaFdYVlppeUtuVTZ3dk9IbFdu?=
 =?utf-8?Q?89q4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <909C897AAAEB7545839542F468F90B2E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3e26b7-763a-430f-6324-08dc7660be74
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 11:01:46.3587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v9ozi1jajwakRfHCc7Pt19vCXcHIQjs01W2Zv4efcU6Afkq4YuJKT9JqT+EGdtzEF+3D35g95lwvRYookZTpXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9242

T24gMjAyNC81LzE3IDE4OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDUuMjAyNCAx
MjowMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzE3IDE3OjUwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNS4yMDI0IDExOjI4LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNS8xNyAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Ny4wNS4yMDI0IDEwOjA4LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNC81LzE2
IDIxOjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTYuMDUuMjAyNCAxMTo1Miwg
SmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+PiAgc3RydWN0IHBoeXNkZXZfcGNpX2RldmljZSB7
DQo+Pj4+Pj4+PiAgICAgIC8qIElOICovDQo+Pj4+Pj4+PiAgICAgIHVpbnQxNl90IHNlZzsNCj4+
Pj4+Pj4NCj4+Pj4+Pj4gSXMgcmUtdXNpbmcgdGhpcyBzdHJ1Y3QgZm9yIHRoaXMgbmV3IHN1Yi1v
cCBzdWZmaWNpZW50PyBJT1cgYXJlIGFsbA0KPj4+Pj4+PiBwb3NzaWJsZSByZXNldHMgZXF1YWws
IGFuZCBoZW5jZSBpdCBkb2Vzbid0IG5lZWQgc3BlY2lmeWluZyB3aGF0IGtpbmQgb2YNCj4+Pj4+
Pj4gcmVzZXQgd2FzIGRvbmU/IEZvciBleGFtcGxlLCBvdGhlciB0aGFuIEZMUiBtb3N0IHJlc2V0
IHZhcmlhbnRzIHJlc2V0IGFsbA0KPj4+Pj4+PiBmdW5jdGlvbnMgaW4gb25lIGdvIGFpdWkuIElt
byB0aGF0IHdvdWxkIGJldHRlciByZXF1aXJlIG9ubHkgYSBzaW5nbGUNCj4+Pj4+Pj4gaHlwZXJj
YWxsLCBqdXN0IHRvIGF2b2lkIHBvc3NpYmxlIGNvbmZ1c2lvbi4gSXQgYWxzbyByZWFkcyBhcyBp
ZiBGTFIgd291bGQNCj4+Pj4+Pj4gbm90IHJlc2V0IGFzIG1hbnkgcmVnaXN0ZXJzIGFzIG90aGVy
IHJlc2V0IHZhcmlhbnRzIHdvdWxkLg0KPj4+Pj4+IElmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHkg
dGhhdCB5b3UgbWVhbiBpbiB0aGlzIGh5cGVyY2FsbCBpdCBuZWVkcyB0byBzdXBwb3J0IHJlc2V0
dGluZyBib3RoIG9uZSBmdW5jdGlvbiBhbmQgYWxsIGZ1bmN0aW9ucyBvZiBhIHNsb3QoZGV2KT8N
Cj4+Pj4+PiBCdXQgaXQgY2FuIGJlIGRvbmUgZm9yIGNhbGxlciB0byB1c2UgYSBjeWNsZSB0byBj
YWxsIHRoaXMgcmVzZXQgaHlwZXJjYWxsIGZvciBlYWNoIHNsb3QgZnVuY3Rpb24uDQo+Pj4+Pg0K
Pj4+Pj4gSXQgY291bGQsIHllcywgYnV0IHNpbmNlIChhaXVpKSB0aGVyZSBuZWVkcyB0byBiZSBh
biBpbmRpY2F0aW9uIG9mIHRoZQ0KPj4+Pj4ga2luZCBvZiByZXNldCBhbnl3YXksIHdlIGNhbiBh
cyB3ZWxsIGF2b2lkIHJlbHlpbmcgb24gdGhlIGNhbGxlciBkb2luZw0KPj4+Pj4gc28gKGFuZCBh
dCB0aGUgc2FtZSB0aW1lIHNpbXBsaWZ5IHdoYXQgdGhlIGNhbGxlciBuZWVkcyB0byBkbykuDQo+
Pj4+IFNpbmNlIHRoZSBjb3JyZXNwb25kaW5nIGtlcm5lbCBwYXRjaCBoYXMgYmVlbiBtZXJnZWQg
aW50byBsaW51eF9uZXh0IGJyYW5jaA0KPj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC8/aD1uZXh0LTIw
MjQwNTE1JmlkPWIyNzI3MjI1MTFkNWU4YWU1ODBmMDE4MzA2ODdiOGE2YjI3MTdmMDEsDQo+Pj4+
IGlmIGl0J3Mgbm90IHZlcnkgbWFuZGF0b3J5IGFuZCBuZWNlc3NhcnksIGp1c3QgbGV0IHRoZSBj
YWxsZXIgaGFuZGxlIGl0IHRlbXBvcmFyaWx5Lg0KPj4+DQo+Pj4gQXMgYWxzbyBtZW50aW9uZWQg
Zm9yIHRoZSBvdGhlciBwYXRjaCBoYXZpbmcgYSBjb3JyZXNwb25kaW5nIGtlcm5lbCBvbmU6DQo+
Pj4gVGhlIGtlcm5lbCBwYXRjaCB3b3VsZCBpbW8gYmV0dGVyIG5vdCBiZSBtZXJnZWQgdW50aWwg
dGhlIG5ldyBzdWItb3AgaXMNCj4+PiBhY3R1YWxseSBmaW5hbGl6ZWQuDQo+PiBPSywgd2hhdCBz
aG91bGQgSSBkbyBuZXh0IHN0ZXA/DQo+PiBVcHN0cmVhbSBhIHBhdGNoIHRvIHJldmVydCB0aGUg
bWVyZ2VkIHBhdGNoIG9uIGtlcm5lbCBzaWRlPw0KPj4NCj4+Pg0KPj4+PiBPciBpdCBjYW4gYWRk
IGEgbmV3IGh5cGVyY2FsbCB0byByZXNldCBhbGwgZnVuY3Rpb25zIGluIG9uZSBnbyBpbiBmdXR1
cmUgcG90ZW50aWFsIHJlcXVpcmVtZW50LCBsaWtlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0YXRl
X3Jlc2V0X2FsbF9mdW5jLg0KPj4+DQo+Pj4gSSBkaXNhZ3JlZS4gV2Ugc2hvdWxkbid0IGludHJv
ZHVjZSBpbmNvbXBsZXRlIHN1Yi1vcHMuIEF0IHRoZSB2ZXJ5IGxlYXN0LA0KPj4+IGlmIHlvdSB3
YW50IHRvIHN0aWNrIHRvIHRoZSBwcmVzZW50IGZvcm0sIEknZCBleHBlY3QgeW91IHRvIHN1cHBs
eSByZWFzb25zDQo+Pj4gd2h5IGRpc3Rpbmd1aXNoaW5nIGRpZmZlcmVudCByZXNldCBmb3JtcyBp
cyBub3QgbmVjZXNzYXJ5IChub3cgb3IgbGF0ZXIpLg0KPj4gT0ssIGlmIHdhbnQgdG8gZGlzdGlu
Z3Vpc2ggZGlmZmVyZW50IHJlc2V0LCBpcyBpdCBhY2NlcHRhYmxlIHRvIGFkZCBhIHBhcmFtZXRl
ciwgbGlrZSAidTggZmxhZyIsIGFuZCByZXNldCBldmVyeSBmdW5jdGlvbiBpZiBjb3JyZXNwb25k
aW5nIGJpdCBpcyAxPw0KPiANCj4gSSdtIGFmcmFpZCBhIGJvb2xlYW4gd29uJ3QgZG8sIGF0IGxl
YXN0IG5vdCBsb25nIHRlcm0uIEkgdGhpbmsgaXQgd2FudHMgdG8NCj4gYmUgYW4gZW51bWVyYXRp
b24gKGkuZS4gYSBzZXQgb2YgZW51bWVyYXRpb24tbGlrZSAjZGVmaW5lLXMpLiBBbmQganVzdCB0
bw0KPiBzdHJlc3MgaXQgYWdhaW46IFRoZSBleHRyYSBhcmd1bWVudCBpcyBfbm90XyBwcmltYXJp
bHkgZm9yIHRoZSBsb29waW5nIG92ZXINCj4gYWxsIGZ1bmN0aW9ucy4gSXQgaXMgdG8gY29udmV5
IHRoZSBraW5kIG9mIHJlc2V0IHRoYXQgd2FzIGRvbmUuIFRoZSBzaW5nbGUNCj4gdnMgYWxsIGZ1
bmN0aW9uKHMpIGFzcGVjdCBpcyBqdXN0IGEgdXNlZnVsIHNpZGUgZWZmZWN0IHRoaXMgd2lsbCBo
YXZlLg0KRG8geW91IG1lYW4sIGxpa2U6DQplbnVtIFJFU0VUX0RFVklDRV9TVEFURSB7DQoJUkVT
RVRfREVWSUNFX1NJTkdMRV9GVU5DLA0KCVJFU0VUX0RFVklDRV9BTExfRlVOQywNCglPdGhlcnMN
Cn07DQpJZiBjYWxsZXIgcGFzcyBpbiBSRVNFVF9ERVZJQ0VfU0lOR0xFX0ZVTkMsIEkgY2FsbCB3
aGF0IEkgYWRkIGluIHRoaXMgcGF0Y2gsIGFzIGZvciBvdGhlciB0eXBlcyBjYWxsIG90aGVyIGZ1
bmN0aW9ucyBpZiBhZGRlZCBpbiBmdXR1cmU/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVn
YXJkcywNCkppcWlhbiBDaGVuLg0K

