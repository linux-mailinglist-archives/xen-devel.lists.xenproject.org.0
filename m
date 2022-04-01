Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B94EF0A8
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297449.506731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIQG-0006qX-KH; Fri, 01 Apr 2022 14:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297449.506731; Fri, 01 Apr 2022 14:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIQG-0006o7-Gt; Fri, 01 Apr 2022 14:38:44 +0000
Received: by outflank-mailman (input) for mailman id 297449;
 Fri, 01 Apr 2022 14:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dc+m=UL=citrix.com=prvs=083d63866=roger.pau@srs-se1.protection.inumbo.net>)
 id 1naIQE-0005di-AC
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:38:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b692d95-b1c9-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:38:40 +0200 (CEST)
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
X-Inumbo-ID: 6b692d95-b1c9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648823920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/OHwMK2W43W0KGDBL0BTrku1ipd+E49VxB19lUZP2O0=;
  b=UOVl8ASfl5GShTg+P21h+ElLuscUZeI8Jji1MpaFoE4T1JFJRTvTUK1v
   meHz/gsMrGMtUcCOQ/uRSrLOzpdFOKmVtdSUHbPfXKWOmfg0xEg4u6QH8
   CsgBkKI4EzU8dP7j8qcVvywoNTTnip+NcW/HfveEiYpWUbWoRuiyRMb2t
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67788491
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ah1P46x90oQXAl1BAJd6t+dNxirEfRIJ4+MujC+fZmUNrF6WrkUDn
 GUZDTiEaP3bN2KgKdF+PYXg9BxS6JbVydViGwc9+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplq428TgQtG4f1hcMaCz99A3tYPe54weqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J8RTaaCN
 pNxhTxHR0XMaSUUBxAsFa0AzfWatED2KTFbpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECvbGI7jVNUltMDwL9+KTnzB7lMz5CF
 6AK0jQ/oa8x8GmBd8TaWEWehW7emB5fZeMFRoXW9zqx4qbT5g+YAE0NQThAdMEquacKeNA66
 rOat4i3XGIy6dV5XVrYr+7J9m3qZUD5OEdYPUc5oR05D84PSW3ZpjbGVZ5dHaG8lbUZ8hmgk
 mnR/EDSa1j+5PPnNplXH3ia21pARbCTF2bZAzk7uEr/sWuVg6b/O+SVBaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuarVb2CG2wY+TsR8n9hIx5JFVdoPiN2ZDB00WvvohBezO
 BOD0e+vzME70ISWgV9fPNvqVpVCIVnIHtX5TPHEBueikbAqHDJrCBpGPBbKt0i0yRBEufhmZ
 f+zLJb9ZV5HWP8P5GfnGI8gPUoDm3lWKZX7HsugkXxKENO2ORaodFvyGADQNrpgtvPV/V29H
 hQ2H5Li9iizmdbWO0H/2YUSMUoLPT48A5X3oNZQbemNPkxtH2RJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:MkXqe612+7eaxtpPs0ZvFAqjBURyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFm7X5XI3SJzUO3VHHEGgM1/qF/9SNIVydygc/79
 YeT0EdMqyIMbESt6+Ti2PZYrUdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngxObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Lh1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESkti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1CfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAw7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1UwKpsKuZOIMvG0vFoLA
 E3Z/uspcq+MGnqJEwxh1MfjOBFBR8Ib1e7qktrgL3m79EZpgE786Ii/r1vop4xzuNCd3B63Z
 W1Dk0RrsA3ciY3V9MIOA5Te7rBNoTyKSi8Q156Z26XVp06Bw==
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="67788491"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFiuzCjOlIrhdZYuKlhYgyK4O9dhq+9EQiDR0v4W5uEzXcpVYjz6ztXC+MASFMN6/6vP8vN8/dLL5PDLPAIGU5nddulvngYLi7bLg3AMOc88dCOBgFqM0wegndb1DgtN9RTwyfxVK2xfeemyrr4MJLoV/0XH8jWCSkKZqDHrCyjc/xRK61MuvMuCEobVpN4mjN2pJvcNxCDtX+tfyPSdflFEKgxwmTLqx8gqRnvIAFkiIhyncHtkRygRVw1QaAu+flkpNzj3qa0h6mM60Qc9/U+MwBq86dajwel7UCuw6FwEsk5Zl9qPyGjaK5cbYCCTJScdydV46YtXPo+2lK6e9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYFUjWIXSm5BoiX9qqkGPY3DZbe1Ux6jWsFf+dsp8l0=;
 b=OFL9nZFLZn+gMkl8z+fQ2sPzEguNvRqHmNDHfQZ6vIr0n6xK0oFiadLxoohcRN9kljjg8R3RWd2dfIRlB5iSXY8QPTXtIf9vXz0E2qyYmyugqGNu7d4zWOA5JY1MvbL7r8DaFLMePlJY+C/jmb9QRT51P19a1+umh8AwaJPDgGhq96ekxjVgCPCeFWb2Lgf3wOZ+y8L7xMZ+AyfUx7vJ9jPQlkyesxoOYHuvtupDTjYHnkmAay8rO72HmUP0Qzd771NBId1NPZ6OttxumOmZjsp6HS+h52ndnQpBZ8quIB7TaKmvWPmBk2wOkeeIn7jY5mO2ONVOOdD5eWYW9e+dvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYFUjWIXSm5BoiX9qqkGPY3DZbe1Ux6jWsFf+dsp8l0=;
 b=a2m04+EYfCt77mJM25+eh4xDxLUog3NOwy5TDN3kKDPcV+AbkrOb1p9TSupH4LI5vmZDChSL4FO58qA84DeE1viLzHxG2yGuLK+DXvU4VK8Anp1N3sSOkXmP8ZSwDspCmbwSyrNR0AovOkz6AEA5yhV449MuSwFOBlvdH/WBAnM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Date: Fri,  1 Apr 2022 16:37:18 +0200
Message-ID: <20220401143720.23160-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401143720.23160-1-roger.pau@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 398b9176-914b-4117-c300-08da13ed2c31
X-MS-TrafficTypeDiagnostic: SA2PR03MB5801:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB5801A6D49CA70207F67BF9D28FE09@SA2PR03MB5801.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rMgUV8luy/9rdP4h1BCBbx8uyNbcp6sArcm5MB1MuP9Q6uyaggosJ2X1H1i/VzqYLLdPBnKVd/5jChCGNOd/RGP3I9a92SSGdYl2OogXbTjK6w0ppyS1QybPKqnL9hI8NQw/dpaPl2x3sLhaTWIfkeNbvlMdhPEXrY9OkO68yyZnA8zCZ9htl0igVQNTVSWGblOCoiukioSf5UgQ7OBfIlWOyUWX9M4DInQB4OUm3pknI5p/fMsVs4za4sj0+QL2k2PLZtv2/kIkBk5HOZ83Nm3CrqehraUN/KzPd2r8DtK/IxKZRkUGfGdwC1FDxvONgP1nP06KQs9+NYVbiP68UJW9u5Wn41aHCO1Mr2HLjeXewRjKeln9fGCmXVsdVd3iQ7PUq/JW6H063iNlv5XkL5JF2QVTkq6ldMPhZsrhIGcezP+6wVd6nSgrFFm63230udUe2RJi7dJbOazR8Lq+nC4kinlt/O2Z7Vhg41tVxdNQGr/FXYEBk0aG9NNQg0+ufzi2saU2g6lyLFKrjgYv8Z+6VtZ0Yvfm8qpWO5B/CAJwXMnjuiYq1nqK6wLiYHL4V55LELmDCDX2u786z7xu5gvkSKBs6xEjJEUoDk+4L5UgiNj43FUQKqVQroRB82AElKKdozQo5JsERoCE9RmuQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(66476007)(66556008)(36756003)(8936002)(6916009)(2906002)(66946007)(316002)(54906003)(508600001)(6486002)(6512007)(6506007)(6666004)(8676002)(4326008)(82960400001)(107886003)(186003)(38100700002)(83380400001)(26005)(2616005)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVdvWWhRekZCSm02ek1MV0NHREFDak14VGc0V0RqV0cvNWVNWGNKeDVXYndi?=
 =?utf-8?B?cWNELzZ1b3A1aGgydzVXSEhEUGptSUlBKzJQUXMrU0F1MG9xbENqbkdDVXhl?=
 =?utf-8?B?L2R2bVRoR0lBZEdTNGtUS1ZuVWI0MEVSNW9zcWQ1YXpqQVVSUHluOVhnTFlY?=
 =?utf-8?B?dXpIYVAvdzFjRXkwdlRxMlcxTFJiRXVjUkJORHhIcUlTRWtYYzRkS1RhTUdq?=
 =?utf-8?B?V09TRmFFbTZKTUVabmVYSm03Wk4vUks0Y0NBd3N6NUZpUnc5blUwbmwvNklT?=
 =?utf-8?B?b1BZY09GUkZES0gyemMxNTlVYWdrbDF1TGlnbU1kWEM3aklkNmhGSGtWOTVW?=
 =?utf-8?B?M2h3YlBMN2xmT0hqM1kxaEh6UHJLeHJZZzREZmZsZU5zZWt4Mm5qeHdVQytS?=
 =?utf-8?B?alZ2VUE1RGdrbmVPL1dtOVF5MU9LbWVEazBtYlUzS1M3T0VsT2I3MnNDS3VF?=
 =?utf-8?B?QXk0YnBwelB3TUpPWW1FOEhlQ29tWGRCY0prUk1LczAwZXRzZ2FVTmdoRXNO?=
 =?utf-8?B?MzV5MWVlY2tTSkhSNUhNejlHdDlwM2QyNnh3Y3c3dUxBSHpRdTJzQ3NLaVVo?=
 =?utf-8?B?bityMHBqeFRnazlKQXprd1ZyZTI3OUFBVk1UWDh5U1hYaS81TzJaTGF1dHhB?=
 =?utf-8?B?V0kvamtmeUMyTXVHUW42N0thTkVGVHVJMHJNN0taN00yd2tKbW9wR3dvRXRy?=
 =?utf-8?B?TllyTWNmTHB2TUV2dFcrUURvdlNuWHRRNzZ3c1VrNGNqbExOY1VWVktTampm?=
 =?utf-8?B?cVBqeTJ1MGVlaXc5SG1OYzBHMDI0dzZ1V05LWFZCQnBQcDhPcHg2VitOc2Nk?=
 =?utf-8?B?bXdoOWJvQmpQakZDb05YcFpWWTlZa3dZcVpMR3Y0UGloZjBvN1lvYUEzalFs?=
 =?utf-8?B?TXJxMW8xYTh1eTlpSU1KS3IrQURaRzJHSVZMRVJJdkwvVURSMlFmQXI4VXFt?=
 =?utf-8?B?cWpKSXFoRERvSFVIU1o4ZHhUaU4zTGdmcmhiY1NnYS85UWRpQjVOSWY2b0d6?=
 =?utf-8?B?ZmVNWGZHYUliWU1NMUphSDF6eFlvaHpzYysyNDFETTlmbkR0dFhHQyticklF?=
 =?utf-8?B?QnpXUFdIU0FLS2NkL1FhaVFEM0pOREJ6K3lHRGoybTU0UEpMWVVlQUF6RDJ4?=
 =?utf-8?B?KzdTUlBMVmFNbzdUckRWYUJ3M3BzMld0M3BWMk9Dd3BLb2ptMFZjdTNoSjhp?=
 =?utf-8?B?RTBhVEp4VlYyNmlTQ3BoU1lkdDlXemV1Rmwyd05vSXcrQ1p5Y0ZJTmF1djJO?=
 =?utf-8?B?UStTZXV5S0h2aE1xdDhYRUk1N2VyK29OSThHT2dMdURPZXZrNnVKK0NCODNo?=
 =?utf-8?B?WWtQeU9sZjA0VHZ5Y3V3d1VNMVoxNWhlMllxWkhyd09abkppK0RjTFdtelRF?=
 =?utf-8?B?ZUh0bmJENE0xdk1uNzk0TzByc3U1UDFZMUJSUmZ3NlFEMHBydFh4Y2MwOFR5?=
 =?utf-8?B?MHZwb1ZJNjBETDhYRXlBaUtuWHdBMGtqK3dCTWJhKzVpaENXZllFWlZaTDlm?=
 =?utf-8?B?eFByNXpTZnQyK3Fvc2RGOXZBR01kUVdadGE5M0d0SFErcG1DaGZPTEUvSW5X?=
 =?utf-8?B?RlhEYllJc1JyaVNMVlF6aEFSRVJRQUZoRVgxSWYzNS9Eam92cmNTY0FiWFE2?=
 =?utf-8?B?dXQrT0hTK0xWbXhDSElPMUVRazFTTGg1ZGVEQmlJYk5DaVVNTXJHMk54NFpT?=
 =?utf-8?B?RFZtSFNmRTFiZ1FyN3BMd2R3MUVJbGlsZGtSMkZ0cjRpRENuVzNZTDJGdnBU?=
 =?utf-8?B?S2JmZy8vZjlZK2czSWt4NWVId0RlSXMza0VwY3pRSHhmbFZYYzhWT0hjdzVF?=
 =?utf-8?B?NmhYcEEzdGh2MVE0M1FBSDM4TEFHTE91djdXUmFOQ2doSGpxREF1ZWxIeWtx?=
 =?utf-8?B?Y2NPUGIvaFVaMU5vYkIzbEhZbnUzUWZLb2VpK1V5RzhhUUtCTVB5cmdWanhs?=
 =?utf-8?B?d2lCQVJSVXE1NjR1WG8yMk1ndjJBUzY0S0YxclJMZit5UzRnMEdrczhHZVlR?=
 =?utf-8?B?WkFUSE0vQTRoR0t2RkNlMW9BdG52NGEyeGtUaXRyc0hJTC9ZV09DL0U3QkRG?=
 =?utf-8?B?ekE2Qm9INEROZVAvWmlCSk5wWG9Vb3lYOU1ROHRzZTBqN2FxaUxUdmorUnpk?=
 =?utf-8?B?d0VCdXE2UWpMVElrREJQUU5hdUNXa1lKcVVLTGVsS0pJZHkxSmRjcDUvNEg2?=
 =?utf-8?B?L1YwbDNrcGVOUkVKQzJHVnNXaVcvZlVmK0F6U0dPc2lZTDhpNXNvTE9jTnJO?=
 =?utf-8?B?MnpETHpiYTRpd1lnUUs4azAyeVVuWFhWbmRVdi9lMllsMHU0WldUODI2RVZ3?=
 =?utf-8?B?RzBQUG1xMjJaeDFpL2JBNXg2bFRHbHJtZFNtczlMOVhTYytJQWNvdHZoZCtn?=
 =?utf-8?Q?ZWynN3SdIeI31E00=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 398b9176-914b-4117-c300-08da13ed2c31
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 14:37:39.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQWgXkrvYaOfVKwH8TN5rMWOkvBVyleRLDzg+6Xmrk0qgDbTqPzYCJJnIRHHcuYkxvgHWK1+TPYQ/xhrNgQpDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5801
X-OriginatorOrg: citrix.com

Setting the fcf-protection=none option in EMBEDDED_EXTRA_CFLAGS in the
Makefile doesn't get it propagated to the subdirectories, so instead
set the flag in firmware/Rules.mk, like it's done for other compiler
flags.

Fixes: 3667f7f8f7 ('x86: Introduce support for CET-IBT')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/firmware/Makefile | 2 --
 tools/firmware/Rules.mk | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 53ed4f161e..345037b93b 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -6,8 +6,6 @@ TARGET      := hvmloader/hvmloader
 INST_DIR := $(DESTDIR)$(XENFIRMWAREDIR)
 DEBG_DIR := $(DESTDIR)$(DEBUG_DIR)$(XENFIRMWAREDIR)
 
-EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
-
 SUBDIRS-y :=
 SUBDIRS-$(CONFIG_OVMF) += ovmf-dir
 SUBDIRS-$(CONFIG_SEABIOS) += seabios-dir
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index 9f78a7dec9..efbbc73a45 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -13,6 +13,8 @@ endif
 
 CFLAGS += -Werror
 
+EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
+
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 # Extra CFLAGS suitable for an embedded type of environment.
-- 
2.35.1


